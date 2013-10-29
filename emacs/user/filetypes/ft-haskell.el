(defun haskell-indentation ()
	"Mold indentation to my likes"
	(interactive)
	(haskell-indentation-mode 1))

(add-hook 'haskell-mode-hook 'haskell-indentation)
