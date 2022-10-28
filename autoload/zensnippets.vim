" A state-machine-like parser. It takes a '.snippets' file and returns a hash
" with the snippets/expansions.
function! zensnippets#load(snippets_file) abort
  let snippets = {}
  let lines = readfile(a:snippets_file)
  let snippet = ''
  let expansion = ''

  for line in lines
    if line == '[snippet]'
      let capturing = 'snippet'
    elseif line == '[expansion]'
      let capturing = 'expansion'
    else
      if line == ''
        continue
      endif

      if capturing == 'snippet'
        if snippet != ''
          let snippets[snippet] = expansion
        endif

        let snippet = line
        let expansion = ''
      else
        if expansion == ''
          let expansion = trim(line)
        else
          let expansion = expansion . "\<CR>" . trim(line)
        endif
      endif
    endif
  endfor

  if snippet != ''
    let snippets[snippet] = expansion
  endif

  return snippets
endfunction

function! zensnippets#setup(snippet_file) abort
  if exists('b:snippets')
    call extend(b:snippets, zensnippets#load(a:snippet_file))
  else
    let b:snippets = zensnippets#load(a:snippet_file)
  endif
endfunction

function! zensnippets#getword() abort
  let line = getline('.')
  let start = col('.') - 1
  while start > 0 && line[start - 1] =~ '\a'
    let start -= 1
  endwhile

  return line[start:col('.') - 2]
endfunction

function! zensnippets#expand() abort
  if !exists('b:snippets')
    return
  endif

  let word = zensnippets#getword()
  if has_key(b:snippets, word)
    return "\<C-w>" . b:snippets[word] . "\<Esc>:call search('{=[^=]*=}')\<CR>va{"
  else
    echo '[Zensnippets] Snippet "' . word . '" not found'
    return ''
  endif
endfunction

function! zensnippets#showall() abort
  if !exists('b:snippets')
    echo '[Zensnippets] No snippets defined for this filetype'
    return
  endif

  for snippet in sort(keys(b:snippets))
    let lines = split(b:snippets[snippet], "\<CR>")
    let first_line = lines[0]
    if len(lines) > 1
      echo snippet . "\t" . first_line . '...'
    else
      echo snippet . "\t" . first_line
    endif
  endfor
endfunction
