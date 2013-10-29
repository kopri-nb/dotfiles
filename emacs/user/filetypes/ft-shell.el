(defun sh-indentation ()
	"Mold indentation to my likes"
	(interactive)
	(setq sh-basic-offset 3
	      sh-indentation 3
	      sh-indentation-for-case-label 2
	      sh-indentation-for-case-alt '+
	      tab-width 3))

(add-hook 'sh-mode-hook 'sh-indentation)
