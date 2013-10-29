(package-initialize)
;; Load vendor and custom files
(defvar emacs-dir "/home/kopri/etc/emacs/"
   "top level emacs dir")

(defvar vendor-dir (concat emacs-dir "vendor/")
        "packages not from ELPA")

(defvar module-dir (concat emacs-dir "user/")
        "don't enter here. magic!")

(defvar elpa-dir (concat emacs-dir "elpa/")
  "all elpa stuffs here")


;; ELPA Stuff

(require 'package)
(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Check if elpa dir exists, otherwise get archives
(unless (file-exists-p elpa-dir)
    (package-refresh-contents))


;; Make sure these are installed
(defvar elpa-required-packages '(
                                 auto-complete
                                 autopair
                                 crontab-mode
                                 evil
                                 elisp-cache
                                 emacsd-tile
                                 haml-mode
                                 haskell-mode
                                 js3-mode
                                 lua-mode
                                 magit
                                 markdown-mode
                                 mmm-mode
                                 multiple-cursors
                                 paredit
                                 rainbow-delimiters
                                 rainbow-mode
                                 sawfish
                                 smart-tab
                                 smart-tabs-mode
                                 stylus-mode
                                 langtool
                                 sws-mode
                                 undo-tree
                                 minimap
                                 maxframe
                                 ;; From here on, these packages depend on one
                                 ;; or more of the above, so they have to be
                                 ;; installed last
                                 ac-emmet
                                 evil-leader
                                 evil-nerd-commenter
                                 evil-numbers
                                 evil-paredit)
  "Default Packages")

(dolist (pkg elpa-required-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(package-initialize)


;; Add to load path
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)


;; Require packages in module dir
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(mapc 'load (directory-files vendor-dir nil "^[^#].*el$"))


;; Start server
(server-start)

