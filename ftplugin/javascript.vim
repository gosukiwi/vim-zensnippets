if exists('b:zensnippets_loaded')
  finish
endif
let b:zensnippets_loaded = 1

let snippet_file = simplify(expand('<sfile>:p:h') . '/../snippets/javascript.snippets')
call zensnippets#setup(snippet_file)
