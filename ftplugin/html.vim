if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let snippet_file = simplify(expand('<sfile>:p:h') . '/../snippets/html.snippets')
let snippets = zensnippets#load(snippet_file)

call zensnippets#setup(snippets)
