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
          let expansion = expansion . '<CR>' . trim(line)
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
  let b:snippets = zensnippets#load(a:snippet_file)
  for snippet in keys(b:snippets)
    " Snippets use `:help inoreabbrev` to make abbreviations. In order to not
    " expand while typing, it uses a special, rarely-used character: ^A
    " (CTRL-A). In the mapping, it's inserted using `<C-v><C-a>`.
    "
    " In order to expand a mapping manually, you must type the abbreviation, and
    " then press `<C-a>`. This is handled by the plugin mappings.
    execute "inoreabbrev <buffer> " . snippet . " " . b:snippets[snippet]
  endfor
endfunction

function! zensnippets#getwordstart() abort
  let line = getline('.')
  let start = col('.') - 1
  while start > 0 && line[start - 1] =~ '\a'
    let start -= 1
  endwhile

  return line[start:]
endfunction

function! zensnippets#expand() abort
  let word = zensnippets#getwordstart()
  if has_key(b:snippets, word)
    return "\<Plug>ZensnippetsExpand"
  else
    echo 'Zensnippets: Snippet not found'
    return ''
  endif
endfunction
