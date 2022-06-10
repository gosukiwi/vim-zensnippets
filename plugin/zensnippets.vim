" [zensnippets]
" ==============================================================================
" A really simple snippet implementation.

" Base mappings for snippet expansion and placeholder navigation
nnoremap <Plug>ZensnippetsNextPlaceholder :call search('{%[^%]*%}')<CR>va{
imap <Plug>ZensnippetsExpand <C-v><C-a><C-]><Esc><Plug>ZensnippetsNextPlaceholder

if !exists('g:zensnippets_disable_default_mappings') || g:zensnippets_disable_default_mappings == 0
  " Expand snippet
  imap <silent><expr> <C-x><C-\> zensnippets#expand()

  " Go to next placeholder
  nmap <silent> <C-\> <Plug>ZensnippetsNextPlaceholder
  imap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
  vmap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder

  " List all available snippets for the current buffer
  inoremap <silent> <C-x><C-x><C-\> <C-o>:call zensnippets#showall()<CR>
  nnoremap <silent> <C-\> :call zensnippets#showall()<CR>
endif

command! Zensnippets call zensnippets#showall()
