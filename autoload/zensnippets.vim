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
          let expansion = line
        else
          let expansion = expansion . '<CR>' . line
        endif
      endif
    endif
  endfor

  if snippet != ''
    let snippets[snippet] = expansion
  endif

  return snippets
endfunction

function! zensnippets#expand(expansion) abort
  return '<F12>' . a:expansion . '<F12>'
endfunction

function! zensnippets#setup(snippets) abort
  for snippet in keys(a:snippets)
    " Snippets use `:help inoreabbrev` to make abbreviations. In order to not
    " expand while typing, it uses a special, rarely-used character: ^A
    " (CTRL-A). In the mapping, it's inserted using `<C-v><C-a>`.
    "
    " In order to expand a mapping manually, you must type the abbreviation, and
    " then press `<C-a>`. This is handled by the plugin mappings.
    execute "inoreabbrev <buffer> " . snippet . " " . zensnippets#expand(a:snippets[snippet])
  endfor
endfunction
