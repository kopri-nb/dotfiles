" Custom vim colorscheme, terminal only

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "custom"
hi Normal		ctermfg=none			ctermbg=none
hi NonText		ctermfg=8
hi comment		ctermfg=7				ctermbg=none
hi constant		ctermfg=cyan
hi identifier	ctermfg=yellow
hi statement	ctermfg=blue			ctermbg=none
hi preproc		ctermfg=darkcyan
hi type			ctermfg=green			ctermbg=none
hi special		ctermfg=magenta			ctermbg=none
hi Underlined	ctermfg=blue			cterm=underline
hi label		ctermfg=darkyellow
hi operator		ctermfg=darkmagenta		ctermbg=none

hi ErrorMsg		ctermfg=red
hi WarningMsg	ctermfg=red
hi ModeMsg		ctermfg=none
hi MoreMsg		ctermfg=none
hi Error		ctermfg=red ctermbg=darkred

hi Todo			ctermfg=black	ctermbg=white
hi Cursor		ctermfg=black	ctermbg=8
hi Search		ctermfg=black	ctermbg=white
hi IncSearch	ctermfg=black	ctermbg=white
hi LineNr		ctermfg=8 	ctermbg=black
hi title		cterm=bold

"hi StatusLineNC	gui=NONE	guifg=black guibg=blue	ctermfg=black  ctermbg=blue
"hi StatusLine	gui=bold	guifg=cyan	guibg=blue	ctermfg=cyan   ctermbg=blue
hi VertSplit	ctermfg=blue	ctermbg=blue

hi CursorLine 	cterm=none ctermbg=black ctermfg=none
hi CursorLineNr cterm=none ctermbg=black ctermfg=lightGrey

hi Visual		term=reverse		ctermfg=black	ctermbg=darkCyan

hi DiffChange	ctermbg=darkGreen	ctermfg=black
hi DiffText		ctermbg=lightGreen	ctermfg=black
hi DiffAdd		ctermbg=blue		ctermfg=black
hi DiffDelete   ctermbg=cyan		ctermfg=black

hi Folded		ctermbg=yellow		ctermfg=black
hi FoldColumn	ctermbg=gray		ctermfg=black
hi cIf0			ctermfg=gray

