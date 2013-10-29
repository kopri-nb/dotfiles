(defun sgml-handle-tab ()
  "Handle TAB behaviour for SGML modes
   - turn off AC
   - turn off YAS
   - turn on emmet"
  (interactive)
  (auto-complete-mode 0)
  (yas-minor-mode 0)
  (emmet-mode 1)
  (define-key emmet-mode-keymap (kbd "TAB") 'emmet-expand-line))

(add-hook 'sgml-mode-hook 'sgml-handle-tab)
(add-hook 'css-mode-hook 'sgml-handle-tab)

;; emmet settings
(add-hook 'emmet-mode-hook (lambda ()
                             (setq emmet-indentation 3
                                   emmet-preview-default nil)))

;; MMM for node.js ejs template files
(mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

(add-to-list 'auto-mode-alist '(".ejs" . html-erb-mode))
