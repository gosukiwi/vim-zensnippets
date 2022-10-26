if exists('b:zensnippets_html_loaded')
  finish
endif
let b:zensnippets_html_loaded = 1

let snippet_file = simplify(expand('<sfile>:p:h') . '/../snippets/html.snippets')
call zensnippets#setup(snippet_file)
