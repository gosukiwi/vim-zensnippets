if exists('b:zensnippets_typescriptreact_loaded')
  finish
endif
let b:zensnippets_typescriptreact_loaded = 1

let snippet_file = simplify(expand('<sfile>:p:h') . '/../snippets/javascriptreact.snippets')
call zensnippets#setup(snippet_file)
