;; -------~-------~--~------------------~------
;; E M A C S
;; -------~-------~--~------------------~------
;; 
;; Software used
;; `-> Lua-mode 20110428     (http://luaforge.net/projects/lua-mode)
;; `-> Markdown-mode 1.8.1   (http://jblevins.org/projects/markdown-mode)
;; `-> Minimap 0.7           (http://randomsample.de/minimap.el)
;; `-> Smooth-Scrolling 1.10 (http://adamspiers.org/computing/elisp/smooth-scrolling.el)
;; `-> WhizzyTex 1.3.2       (http://gallium.inria.fr/whizzytex)
;; `-> YaSnippet 0.6.1c      (http://code.google.com/p/yasnippet
;; -------~-------~--~------------------~------
;; PLUGINS
;; -------~-------~--~------------------~------
(add-to-list 'load-path "~/.emacs.d/modules")
(require 'minimap)
(require 'whizzytex)
(require 'flyspell)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

 (autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
 (setq auto-mode-alist (cons '("\\.html$" . html-helper-mode)       auto-mode-alist))


 (autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(autoload 'xrdb-mode "xrdb-mode" "Mode for editing X resource files" t)
 (setq auto-mode-alist
      (append '(("\\.Xdefaults$"    . xrdb-mode)
                ("\\.Xenvironment$" . xrdb-mode)
                 ("\\.Xresources$"   . xrdb-mode)
                 ("*.\\.ad$"         . xrdb-mode)
                 )
               auto-mode-alist))

;;(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
;;(require 'evil)
;;(evil-mode 1)
;;(setq evil-normal-state-msg "N"
;;evil-insert-state-msg "I"
;;evil-replace-state-msg "R"
;;evil-emacs-state-msg "X"
;;evil-visual-state-msg "V")

;; -------~-------~--~------------------~------
;; SEPARATE CONFIGS
;; -------~-------~--~------------------~------

(add-to-list 'load-path "~/.emacs.d/custom")
(load "keybinds")
(load "mode-line")
(load "filetypes")
(load "line-numbers")


;org mode ya bish
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
(setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
'("article"
"\\documentclass{article}"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/doctors.org" 
                             "~/org/home.org"))


;; -------~-------~--~------------------~------
;; APPEARANCE
;; -------~-------~--~------------------~------

(add-to-list 'load-path "~/.emacs.d/themes")
(require 'color-theme-julie)
(color-theme-julie)

;; -------~-------~--~------------------~------
;; SYNTAX
;; -------~-------~--~------------------~------
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; -------~-------~--~------------------~------
;; MISC
;; -------~-------~--~------------------~------

;; scroll margin
(require 'smooth-scrolling)
(setq smooth-scroll-margin 10)

;; no...
;;(tool-bar-mode 0)
;;(scroll-bar-mode 0)
(menu-bar-mode 0)
(blink-cursor-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; show matching parens
(show-paren-mode t)

;; no splash
(setq inhibit-splash-screen t)

;; hilight current line
(global-hl-line-mode 1)

;; indent
(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; always end a file with a newline
(setq require-final-newline nil)

;; line numbers
(defvar linum-is-relative 1)
(toggle-linum)

;; -------~-------~--~------------------~------
;; WHITESPACE
;; -------~-------~--~------------------~------
(require 'whitespace)

(setq whitespace-display-mappings
      '(
        (newline-mark 10 [60 10]) ; newlne, <
        (tab-mark 9 [187 9] [92 9]) ; tab, Â»
))

(setq
 whitespace-space 'whitespace-space
 whitespace-tab 'whitespace-tab
 whitespace-trailing 'whitespace-trailing
 whitespace-newline 'whitespace-newline
 whitespace-emtpy 'whitespace-empty)

;; -------~-------~--~------------------~------
;; YASNIPPET
;; -------~-------~--~------------------~------
(add-to-list 'load-path "~/.emacs.d/modules/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/modules/yasnippet/snippets")

;; -------~-------~--~------------------~------
;; TeX
;; -------~-------~--~------------------~------


(require 'whizzytex)
