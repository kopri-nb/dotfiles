;; js3-mode
(defun js3-indentation ()
	"Mold indentation to my likes"
	(interactive)
  (setq indent-tabs-mode t
        tab-width 3
        js3-indent-level 3
        js3-indent-dots t
        js3-enter-indents-newline t
        js3-auto-indent-p t)
  (smart-tabs-advice js3-indent-line js3-indent-level)
  (smart-tabs-mode-enable))

(add-hook 'js3-mode-hook 'js3-indentation)

;; js-mode
(defun js-indentation ()
	"Mold indentation to my likes"
	(interactive)
  (setq indent-tabs-mode t
        tab-width 3
        js-indent-level 3))

(add-hook 'js-mode-hook 'js-indentation)

;; define minor mode for evil shortcuts
(define-minor-mode evil-js3-mode
  "Buffer local minor mode for evil and js3"
  :init-value nil
  :lighter " EvilJS"
  :keymap (make-sparse-keymap)
  :group 'evil-js3)

(add-hook 'js3-mode-hook 'evil-js3-mode)

(evil-define-key 'normal evil-js3-mode-map
  "zf" 'js3-mode-toggle-hide-functions
  "zz" 'js3-mode-toggle-element
  "zc" 'js3-mode-toggle-hide-comments)
