(defun python-indentation ()
  "Mold indentation to my likes"
  (interactive)
  (define-key python-mode-map "\C-m" 'newline-and-indent)
  (setq python-indent 4))

(add-hook 'python-mode-hook 'python-indentation)
