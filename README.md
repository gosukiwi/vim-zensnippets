# zensnippets.vim
A minimal snippets implementation for Vim. No dependencies.

Expand snippets with `<C-x><C-\>`, navigate placeholders with `<C-\>`.
Customize mappings with:

```
let g:zensnippets_disable_default_mappings = 1
imap <silent> <C-x><C-\> <Plug>ZensnippetsExpand
nmap <silent> <C-\> <Plug>ZensnippetsNextPlaceholder
imap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
vmap <silent> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
```

You can see all available snippets in the [snippets directory](snippets). Feel
free to create PRs with your favorite mappings and suggestions!

For more information, see the [plugin's documentation](doc/zensnippets.txt)
online or inside Vim with `:help zensnippets`.
