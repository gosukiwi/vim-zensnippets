" [zensnippets]
" ==============================================================================
" A really simple snippet implementation.

" Base mappings for snippet expansion and placeholder navigation
nnoremap <Plug>ZensnippetsNextPlaceholder :call search('{%[^%]*%}')<CR>va{
imap <Plug>ZensnippetsExpand <C-v><C-a><C-]><Esc><Plug>ZensnippetsNextPlaceholder

if !exists('g:zensnippets_disable_default_mappings') || g:zensnippets_disable_default_mappings == 0
  " Expand snippet with `<C-x><C-\>`. Go to next placeholder with `<C-\>`.
  imap <silent><expr> <C-x><C-\> zensnippets#expand()
  nmap <silent> <C-\> <Plug>ZensnippetsNextPlaceholder
  imap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
  vmap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
endif
