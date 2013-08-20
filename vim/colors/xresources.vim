" Vim color file
"
" Author: Christian Brassat <christian@crshd.cc>
"
" Note: Based on my Xdefaults colors, will be updated
" when I update my Xdefaults
"

hi clear

set background=dark
if version > 580
" no guarantees for version 5.8 and below, but this makes it stop
" complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="xdefaults"

hi Boolean ctermfg=10
hi Character ctermfg=4
hi Number ctermfg=10
hi String ctermfg=15
hi Conditional ctermfg=112
hi Constant ctermfg=202
hi Cursor ctermfg=16 ctermbg=1
hi Debug ctermfg=225 cterm=none
hi Define ctermfg=1
hi Delimiter ctermfg=241
hi DiffAdd ctermfg=2 ctermbg=232
hi DiffChange ctermfg=4 ctermbg=232
hi DiffDelete ctermfg=1 ctermbg=232
hi DiffText ctermbg=232

hi Directory ctermfg=12
hi Error ctermfg=233 ctermbg=1
hi ErrorMsg ctermfg=9 ctermbg=233
hi Exception ctermfg=3
hi Float ctermfg=2
hi FoldColumn ctermfg=232 ctermbg=235
hi Folded ctermfg=232 ctermbg=235
hi Function ctermfg=255
hi Identifier ctermfg=2
hi Ignore ctermfg=3 ctermbg=232
hi IncSearch ctermfg=3 ctermbg=16

hi Keyword ctermfg=1 cterm=none
hi Label ctermfg=229
hi Macro ctermfg=193
hi SpecialKey ctermfg=81

hi MatchParen ctermfg=233 ctermbg=202
hi ModeMsg ctermfg=229
hi MoreMsg ctermfg=229
hi Operator ctermfg=13

" complete menu
hi Pmenu ctermfg=81 ctermbg=16
hi PmenuSel ctermbg=244
hi PmenuSbar ctermbg=232
hi PmenuThumb ctermfg=81

hi PreCondit ctermfg=10 cterm=bold
hi PreProc ctermfg=10
hi Question ctermfg=81
hi Repeat ctermfg=13 cterm=bold
hi Search ctermfg=253 ctermbg=66
" marks column
hi SignColumn ctermfg=10 ctermbg=235
hi SpecialChar ctermfg=13 cterm=bold
hi SpecialComment ctermfg=245
hi Special ctermfg=11
hi SpecialKey ctermfg=245
hi Statement ctermfg=1

hi StorageClass ctermfg=10
hi Structure ctermfg=81
hi Tag ctermfg=13
hi Title ctermfg=166
hi Todo ctermfg=231 ctermbg=232 cterm=bold

hi Typedef ctermfg=1
hi Type ctermfg=14 cterm=none
hi Underlined ctermfg=244 cterm=underline

hi TabLine ctermfg=241 ctermbg=234 cterm=none
hi TabLineFill ctermbg=234	cterm=none
hi VertSplit ctermfg=234 ctermbg=234 cterm=none
hi VisualNOS ctermbg=235
hi Visual ctermbg=235
hi WarningMsg ctermfg=231 ctermbg=238 cterm=bold
hi WildMenu ctermfg=59 ctermbg=15

hi Normal ctermfg=248
hi Comment ctermfg=241	cterm=none
hi CursorLine ctermbg=234 cterm=none
hi CursorColumn ctermbg=235
hi LineNr ctermfg=238 ctermbg=233
hi NonText ctermfg=250

" Status line - changes colors depending on insert mode
" Standard
hi User1 ctermfg=3 ctermbg=235 cterm=bold
hi User2 ctermfg=1 ctermbg=235 cterm=bold
hi User3 ctermfg=2 ctermbg=235 cterm=bold
hi User4 ctermfg=234 ctermbg=3 cterm=bold
hi User5 ctermfg=250 ctermbg=235 cterm=none
hi User6 ctermfg=233	ctermbg=235	cterm=none
hi User7 ctermfg=233	ctermbg=235	cterm=bold
hi StatusLine ctermfg=228 ctermbg=235 cterm=bold
hi StatusLineNC ctermfg=228 ctermbg=235 cterm=bold

function! InsertStatuslineColor(mode)

  if a:mode == 'i' " Insert Mode
    hi User4 ctermfg=234 ctermbg=4

  elseif a:mode == 'r' " Replace Mode
    hi User4 ctermfg=234 ctermbg=1

  else
    hi User4 ctermfg=234 ctermbg=3

  endif
endfunction

" Call function
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=228 ctermbg=235
au InsertLeave * hi User4 ctermfg=234 ctermbg=3