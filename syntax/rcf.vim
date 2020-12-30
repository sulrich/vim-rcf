if exists("b:current_syntax")
    finish
endif


" syntax/rcf.vim

" @-@ adds the literal @ to iskeyword for @IBAction and similar
setlocal iskeyword+=?,!,#
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
"setlocal completefunc=syntaxcomplete#Complete

" match TODO comments
syntax match rcfComment "#.*$" contains=rcfTodos
syntax keyword rcfTodos TODO XXX FIXME NOTE

" Match language specific keywords
syntax keyword rcfFuncKeywords
  \ add
  \ all_in
  \ any 
  \ as_path
  \ as_path_list
  \ community
  \ community_list
  \ else
  \ ext_community
  \ ext_community_list
  \ false
  \ function
  \ has_all
  \ has_any 
  \ has_none
  \ if
  \ igp
  \ local_preference
  \ med
  \ next_hop
  \ origin
  \ permit
  \ prefix
  \ prefix_list_v4
  \ prefix_list_v6
  \ remove
  \ retain
  \ return
  \ true

syntax match rcfOperator "\v\<\="
syntax match rcfOperator "\v\<"
syntax match rcfOperator "\v\>\="
syntax match rcfOperator "\v\>"
syntax match rcfOperator "\v\?\?"


syntax keyword rcfOperator 
  \ and
  \ is
  \ match 
  \ match_exact 
  \ or 

" Match all rcf number types
syntax match rcfNumber "\v<\d+>"
syntax match rcfNumber "\v<\d+\.\d+>"
syntax match rcfNumber "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax match rcfNumber "\v<0x\x+([Pp]-?)?\x+>"
syntax match rcfNumber "\v<0b[01]+>"
syntax match rcfNumber "\v<0o\o+>"


" MATCH STRINGS
syntax region rcfString start='"' end='"' contained

syntax region rcfFuncBlock start='{' end='}' fold transparent contains=ALLBUT,function


" set highlights
highlight default link rcfTodos Todo
highlight default link rcfShebang Comment
highlight default link rcfComment Comment
highlight default link rcfMarker Comment

highlight default link rcfFuncBlock Statement

highlight default link rcfString String
highlight default link rcfInterpolatedWrapper Delimiter
highlight default link rcfNumber Number
highlight default link rcfBoolean Boolean

highlight default link rcfOperator Operator
highlight default link rcfFuncKeywords Keyword
highlight default link rcfAttributes PreProc
highlight default link rcfStructure Structure
highlight default link rcfType Type
highlight default link rcfImports Include
highlight default link rcfPreprocessor PreProc


let b:current_syntax = "rcf"


