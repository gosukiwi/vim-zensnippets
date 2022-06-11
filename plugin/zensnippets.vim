" [zensnippets]
" ==============================================================================
" A really simple snippet implementation.

" Base mapping for placeholder navigation
nnoremap <Plug>ZensnippetsNextPlaceholder :call search('{%[^%]*%}')<CR>va{

if !exists('g:zensnippets_disable_default_mappings') || g:zensnippets_disable_default_mappings == 0
  " Expand snippet. Using `<expr>` triggers recursive mappings, so use
  " expression register instead.
  imap <silent> <C-x><C-\> <C-r>=zensnippets#expand()<CR>

  " Go to next placeholder
  nmap <silent> <C-\> <Plug>ZensnippetsNextPlaceholder
  imap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
  vmap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder

  " List all available snippets for the current buffer
  inoremap <silent> <C-x><C-x><C-\> <C-o>:call zensnippets#showall()<CR>
  nnoremap <silent> <C-x><C-x><C-\> :call zensnippets#showall()<CR>
endif

command! Zensnippets call zensnippets#showall()
