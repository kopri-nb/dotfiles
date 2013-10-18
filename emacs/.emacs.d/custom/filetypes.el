(require 'yaml-mode)
(setq auto-mode-alist
             (nconc
              '(("COMMIT_EDITMSG$"  . diff-mode))
              '(("\.fsh$"          . c++-mode))
              '(("\.vsh$"          . c++-mode))
              '(("\.lua$"          . lua-mode))
              '(("\.md$"           . markdown-mode))
              '(("\.markdown$"     . markdown-mode))
              '(("\.xml$"          . nxml-mode))
              '(("\.html$"         . nxml-mode))
              '(("\.coffee$"       . coffee-mode))
              '(("\.hbs$"          . mustache-mode))
              '(("\.m$"            . objc-mode))
              '(("\.haml$"         . haml-mode))
              '(("\.scss$"         . css-mode))
              '(("\.yml$"          . yaml-mode))
              '(("\.yaml$"         . yaml-mode))
              '(("\.json$"         . yaml-mode))
              '(("\.mustache$"     . mustache-mode))
              '(("\.rb$"           . ruby-mode))
              '(("\.gemspec$"      . ruby-mode))
              '(("\.md$"           . markdown-mode))
              '(("\.textile$"      . textile-mode))
              '(("\.zsh$"          . sh-mode))
              '(("\.sass$"         . sass-mode))
              '(("\.js$"           . js2-mode))
              '(("\.js.erb$"       . js2-mode))
              '(("\.j$"            . objj-mode))
              '(("\.rake$"         . ruby-mode))
              '(("emfile$"         . ruby-mode))
              '(("akefile$"        . ruby-mode))
              '(("\.js\\.erb$"     . js2-mode))
              '(("\.coffee\\.erb$" . coffee-mode))
              '(("\xresources*"    . conf-xdefaults-mode))
              auto-mode-alist))

(setq magic-mode-alist ())

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

;; Perl
(add-hook 'perl-mode-hook '(lambda ()
                             (setq perl-indent-level 2)))

;; Ruby
(add-hook 'ruby-mode-hook '(lambda ()
                             (setq ruby-indent-level 2)))

(fset 'ruby-insert-end
      [?e ?n ?d ?  tab backspace return])
(fset 'ruby-method-definition
      [tab ?d ?e ?f ?  ?a return ?e ?n ?d ?  tab backspace ?\C-p ?\C-e backspace])
