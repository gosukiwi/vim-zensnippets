" [zensnippets]
" ==============================================================================
" A really simple snippet implementation.

" Base mappings for expansion and placeholder navigation
nnoremap <Plug>ZensnippetsNextPlaceholder :call search('{%[^%]*%}')<CR>va{
imap <Plug>ZensnippetsExpand <C-v><C-a><C-]><Esc><Plug>ZensnippetsNextPlaceholder

" Expand snippet with `<C-x><C-\>`. Go to next placeholder with `<C-\>`.
imap <silent> <C-x><C-\> <Plug>ZensnippetsExpand
nmap <silent> <C-\> <Plug>ZensnippetsNextPlaceholder
imap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
vmap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
