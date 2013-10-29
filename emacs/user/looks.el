(add-to-list 'custom-theme-load-path
             (concat emacs-dir "themes/"))

;; (set-face-attribute 'default nil :font "Source Code Pro-7")
(set-face-attribute 'default nil :font "PragmataPro-7")

(load-theme 'dotshare t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(blink-cursor-mode 0)
(setq inhibit-splash-screen t)
(global-hl-line-mode 1)

(setq linum-format " %3d")

(global-rainbow-delimiters-mode t)
