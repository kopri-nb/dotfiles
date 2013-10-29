;; Add extra newline to separate commit messages
(defun magit-commit-mode-init ()
  (when (looking-at "\n")
    (open-line 1)))

(add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

;; close popup when committing
(defadvice git-commit-commit (after delete-window activate)
  (delete-window))
