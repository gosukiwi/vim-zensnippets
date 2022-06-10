" [zensnippets]
" ==============================================================================
" A really simple snippet implementation.

" Expand snippet with `<C-x><C-\>`. Go to next placeholder with `<C-\>`.
nnoremap <Plug>GoToNextPlaceholder :call search('{%[^%]*%}')<CR>va{
imap <silent> <C-x><C-\> <C-v><C-a><C-]><Esc><Plug>GoToNextPlaceholder
nmap <silent> <C-\> <Plug>GoToNextPlaceholder
imap <silent> <C-\> <Esc><Plug>GoToNextPlaceholder
vmap <silent> <C-\> <Esc><Plug>GoToNextPlaceholder

" To be able to insert text without Vim' indentation messing around
" formatting, we enable/disable paste mode. The easiest way is to simply use
" the `pastetoggle` mapping. We set it to `<F12>` here.
set pastetoggle=<F12>
