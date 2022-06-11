# zensnippets.vim
A minimal snippets implementation for Vim. No dependencies.

[![asciicast](https://asciinema.org/a/qAmvsXUGVi713UC15tntVZy4t.svg)](https://asciinema.org/a/qAmvsXUGVi713UC15tntVZy4t)

Expand snippets with `<C-x><C-\>`, navigate placeholders with `<C-\>`.

Customize mappings with:

```
let g:zensnippets_disable_default_mappings = 1

" Expand snippet
imap <silent><expr> <C-x><C-\> zensnippets#expand()

" Go to next placeholder
nmap <silent> <C-\> <Plug>ZensnippetsNextPlaceholder
imap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
vmap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder

" List all available snippets for the current buffer
inoremap <silent> <C-x><C-x><C-\> <C-o>:call zensnippets#showall()<CR>
nnoremap <silent> <C-x><C-x><C-\> :call zensnippets#showall()<CR>
```

To see all available snippets in the current buffer you can use `<C-\>` in
normal mode, or `<C-x><C-x><C-\>` in insert mode. Alternatively, just call the
`:Zensnippets` command.

You can see all available snippets in the [snippets directory](snippets). Feel
free to create PRs with your favorite mappings and suggestions!

For more information, see the [plugin's documentation](doc/zensnippets.txt)
online or inside Vim with `:help zensnippets`.
