"
" Lightweight "stay-out-of-your-way" TeX-to-PDF building support.
" Author: Jeet Sukumaran
"
" Description
" ===========
"
" This plugin provides support for specialized lightweight
" "stay-out-of-your-way" TeX-to-PDF compilation and viewing.  In contrast to
" some of the other more comprehensive TeX/LaTeX suites, it provides nothing
" else but two commands, and leaves the rest of your Vim platform undisturbed,
" except for a few key maps to invoke the commands.
"
" Features
" ========
"
"     - Runs "make" if a Makefile is found, otherwise invokes Rubber (if
"       installed) or pdflatex (otherwise) on the current file.
"     - Successful builds will result in PDF being opened/refreshed in the
"       default external viewer.
"     - Unsuccessful builds will result in the QuickFix buffer being opened and
"       to list the errors, with line numbers, description etc.
"
" Usage
" =====
" Once the plugin is installed (see below), when you have a TeX or LaTeX document
" open in the buffer, type '\r' or <Shift-F9> to compile the document and open
" (or refresh) the resulting PDF in your system's default PDF viewer. To just
" compile the document to PDF without opening it, type '\m' or <F9>.  If there
" are any compile errors, a window will open and list all the problematic lines.
" As usual, you can navigate forward and backward through this list using the
" ':cnext' and ':cprev' commands, and you will automatically be taken to the
" corresponding line in the source document.
"
" Working with Rubber
" ===================
"
" This plugin will work quite happily with the stock TeX/LaTeX tools found on
" most systems. As described above, for example, this plugin will run "make"
" if a Makefile is found in the current working directory (by-passing Rubber,
" even if installed), and fall back to the standard "pdflatex" if Rubber is
" not installed.
"
" However, installation of "Rubber" (https://launchpad.net/rubber) in
" conjunction with this plugin makes Vim a *very* powerful, yet highly
" ergonomic and non-intrusive, LaTeX IDE, making Makefiles unneccessary for
" many document projects. Rubber takes care of the multiple TeX compile passes
" required to get the the bibliographies, references, cross-references, etc.
" correctly built, while this plug-in takes care of opening/refreshing the PDF
" view on successful builds, as well as providing for a *clean* view of the
" errors on an unsuccessful build.

" Operation
" =========
"
" This plugin provides two commands: "BuildAndViewTexPdf" and "BuildTexPdf".
"
" "BuildAndViewTexPdf" will build the PDF from the TeX source, and, if
" successful, will open the resulting PDF for viewing in an external viewer
" (or refresh the PDF if already opened).
"
" "BuildTexPdf" will build the PDF from the TeX source without
" opening/refreshing the PDF.
"
" The build logic is: (1) If a Makefile is found in the current directory,
" then "make" will be invoked.  (2) If there is no Makefile in the current
" directory, but "Rubber" (https://launchpad.net/rubber) is installed and
" available, then this will invoked on the current buffer file.  (3) If Rubber
" is not installed, then "pdflatex" will be invoked on the current buffer
" file.
"
" If the build is unsuccessful, the QuickFix buffer is populated with the
" (parsed, cleaned, and filtered) error messages and automatically opened,
" showing, for each error, the line number and description of the error. You
" can then used ":cnext", ":cprev", etc. to visit each of the error lines.
"
" Key Mapping
" ===========
"
" By default, '<Leader>r' (mnemonic: 'run') and '<S-F9>' are mapped to
" "BuildAndViewTexPdf", while '<Leader>m' (mnemonic: 'make') and '<F9>' are
" mapped to "BuildTexPdf"
"
" If you prefer not to have any of the above keys mapped, then include the
" following in your '~/.vimrc':
"
"     let g:tex_pdf_map_keys = 0
"
" If you prefer not to have the '\r' and '\m' leader keys mapped but keep the
" function key mapping, you can include the following in your '~/.vimrc':
"
"     let g:tex_pdf_map_leader_keys = 0
"
" Alternatively, you can keep the leader keys mapped but by-pass the function
" key mapping by including the following in your '~/.vimrc':
"
"     let g:tex_pdf_map_func_keys = 0
"
" You can, of course, map any keys that you want to the commands. For example,
" by including the following in your '~/.vimrc', you will map Command-V to
" "compile and view" command and Command-T to the "just compile" command in
" both normal and insert modes:
"
"     noremap <silent> <D-V> <Esc>:BuildAndViewTexPdf<CR>
"     inoremap <silent> <D-V> <Esc>:BuildAndViewTexPdf<CR>
"     noremap <silent> <D-T> <Esc>:BuildTexPdf<CR>
"     inoremap <silent> <D-T> <Esc>:BuildTexPdf<CR>
"
" Installation
" ============
"
" To install this plugin, copy this file to "./vim/ftplugin/tex".

if exists('b:tex_pdf_mapped')
	finish
endif

let b:tex_pdf_mapped = 1

" Define commands.
command! -buffer -nargs=* BuildTexPdf call s:BuildTexPdf(0, <f-args>)
command! -buffer -nargs=* BuildAndViewTexPdf call s:BuildTexPdf(1, <f-args>)

" Map keys.
if !exists("g:tex_pdf_map_keys") || g:tex_pdf_map_keys
    if !exists("g:tex_pdf_map_leader_keys") || g:tex_pdf_map_leader_keys
        noremap <buffer> <silent> <Leader>m <Esc>:BuildTexPdf<CR>
        noremap <buffer> <silent> <Leader>r <Esc>:BuildAndViewTexPdf<CR>
    endif
    if !exists("g:tex_pdf_map_func_keys") || g:tex_pdf_map_func_keys
        noremap <buffer> <silent> <F9> <Esc>:BuildTexPdf<CR>
        noremap <buffer> <silent> <S-F9> <Esc>:BuildAndViewTexPdf<CR>
        inoremap <buffer> <silent> <F9> <Esc>:BuildTexPdf<CR>
        inoremap <buffer> <silent> <S-F9> <Esc>:BuildAndViewTexPdf<CR>
    endif
endif

if exists('g:tex_pdf_loaded')
    finish
endif
let g:tex_pdf_loaded = 1

" Compile and View {{{1
" -----------------------------------------------------------------------------

function! <SID>BuildTexPdf(view_results, ...)

    " record position
    let save_cursor = getpos(".")

    " save work
    silent write

    " From: http://stackoverflow.com/questions/2679475/vim-script-to-compile-tex-source-and-launch-pdf-only-if-no-errors
    " If your shell is bash, you can use the ${PIPESTATUS} array variable to get
    " the correct exit code (borrowed from this answer to another question).
    silent setlocal shell=bash
    silent setlocal shellpipe=2>&1\ \|\ tee\ %s;exit\ \${PIPESTATUS[0]}

    let success = 1
    call setqflist([]) " clear quickfix
    if filereadable("Makefile")
        " If Makefile is available in current working directory, run 'make' with arguments
        echon "compiling using Makefile ..."
        let l:makecmd = "make\\ ".join(a:000, '\\ ')
        silent execute "setlocal makeprg=" . l:makecmd
        try
            call s:SetLatexEfm()
        catch /E117/
            set errorformat=%E!\ LaTeX\ %trror:\ %m,
                \%E!\ %m,
                \%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
                \%+W%.%#\ at\ lines\ %l--%*\\d,
                \%WLaTeX\ %.%#Warning:\ %m,
                \%Cl.%l\ %m,
                \%+C\ \ %m.,
                \%+C%.%#-%.%#,
                \%+C%.%#[]%.%#,
                \%+C[]%.%#,
                \%+C%.%#%[{}\\]%.%#,
                \%+C<%.%#>%.%#,
                \%C\ \ %m,
                \%-GSee\ the\ LaTeX%m,
                \%-GType\ \ H\ <return>%m,
                \%-G\ ...%.%#,
                \%-G%.%#\ (C)\ %.%#,
                \%-G(see\ the\ transcript%.%#),
                \%-G\\s%#,
                \%+O(%f)%r,
                \%+P(%f%r,
                \%+P\ %\\=(%f%r,
                \%+P%*[^()](%f%r,
                \%+P[%\\d%[^()]%#(%f%r,
                \%+Q)%r,
                \%+Q%*[^()])%r,
                \%+Q[%\\d%*[^()])%r
        endtry
        silent make
    else
        let l:special_tex_compiler = "rubber"
        if executable(l:special_tex_compiler)
            echon "compiling with Rubber ..."
            silent execute "setlocal makeprg=" . l:special_tex_compiler . "\\ -dfsq\\ %"
            setlocal errorformat=%f:%l:\ %m
            silent make %
        else
            echon "compiling ..."
            let b:tex_flavor = 'pdflatex'
            compiler tex
            setlocal makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ '
            setlocal errorformat=%f:%l:\ %m
            silent make %
        endif
    endif

    " redraw vim
    :redraw!

    " set/report compile status
    if v:shell_error
        let l:success = 0
        if len(getqflist()) > 0
            copen   " open quickfix window
            1cc     " go to first error
        else
            echohl WarningMsg
            echomsg "compile failed with errors"
            echohl None
        endif
    else
        let l:success = 1
        cclose
        call setpos('.', save_cursor)
        redraw
        echon "successfully compiled"
    endif

    " view results if successful compile
    if l:success && a:view_results
        call s:ViewTexPdf()
    endif

endfunction

function! <SID>ViewTexPdf(...)
    if a:0 == 0
        let l:target = expand("%:p:r") . ".pdf"
    else
        let l:target = a:1
    endif
    if has('mac')
        silent execute "! open ".l:target
    elseif has('win32') || has ('win64')
        silent execute "! start ".l:target
    else
        if executable('xdg-open')
            silent execute "! xdg-open ".l:target
        elseif executable('gnome-open')
            silent execute "! gnome-open ".l:target
        elseif executable('kfmclient')
            silent execute "! kfclient exec ".l:target
        elseif executable('see')
            silent execute "! see ".l:target
        elseif executable('cygstart')
            silent execute "! cygstart ".l:target
        endif
    endif
    if v:shell_error
        redraw!
    endif
endfunction

" 1}}}

" Error Message Filtering and Parsing {{{1
" =============================================================================
"
" DIRECTLY LIFTED FROM:
" Vim-Latex
" (http://vim-latex.sourceforge.net/)
" By Srinath Avadhanula and Mikolaj Machowski.
" The functions in this section are under the copyright of Srinath Avadhanula and Mikolaj Machowski.

" This section contains the customization variables which the user can set.
" g:Tex_IgnoredWarnings: This variable contains a ¡ seperated list of
" patterns which will be ignored in the TeX compiler's output. Use this
" carefully, otherwise you might end up losing valuable information.
if !exists('g:Tex_IgnoredWarnings')
	let g:Tex_IgnoredWarnings =
		\'Underfull'."\n".
		\'Overfull'."\n".
		\'specifier changed to'."\n".
		\'You have requested'."\n".
		\'Missing number, treated as zero.'."\n".
		\'There were undefined references'."\n".
		\'Citation %.%# undefined'
endif
" This is the number of warnings in the g:Tex_IgnoredWarnings string which
" will be ignored.
if !exists('g:Tex_IgnoreLevel')
	let g:Tex_IgnoreLevel = 7
endif
" There will be lots of stuff in a typical compiler output which will
" completely fall through the 'efm' parsing. This options sets whether or not
" you will be shown those lines.
if !exists('g:Tex_IgnoreUnmatched')
	let g:Tex_IgnoreUnmatched = 1
endif
" With all this customization, there is a slight risk that you might be
" ignoring valid warnings or errors. Therefore before getting the final copy
" of your work, you might want to reset the 'efm' with this variable set to 1.
" With that value, all the lines from the compiler are shown irrespective of
" whether they match the error or warning patterns.
" NOTE: An easier way of resetting the 'efm' to show everything is to do
"       TCLevel strict
if !exists('g:Tex_ShowallLines')
	let g:Tex_ShowallLines = 0
endif

fun! <SID>Strntok(s, tok, n)
	return matchstr( a:s.a:tok[0], '\v(\zs([^'.a:tok.']*)\ze['.a:tok.']){'.a:n.'}')
endfun

function! <SID>IgnoreWarnings()
	let i = 1
	while s:Strntok(g:Tex_IgnoredWarnings, "\n", i) != '' &&
				\ i <= g:Tex_IgnoreLevel
		let warningPat = s:Strntok(g:Tex_IgnoredWarnings, "\n", i)
		let warningPat = escape(substitute(warningPat, '[\,]', '%\\\\&', 'g'), ' ')
		exe 'setlocal efm+=%-G%.%#'.warningPat.'%.%#'
		let i = i + 1
	endwhile
endfunction

function! <SID>SetLatexEfm()

	let pm = ( g:Tex_ShowallLines == 1 ? '+' : '-' )

	setlocal efm=

	if !g:Tex_ShowallLines
		call s:IgnoreWarnings()
	endif

	setlocal efm+=%E!\ LaTeX\ %trror:\ %m
	setlocal efm+=%E!\ %m
	setlocal efm+=%E%f:%l:\ %m

	setlocal efm+=%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#
	setlocal efm+=%+W%.%#\ at\ lines\ %l--%*\\d
	setlocal efm+=%+WLaTeX\ %.%#Warning:\ %m

	exec 'setlocal efm+=%'.pm.'Cl.%l\ %m'
	exec 'setlocal efm+=%'.pm.'Cl.%l\ '
	exec 'setlocal efm+=%'.pm.'C\ \ %m'
	exec 'setlocal efm+=%'.pm.'C%.%#-%.%#'
	exec 'setlocal efm+=%'.pm.'C%.%#[]%.%#'
	exec 'setlocal efm+=%'.pm.'C[]%.%#'
	exec 'setlocal efm+=%'.pm.'C%.%#%[{}\\]%.%#'
	exec 'setlocal efm+=%'.pm.'C<%.%#>%m'
	exec 'setlocal efm+=%'.pm.'C\ \ %m'
	exec 'setlocal efm+=%'.pm.'GSee\ the\ LaTeX%m'
	exec 'setlocal efm+=%'.pm.'GType\ \ H\ <return>%m'
	exec 'setlocal efm+=%'.pm.'G\ ...%.%#'
	exec 'setlocal efm+=%'.pm.'G%.%#\ (C)\ %.%#'
	exec 'setlocal efm+=%'.pm.'G(see\ the\ transcript%.%#)'
	exec 'setlocal efm+=%'.pm.'G\\s%#'
	exec 'setlocal efm+=%'.pm.'O(%*[^()])%r'
	exec 'setlocal efm+=%'.pm.'P(%f%r'
	exec 'setlocal efm+=%'.pm.'P\ %\\=(%f%r'
	exec 'setlocal efm+=%'.pm.'P%*[^()](%f%r'
	exec 'setlocal efm+=%'.pm.'P(%f%*[^()]'
	exec 'setlocal efm+=%'.pm.'P[%\\d%[^()]%#(%f%r'
	if g:Tex_IgnoreUnmatched && !g:Tex_ShowallLines
		setlocal efm+=%-P%*[^()]
	endif
	exec 'setlocal efm+=%'.pm.'Q)%r'
	exec 'setlocal efm+=%'.pm.'Q%*[^()])%r'
	exec 'setlocal efm+=%'.pm.'Q[%\\d%*[^()])%r'
	if g:Tex_IgnoreUnmatched && !g:Tex_ShowallLines
		setlocal efm+=%-Q%*[^()]
	endif
	if g:Tex_IgnoreUnmatched && !g:Tex_ShowallLines
		setlocal efm+=%-G%.%#
	endif

endfunction

" 1}}}



