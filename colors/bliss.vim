hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="bliss"

hi Normal guifg=#000000 guibg=#ffface

" highlight groups
hi Cursor		guibg=#000000 guifg=#ffffff
hi CursorLine	guibg=#000000
"hi CursorLine	guibg=#3e4446
hi CursorColumn	guibg=#464646

"hi DiffText     guibg=#4e9a06 guifg=#FFFFFF gui=bold
"hi DiffChange   guibg=#4e9a06 guifg=#FFFFFF gui=bold
"hi DiffAdd      guibg=#204a87 guifg=#FFFFFF gui=bold
"hi DiffDelete   guibg=#5c3566 guifg=#FFFFFF gui=bold

hi DiffAdd         guifg=#ffcc7f guibg=#a67429 gui=none
hi DiffChange      guifg=#7fbdff guibg=#425c78 gui=none
hi DiffText        guifg=#8ae234 guibg=#4e9a06 gui=none
"hi DiffDelete      guifg=#252723 guibg=#000000 gui=none
hi DiffDelete      guifg=#000000 guibg=#000000 gui=none
"hi ErrorMsg

hi Number		guifg=#cd4500

hi Folded		guibg=#000000 guifg=#FFFFFF gui=bold
hi vimFold		guibg=#000000 guifg=#FFFFFF gui=bold
hi FoldColumn	guibg=#000000 guifg=#FFFFFF gui=bold

hi LineNr		guifg=#6b6b6b guibg=#ffface
hi NonText		guifg=#6b6b6b guibg=#ffface
hi Folded		guifg=#535353 guibg=#202020 gui=bold
hi FoldeColumn  guifg=#535353 guibg=#202020 gui=bold
"hi VertSplit	guibg=#ffffff guifg=#ffffff gui=none

hi VertSplit	guibg=#003270 guifg=#ffffff gui=none
hi StatusLine   guifg=#FFFFFF guibg=#003270 gui=none
hi StatusLineNC guifg=#cccccc guibg=#003270 gui=none

hi ModeMsg		guifg=#003270
hi MoreMsg		guifg=#003270
hi Visual		guifg=#FFFFFF guibg=#003270 gui=none
hi VisualNOS    guifg=#FFFFFF guibg=#003270 gui=none
hi IncSearch	guibg=#FFFFFF guifg=#ef5939
hi Search		guibg=#ad7fa8 guifg=#FFFFFF
hi SpecialKey	guifg=#8ae234

hi Title		guifg=#aa0000
hi WarningMsg	guifg=#aa0000
hi Number		guifg=#cd4500

hi MatchParen	guibg=#003270 guifg=#FFFFFF
hi Comment		guifg=#6b6b6b
hi Constant		guifg=#aa0000
hi Identifier	guifg=#003270
hi Statement	guifg=#000000 gui=bold
hi PreProc		guifg=#000000 gui=bold
hi Type			guifg=#006500 gui=bold
hi Special		guifg=#aa009c
hi Underlined	guifg=#aa009c gui=underline
hi Todo			guifg=#aa0000 guibg=#ffface
hi Operator guifg=#000000 gui=bold
hi Structure guifg=#000000 gui=bold
hi StorageClass guifg=#003270 gui=bold
hi Error guifg=#ffffff guibg=#aa0000

"hi WildMenu     guibg=#2e3436 guifg=#ffffff gui=bold
"hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none
hi WildMenu     guifg=#ffffff guibg=#3465a4 gui=none

hi Pmenu        guibg=#000000 guifg=#c0c0c0
hi PmenuSel     guibg=#3465a4 guifg=#ffffff
hi PmenuSbar    guibg=#444444 guifg=#444444
hi PmenuThumb   guibg=#888888 guifg=#888888 

"hi cppSTLType   guifg=#729fcf gui=bold

hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#ad7fa8
hi spellLocal   guisp=#729fcf

"hi link cppSTL          Function
hi link Character		Number
hi link rubySymbol		Number
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant

" tabs (non gui)
hi TabLine		guifg=#A3A3A3 guibg=#202020 gui=none
hi TabLineFill	guifg=#535353 guibg=#202020 gui=none
hi TabLineSel	guifg=#FFFFFF gui=bold
"hi TabLineSel	guifg=#FFFFFF guibg=#000000 gui=bold
" vim: sw=4 ts=4

hi Directory guifg=#aa0000 gui=bold
hi Question guifg=#006500
hi SpecialKey guifg=#006500
