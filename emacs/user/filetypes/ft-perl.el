(defun perl-indentation ()
  "Mold indentation to my likes"
  (interactive)
  (setq perl-indent-level 3
        tab-width 3))

(add-hook 'perl-mode-hook 'perl-indentation)
