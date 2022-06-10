" [zensnippets]
" ==============================================================================
" A really simple snippet implementation.

" Expand snippet with `<C-x><C-\>`. Go to next placeholder with `<C-\>`.
nnoremap <Plug>GoToNextPlaceholder :call search('{%[^%]*%}')<CR>va{
imap <silent> <C-x><C-\> <C-v><C-a><C-]><Esc><Plug>GoToNextPlaceholder
nmap <silent> <C-\> <Plug>GoToNextPlaceholder
imap <silent> <C-\> <Esc><Plug>GoToNextPlaceholder
vmap <silent> <C-\> <Esc><Plug>GoToNextPlaceholder
