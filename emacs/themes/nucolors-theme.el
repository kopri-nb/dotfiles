;;; nucolors-theme.el --- A color theme for Emacs 24.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Installation:
;;
;; Drop the theme in a folder that is on `custom-theme-load-path'
;; and enjoy!
;;
;; Don't forget that the theme requires Emacs 24.
;;

;;; Code

(deftheme nucolors
  "A dark, sepia-ish theme")

(let ((class '((class color) (min-colors 89)))
      ;; color definitions
      ;; colors with +x are lighter, colors with -x are darker
      (nucolors-fg   "#c7c7c7")
      (nucolors-bg-1 "#121212")
      (nucolors-bg   "#151515")
      (nucolors-bg+1 "#353535")
      (nucolors-bg+2 "#606060")

      (nucolors-red   "#ff9f95")
      (nucolors-red+1 "#ff8d80")
      (nucolors-red-1 "#ff7566")
      (nucolors-red-2 "#ff5e4d")
      (nucolors-red-3 "#ff4733")

      (nucolors-green-1 "#d5f9aa")
      (nucolors-green+1 "#dbffb3")
      (nucolors-green   "#e2ffc7")
      (nucolors-green+2 "#e7ffcc")
      (nucolors-green+3 "#f3ffe5")
      (nucolors-green+4 "#fafffa")

      (nucolors-yellow   "#ffffb9")
      (nucolors-yellow-1 "#ffbe64")
      (nucolors-yellow-2 "#ffaa33")

      (nucolors-blue   "#a8ceea")
      (nucolors-blue+1 "#7eb6ff")
      (nucolors-blue-2 "#66a8ff")
      (nucolors-blue-3 "#4d9aff")
      (nucolors-blue-4 "#338bff")
      (nucolors-blue-5 "#1a7dff")

      (nucolors-magenta "#e2b5cc")
      (nucolors-magenta+1 "#e296ff")

      (nucolors-cyan "#c2efff")
      (nucolors-cyan+1 "#9ce9ff")
)

  (custom-theme-set-faces
   'nucolors

   ;;; basic coloring
   `(cursor ((,class (:foreground ,nucolors-fg))))
   `(default ((,class (:foreground ,nucolors-fg :background ,nucolors-bg))))
   `(fringe ((,class (:foreground ,nucolors-cyan :background ,nucolors-bg-1))))
   `(escape-glyph-face ((,class (:foreground ,nucolors-red))))
   `(header-line ((,class (:foreground ,nucolors-yellow
:background ,nucolors-bg-1
:box (:line-width 1 :color ,nucolors-bg-1)))))
   `(hl-line ((,class (:background ,nucolors-bg+1))))
   `(linum ((,class (:foreground "#505050" :background ,nucolors-bg-1))))
   `(minibuffer-prompt ((,class (:foreground ,nucolors-yellow))))
   `(menu ((,class (:foreground ,nucolors-fg :background ,nucolors-bg))))
   `(mode-line
     ((,class (:foreground ,nucolors-fg :background ,nucolors-bg+1
:box (:line-width 1 :color ,nucolors-bg+1)))))
   `(mode-line-inactive ((,class (:inherit mode-line :background ,nucolors-bg+2
:box (:line-width 1 :color ,nucolors-bg-1)))))
   `(mode-line-buffer-id ((,class (:inherit 'nucolors-yellow :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,nucolors-green-1 :background ,nucolors-bg+1))))
   `(mode-line-buffer-name ((,class (:foreground ,nucolors-green :weight bold))))
   `(mode-line-mode-face ((,class (:foreground ,nucolors-yellow))))
	 `(mode-line-minor-mode-face ((,class (:foreground ,nucolors-bg+2))))
   `(mode-line-folder-face ((,class (:foreground ,nucolors-bg+2))))
   `(mode-line-modified-face ((,class (:foreground ,nucolors-magenta+1 :background ,nucolors-bg+1))))
   `(mode-line-read-only-face ((,class (:foreground ,nucolors-red))))
	 `(mode-line-line-face ((,class (:foreground ,nucolors-magenta))))
	 `(mode-line-80col-face ((,class (:foreground ,nucolors-red))))
	 `(mode-line-col-face ((,class (:foreground ,nucolors-green))))
   `(region ((,class (:background ,nucolors-bg+2))))
   `(secondary-selection ((,class (:background ,nucolors-bg+2))))
   `(trailing-whitespace ((,class (:background ,nucolors-red))))
   `(vertical-border ((,class (:foreground ,nucolors-fg))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,nucolors-yellow :background ,nucolors-bg-1))))
   `(isearch-fail ((,class (:foreground ,nucolors-fg :background ,nucolors-red-3))))
   `(lazy-highlight ((,class (:foreground ,nucolors-yellow :background ,nucolors-bg+2))))

   ;; font-lock
   `(font-lock-builtin-face ((,class (:foreground ,nucolors-blue))))
   `(font-lock-comment-face ((,class (:foreground ,nucolors-bg+2))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,nucolors-bg+2))))
   `(font-lock-constant-face ((,class (:foreground ,nucolors-fg))))
   `(font-lock-doc-face ((,class (:foreground ,nucolors-green+1))))
   `(font-lock-doc-string-face ((,class (:foreground ,nucolors-blue+1))))
   `(font-lock-function-name-face ((,class (:foreground ,nucolors-blue))))
   `(font-lock-keyword-face ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(font-lock-negation-char-face ((,class (:foregorund ,nucolors-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,nucolors-blue))))
   `(font-lock-string-face ((,class (:foreground ,nucolors-red))))
   `(font-lock-type-face ((,class (:foregorund ,nucolors-yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,nucolors-yellow))))
   `(font-lock-warning-face ((,class (:foreground ,nucolors-yellow-1 :weight bold :underline t))))
   `(font-lock-pseudo-keyword-face ((,class (:foreground ,nucolors-yellow))))
   `(font-lock-operator-face ((,class (:foreground ,nucolors-magenta+1))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   ;;; external

   ;; auto-complete
   `(ac-candidate-face ((,class (:background ,nucolors-bg+2 :foreground "white"))))
   `(ac-selection-face ((,class (:background ,nucolors-blue-4 :foreground ,nucolors-fg))))
   `(popup-tip-face ((,class (:background ,nucolors-yellow-2 :foreground "black"))))
   `(popup-scroll-bar-foreground-face ((,class (:background "white"))))
   `(popup-scroll-bar-background-face ((,class (:background ,nucolors-bg-1))))
   `(popup-isearch-match ((,class (:background ,nucolors-bg :foreground ,nucolors-fg))))

   ;; diff
   `(diff-added ((,class (:foreground ,nucolors-green+4))))
   `(diff-changed ((,class (:foreground ,nucolors-yellow))))
   `(diff-removed ((,class (:foreground ,nucolors-red))))
   `(diff-header ((,class (:background ,nucolors-bg+1))))
   `(diff-file-header
     ((,class (:background ,nucolors-bg+2 :foreground ,nucolors-fg :bold t))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,nucolors-red-1 :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,nucolors-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,nucolors-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,nucolors-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:inherit nucolors-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,nucolors-cyan :weight bold))))

   ;; ecb
   `(ecb-analyse-bucket-element-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-analyse-bucket-node-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-analyse-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-analyse-general-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-bucket-node-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-default-general-face ((,class (:inherit nucolors-fg))))
   `(ecb-default-highlight-face ((,class (:foreground ,nucolors-green :background ,nucolors-bg :weight bold))))
   `(ecb-directories-general-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-directory-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-directory-not-accessible-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-history-bucket-node-dir-soure-path-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-history-bucket-node-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-history-dead-buffer-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-history-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-history-general-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-history-indirect-buffer-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-method-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-method-non-semantic-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-methods-general-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-mode-line-data-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-mode-line-prefix-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-mode-line-win-nr-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-source-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-source-in-directories-buffer-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-source-read-only-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-sources-general-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-symboldef-prototype-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-symboldef-symbol-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-tag-header-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-tree-guide-line-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-type-tag-class-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-type-tag-enum-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-type-tag-group-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-type-tag-interface-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-type-tag-struct-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(ecb-type-tag-typedef-face ((,class (:foreground ,nucolors-cyan :weight bold))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,nucolors-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,nucolors-yellow))))
   `(erc-keyword-face ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(erc-nick-default-face ((,class (:weight bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,nucolors-green))))
   `(erc-pal-face ((,class (:foreground ,nucolors-magenta+1 :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,nucolors-magenta+1 :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,nucolors-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; evil
   `(evil-state-face ((,class (:foreground ,nucolors-bg-1 :background ,nucolors-green :weight bold :box (:line-width 4 :color ,nucolors-green)))))
   ;; flymake
   `(flymake-errline ((,class (:foreground ,nucolors-red-1 :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,nucolors-yellow-1 :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,nucolors-yellow-1 :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,nucolors-red-1 :weight bold :underline t))))

   ;; gnus
   `(gnus-group-mail-1-face ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty-face ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2-face ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty-face ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3-face ((,class (:bold t :inherit 'nus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty-face ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4-face ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty-face ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5-face ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty-face ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6-face ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty-face ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low-face ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty-face ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1-face ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2-face ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3-face ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4-face ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5-face ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6-face ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low-face ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content-face ((,class (:inherit message-header-other))))
   `(gnus-header-from-face ((,class (:inherit message-header-from))))
   `(gnus-header-name-face ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups-face ((,class (:inherit message-header-other))))
   `(gnus-header-subject-face ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled-face ((,class (:foreground ,nucolors-magenta+1))))
   `(gnus-summary-high-ancient-face ((,class (:foreground ,nucolors-blue))))
   `(gnus-summary-high-read-face ((,class (:foreground ,nucolors-green :weight bold))))
   `(gnus-summary-high-ticked-face ((,class (:foreground ,nucolors-magenta+1 :weight bold))))
   `(gnus-summary-high-unread-face ((,class (:foreground ,nucolors-fg :weight bold))))
   `(gnus-summary-low-ancient-face ((,class (:foreground ,nucolors-blue))))
   `(gnus-summary-low-read-face ((,class (:foreground ,nucolors-green))))
   `(gnus-summary-low-ticked-face ((,class (:foreground ,nucolors-magenta+1 :weight bold))))
   `(gnus-summary-low-unread-face ((,class (:foreground ,nucolors-fg))))
   `(gnus-summary-normal-ancient-face ((,class (:foreground ,nucolors-blue))))
   `(gnus-summary-normal-read-face ((,class (:foreground ,nucolors-green))))
   `(gnus-summary-normal-ticked-face ((,class (:foreground ,nucolors-magenta+1 :weight bold))))
   `(gnus-summary-normal-unread-face ((,class (:foreground ,nucolors-fg))))
   `(gnus-summary-selected-face ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(gnus-cite-1-face ((,class (:foreground ,nucolors-blue))))
   `(gnus-cite-10-face ((,class (:foreground ,nucolors-yellow-1))))
   `(gnus-cite-11-face ((,class (:foreground ,nucolors-yellow))))
   `(gnus-cite-2-face ((,class (:foreground ,nucolors-cyan+1))))
   `(gnus-cite-3-face ((,class (:foreground ,nucolors-blue-2))))
   `(gnus-cite-4-face ((,class (:foreground ,nucolors-green+2))))
   `(gnus-cite-5-face ((,class (:foreground ,nucolors-green+1))))
   `(gnus-cite-6-face ((,class (:foreground ,nucolors-green))))
   `(gnus-cite-7-face ((,class (:foreground ,nucolors-red))))
   `(gnus-cite-8-face ((,class (:foreground ,nucolors-red-1))))
   `(gnus-cite-9-face ((,class (:foreground ,nucolors-red-2))))
   `(gnus-group-news-1-empty-face ((,class (:foreground ,nucolors-yellow))))
   `(gnus-group-news-2-empty-face ((,class (:foreground ,nucolors-green+3))))
   `(gnus-group-news-3-empty-face ((,class (:foreground ,nucolors-green+1))))
   `(gnus-group-news-4-empty-face ((,class (:foreground ,nucolors-blue-2))))
   `(gnus-group-news-5-empty-face ((,class (:foreground ,nucolors-blue-3))))
   `(gnus-group-news-6-empty-face ((,class (:foreground ,nucolors-bg+2))))
   `(gnus-group-news-low-empty-face ((,class (:foreground ,nucolors-bg+2))))
   `(gnus-signature-face ((,class (:foreground ,nucolors-yellow))))
   `(gnus-x-face ((,class (:background ,nucolors-fg :foreground ,nucolors-bg))))

   ;; magit
   `(magit-section-title ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(magit-branch ((,class (:foreground ,nucolors-magenta+1 :weight bold))))

   ;; message-mode
   `(message-cited-text-face ((,class (:inherit font-lock-comment))))
   `(message-header-name-face ((,class (:foreground ,nucolors-green+1))))
   `(message-header-other-face ((,class (:foreground ,nucolors-green))))
   `(message-header-to-face ((,class (:inherit 'nucolors-yellow :weight bold))))
   `(message-header-from-face ((,class (:inherit 'nucolors-yellow :weight bold))))
   `(message-header-cc-face ((,class (:inherit 'nucolors-yellow :weight bold))))
   `(message-header-newsgroups-face ((,class (:inherit 'nucolors-yellow :weight bold))))
   `(message-header-subject-face ((,class (:inherit 'nucolors-magenta+1 :weight bold))))
   `(message-header-xheader-face ((,class (:foreground ,nucolors-green))))
   `(message-mml-face ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(message-separator-face ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,nucolors-magenta+1))))
   `(mew-face-header-from ((,class (:foreground ,nucolors-yellow))))
   `(mew-face-header-date ((,class (:foreground ,nucolors-green))))
   `(mew-face-header-to ((,class (:foreground ,nucolors-red))))
   `(mew-face-header-key ((,class (:foreground ,nucolors-green))))
   `(mew-face-header-private ((,class (:foreground ,nucolors-green))))
   `(mew-face-header-important ((,class (:foreground ,nucolors-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,nucolors-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,nucolors-red))))
   `(mew-face-header-xmew ((,class (:foreground ,nucolors-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,nucolors-red))))
   `(mew-face-body-url ((,class (:foreground ,nucolors-magenta+1))))
   `(mew-face-body-comment ((,class (:foreground ,nucolors-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,nucolors-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,nucolors-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,nucolors-magenta+1))))
   `(mew-face-body-cite4 ((,class (:foreground ,nucolors-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,nucolors-red))))
   `(mew-face-mark-review ((,class (:foreground ,nucolors-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,nucolors-green))))
   `(mew-face-mark-delete ((,class (:foreground ,nucolors-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,nucolors-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,nucolors-green))))
   `(mew-face-mark-unread ((,class (:foreground ,nucolors-red-2))))
   `(mew-face-eof-message ((,class (:foreground ,nucolors-green))))
   `(mew-face-eof-part ((,class (:foreground ,nucolors-yellow))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,nucolors-yellow))))
   `(nav-face-button-num ((,class (:foreground ,nucolors-cyan))))
   `(nav-face-dir ((,class (:foreground ,nucolors-green))))
   `(nav-face-hdir ((,class (:foreground ,nucolors-red))))
   `(nav-face-file ((,class (:foreground ,nucolors-fg))))
   `(nav-face-hfile ((,class (:foreground ,nucolors-red-3))))

   ;; org-mode
   `(org-agenda-date-today
     ((,class (:foreground "white" :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:foreground ,nucolors-fg :weight bold))))
   `(org-checkbox ((,class (:background ,nucolors-bg+2 :foreground "white"
:box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,nucolors-blue :underline t))))
   `(org-deadline-announce ((,class (:foreground ,nucolors-red-1))))
   `(org-done ((,class (:bold t :weight bold :foreground ,nucolors-green+3))))
   `(org-formula ((,class (:foreground ,nucolors-yellow-2))))
   `(org-headline-done ((,class (:foreground ,nucolors-green+3))))
   `(org-hide ((,class (:foreground ,nucolors-bg-1))))
   `(org-level-1 ((,class (:foreground ,nucolors-magenta+1))))
   `(org-level-2 ((,class (:foreground ,nucolors-green+1))))
   `(org-level-3 ((,class (:foreground ,nucolors-cyan+1))))
   `(org-level-4 ((,class (:foreground ,nucolors-yellow-2))))
   `(org-level-5 ((,class (:foreground ,nucolors-cyan))))
   `(org-level-6 ((,class (:foreground ,nucolors-green-1))))
   `(org-level-7 ((,class (:foreground ,nucolors-red-3))))
   `(org-level-8 ((,class (:foreground ,nucolors-blue-4))))
   `(org-link ((,class (:foreground ,nucolors-yellow-2 :underline t))))
   `(org-scheduled ((,class (:foreground ,nucolors-green+4))))
   `(org-scheduled-previously ((,class (:foreground ,nucolors-red-3))))
   `(org-scheduled-today ((,class (:foreground ,nucolors-blue+1))))
   `(org-special-keyword ((,class (:foreground ,nucolors-yellow-1))))
   `(org-table ((,class (:foreground ,nucolors-green+2))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-time-grid ((,class (:foreground ,nucolors-magenta+1))))
   `(org-todo ((,class (:bold t :foreground ,nucolors-red :weight bold))))
   `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   `(org-warning ((,class (:bold t :foreground ,nucolors-red :weight bold))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; post-mode
   `(post-email-address-text-face ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(post-emoticon-face ((,class (:foreground ,nucolors-green+2 :weight bold))))
   `(post-header-keyword-face ((,class (:foreground ,nucolors-bg+1))))
   `(post-header-value-face ((,class (:foreground ,nucolors-fg))))
   `(post-multiply-quoted-text-face ((,class (:foreground ,nucolors-magenta+1))))
   `(post-quoted-text-face ((,class (:foreground ,nucolors-yellow))))
   `(post-signature-text-face ((,class (:foreground ,nucolors-bg+2))))
   `(post-underline-face ((,class (:foreground ,nucolors-green))))
   `(post-url-face ((,class (:foreground ,nucolors-blue-2 :underline t))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,nucolors-cyan :weight bold))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,nucolors-yellow :weight bold))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,nucolors-blue+1 :weight bold))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,nucolors-red+1 :weight bold))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,nucolors-green+1 :weight bold))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,nucolors-cyan+1 :weight bold))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,nucolors-green+4 :weight bold))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,nucolors-red-3 :weight bold))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,nucolors-yellow-2 :weight bold))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,nucolors-green+2 :weight bold))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,nucolors-blue+1 :weight bold))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,nucolors-red-3 :weight bold))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,nucolors-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,nucolors-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,nucolors-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,nucolors-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,nucolors-red))))
   `(rpm-spec-package-face ((,class (:foreground ,nucolors-red))))
   `(rpm-spec-section-face ((,class (:foreground ,nucolors-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,nucolors-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,nucolors-red))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,nucolors-fg :background ,nucolors-red :weight bold))))
   `(show-paren-match ((,class (:foreground ,nucolors-fg :background ,nucolors-blue+1 :weight bold))))

   ;; speedbar
   `(speedbar-button-face ((,class (:foreground ,nucolors-green+1))))
   `(speedbar-directory-face ((,class (:foreground ,nucolors-blue+1))))
   `(speedbar-file-face ((,class (:foreground ,nucolors-fg))))
   `(speedbar-highlight-face ((,class (:background ,nucolors-bg+2))))
   `(speedbar-selected-face ((,class (:background ,nucolors-bg+1))))
   `(speedbar-separator-face ((,class (:foreground ,nucolors-bg+1))))
   `(speedbar-tag-face ((,class (:foreground ,nucolors-yellow))))

   ;; wl (wanderlust)
   ;; some faces end with -face, while other don't; confusing
   `(wl-highlight-folder-few-face ((,class (:foreground ,nucolors-red-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,nucolors-red-1))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,nucolors-magenta+1))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,nucolors-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,nucolors-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,nucolors-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,nucolors-red-1))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,nucolors-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,nucolors-green+2))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,nucolors-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,nucolors-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,nucolors-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,nucolors-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,nucolors-green+2))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,nucolors-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,nucolors-green+2))))
   `(wl-highlight-message-signature ((,class (:foreground ,nucolors-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,nucolors-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,nucolors-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,nucolors-fg
:slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,nucolors-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,nucolors-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,nucolors-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,nucolors-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,nucolors-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold)))))

  (custom-theme-set-variables
   'nucolors

   `(ansi-color-names-vector
     [,nucolors-bg ,nucolors-red ,nucolors-green ,nucolors-yellow
,nucolors-blue ,nucolors-magenta ,nucolors-cyan ,nucolors-fg])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,nucolors-bg ,nucolors-red ,nucolors-green ,nucolors-yellow
,nucolors-blue ,nucolors-magenta ,nucolors-blue ,nucolors-fg])))

(provide-theme 'nucolors)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; nucolors-theme.el ends here.
