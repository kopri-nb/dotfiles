(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

(setq mmm-submode-decoration-level 2
      mmm-parse-when-idle t)

;; emacs doesn't know about these by default.
(setq auto-mode-alist
      (nconc
       '((".hamd"      . haml-mode))
       '((".sawfishrc" . sawfish-mode))
       '((".jl"        . sawfish-mode))
       '((".zsh"       . sh-mode))
       auto-mode-alist))

;; individual file type settings are stored here
(defvar filetypes-dir (concat module-dir "filetypes/"))
(add-to-list 'load-path filetypes-dir)

(mapc 'load (directory-files filetypes-dir nil "^[^#].*el$"))
