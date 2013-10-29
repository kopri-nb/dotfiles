;;; dotshare-theme.el --- A color theme for Emacs 24.

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

(deftheme dotshare
  "As seen on dotshare.it")

(let ((class '((class color) (min-colors 89)))
      ;; color definitions
      ;; colors with +x are lighter, colors with -x are darker
			(dotshare-fg   "#D7D0C7")
			(dotshare-bg-1 "#121212")
			(dotshare-bg   "#151515")
			(dotshare-bg+1 "#353535")
			(dotshare-bg+2 "#606060")

			(dotshare-red       "#E84F4F")
			(dotshare-red+1     "#D23D3D")
			
			(dotshare-green     "#B8D68C")
			(dotshare-green+1   "#A0CF5D")

			(dotshare-yellow    "#E1AA5D")
			(dotshare-yellow+1  "#F39D21")

			(dotshare-blue      "#4D679A")
			(dotshare-blue+1    "#44E9FB1")

			(dotshare-magenta   "#9B64FB")
			(dotshare-magenta+1 "#8542FF")

			(dotshare-cyan      "#6D878D")
			(dotshare-cyan+1    "#42717B")
)

  (custom-theme-set-faces
   'dotshare

   ;;; basic coloring
   `(cursor ((,class (:foreground ,dotshare-fg))))
   `(default ((,class (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(fringe ((,class (:foreground ,dotshare-cyan :background ,dotshare-bg-1))))
   `(escape-glyph-face ((,class (:foreground ,dotshare-red))))
   `(header-line ((,class (:foreground ,dotshare-yellow
:background ,dotshare-bg-1
:box (:line-width 1 :color ,dotshare-bg-1)))))
   `(hl-line ((,class (:background ,dotshare-bg+1))))
   `(linum ((,class (:foreground "#505050" :background ,dotshare-bg-1))))
   `(minibuffer-prompt ((,class (:foreground ,dotshare-yellow))))
   `(menu ((,class (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(mode-line
     ((,class (:foreground ,dotshare-fg :background ,dotshare-bg+1
:box (:line-width 1 :color ,dotshare-bg+1)))))
   `(mode-line-inactive ((,class (:inherit mode-line :background ,dotshare-bg+2
:box (:line-width 1 :color ,dotshare-bg-1)))))
   `(mode-line-buffer-id ((,class (:inherit 'dotshare-yellow :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,dotshare-green :background ,dotshare-bg+1))))
   `(mode-line-buffer-name ((,class (:foreground ,dotshare-green :weight bold))))
   `(mode-line-mode-face ((,class (:foreground ,dotshare-yellow))))
	 `(mode-line-minor-mode-face ((,class (:foreground ,dotshare-bg+2))))
   `(mode-line-folder-face ((,class (:foreground ,dotshare-bg+2))))
   `(mode-line-modified-face ((,class (:foreground ,dotshare-magenta+1 :background ,dotshare-bg+1))))
   `(mode-line-read-only-face ((,class (:foreground ,dotshare-red))))
	 `(mode-line-line-face ((,class (:foreground ,dotshare-magenta))))
	 `(mode-line-80col-face ((,class (:foreground ,dotshare-red))))
	 `(mode-line-col-face ((,class (:foreground ,dotshare-green))))
   `(region ((,class (:background ,dotshare-bg+2))))
   `(secondary-selection ((,class (:background ,dotshare-bg+2))))
   `(trailing-whitespace ((,class (:background ,dotshare-red))))
   `(vertical-border ((,class (:foreground ,dotshare-fg))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,dotshare-yellow :background ,dotshare-bg-1))))
   `(isearch-fail ((,class (:foreground ,dotshare-fg :background ,dotshare-red))))
   `(lazy-highlight ((,class (:foreground ,dotshare-yellow :background ,dotshare-bg+2))))

   ;; font-lock
   `(font-lock-builtin-face ((,class (:foreground ,dotshare-blue))))
   `(font-lock-comment-face ((,class (:foreground ,dotshare-bg+2))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,dotshare-bg+2))))
   `(font-lock-constant-face ((,class (:foreground ,dotshare-fg))))
   `(font-lock-doc-face ((,class (:foreground ,dotshare-green+1))))
   `(font-lock-doc-string-face ((,class (:foreground ,dotshare-blue+1))))
   `(font-lock-function-name-face ((,class (:foreground ,dotshare-blue))))
   `(font-lock-keyword-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(font-lock-negation-char-face ((,class (:foregorund ,dotshare-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,dotshare-blue))))
   `(font-lock-string-face ((,class (:foreground ,dotshare-magenta))))
   `(font-lock-type-face ((,class (:foregorund ,dotshare-yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,dotshare-yellow))))
   `(font-lock-warning-face ((,class (:foreground ,dotshare-yellow :weight bold :underline t))))
   `(font-lock-pseudo-keyword-face ((,class (:foreground ,dotshare-yellow))))
   `(font-lock-operator-face ((,class (:foreground ,dotshare-magenta+1))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   ;;; external

   ;; auto-complete
   `(ac-candidate-face ((,class (:background ,dotshare-bg+2 :foreground "white"))))
   `(ac-selection-face ((,class (:background ,dotshare-blue+1 :foreground ,dotshare-fg))))
   `(popup-tip-face ((,class (:background ,dotshare-yellow :foreground "black"))))
   `(popup-scroll-bar-foreground-face ((,class (:background "white"))))
   `(popup-scroll-bar-background-face ((,class (:background ,dotshare-bg-1))))
   `(popup-isearch-match ((,class (:background ,dotshare-bg :foreground ,dotshare-fg))))

   ;; diff
   `(diff-added ((,class (:foreground ,dotshare-green+1))))
   `(diff-changed ((,class (:foreground ,dotshare-yellow))))
   `(diff-removed ((,class (:foreground ,dotshare-red))))
   `(diff-header ((,class (:background ,dotshare-bg+1))))
   `(diff-file-header
     ((,class (:background ,dotshare-bg+2 :foreground ,dotshare-fg :bold t))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,dotshare-red :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,dotshare-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,dotshare-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,dotshare-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:inherit dotshare-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,dotshare-cyan :weight bold))))

   ;; ecb
   `(ecb-analyse-bucket-element-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-analyse-bucket-node-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-analyse-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-analyse-general-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-bucket-node-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-default-general-face ((,class (:inherit dotshare-fg))))
   `(ecb-default-highlight-face ((,class (:foreground ,dotshare-green :background ,dotshare-bg :weight bold))))
   `(ecb-directories-general-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-directory-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-directory-not-accessible-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-history-bucket-node-dir-soure-path-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-history-bucket-node-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-history-dead-buffer-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-history-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-history-general-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-history-indirect-buffer-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-method-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-method-non-semantic-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-methods-general-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-mode-line-data-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-mode-line-prefix-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-mode-line-win-nr-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-source-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-source-in-directories-buffer-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-source-read-only-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-sources-general-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-symboldef-prototype-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-symboldef-symbol-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-tag-header-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-tree-guide-line-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-type-tag-class-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-type-tag-enum-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-type-tag-group-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-type-tag-interface-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-type-tag-struct-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(ecb-type-tag-typedef-face ((,class (:foreground ,dotshare-cyan :weight bold))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,dotshare-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,dotshare-yellow))))
   `(erc-keyword-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(erc-nick-default-face ((,class (:weight bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,dotshare-green))))
   `(erc-pal-face ((,class (:foreground ,dotshare-magenta+1 :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,dotshare-magenta+1 :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,dotshare-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; evil
   `(evil-state-face ((,class (:foreground ,dotshare-bg-1 :background ,dotshare-green :weight bold :box (:line-width 4 :color ,dotshare-green)))))
   ;; flymake
   `(flymake-errline ((,class (:foreground ,dotshare-red :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,dotshare-yellow :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,dotshare-yellow :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,dotshare-red :weight bold :underline t))))

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
   `(gnus-summary-cancelled-face ((,class (:foreground ,dotshare-magenta+1))))
   `(gnus-summary-high-ancient-face ((,class (:foreground ,dotshare-blue))))
   `(gnus-summary-high-read-face ((,class (:foreground ,dotshare-green :weight bold))))
   `(gnus-summary-high-ticked-face ((,class (:foreground ,dotshare-magenta+1 :weight bold))))
   `(gnus-summary-high-unread-face ((,class (:foreground ,dotshare-fg :weight bold))))
   `(gnus-summary-low-ancient-face ((,class (:foreground ,dotshare-blue))))
   `(gnus-summary-low-read-face ((,class (:foreground ,dotshare-green))))
   `(gnus-summary-low-ticked-face ((,class (:foreground ,dotshare-magenta+1 :weight bold))))
   `(gnus-summary-low-unread-face ((,class (:foreground ,dotshare-fg))))
   `(gnus-summary-normal-ancient-face ((,class (:foreground ,dotshare-blue))))
   `(gnus-summary-normal-read-face ((,class (:foreground ,dotshare-green))))
   `(gnus-summary-normal-ticked-face ((,class (:foreground ,dotshare-magenta+1 :weight bold))))
   `(gnus-summary-normal-unread-face ((,class (:foreground ,dotshare-fg))))
   `(gnus-summary-selected-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(gnus-cite-1-face ((,class (:foreground ,dotshare-blue))))
   `(gnus-cite-10-face ((,class (:foreground ,dotshare-yellow))))
   `(gnus-cite-11-face ((,class (:foreground ,dotshare-yellow))))
   `(gnus-cite-2-face ((,class (:foreground ,dotshare-cyan+1))))
   `(gnus-cite-3-face ((,class (:foreground ,dotshare-blue))))
   `(gnus-cite-4-face ((,class (:foreground ,dotshare-green+1))))
   `(gnus-cite-5-face ((,class (:foreground ,dotshare-green+1))))
   `(gnus-cite-6-face ((,class (:foreground ,dotshare-green))))
   `(gnus-cite-7-face ((,class (:foreground ,dotshare-red))))
   `(gnus-cite-8-face ((,class (:foreground ,dotshare-red))))
   `(gnus-cite-9-face ((,class (:foreground ,dotshare-red))))
   `(gnus-group-news-1-empty-face ((,class (:foreground ,dotshare-yellow))))
   `(gnus-group-news-2-empty-face ((,class (:foreground ,dotshare-green+1))))
   `(gnus-group-news-3-empty-face ((,class (:foreground ,dotshare-green+1))))
   `(gnus-group-news-4-empty-face ((,class (:foreground ,dotshare-blue))))
   `(gnus-group-news-5-empty-face ((,class (:foreground ,dotshare-blue))))
   `(gnus-group-news-6-empty-face ((,class (:foreground ,dotshare-bg+2))))
   `(gnus-group-news-low-empty-face ((,class (:foreground ,dotshare-bg+2))))
   `(gnus-signature-face ((,class (:foreground ,dotshare-yellow))))
   `(gnus-x-face ((,class (:background ,dotshare-fg :foreground ,dotshare-bg))))

   ;; magit
   `(magit-section-title ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(magit-branch ((,class (:foreground ,dotshare-magenta+1 :weight bold))))

   ;; message-mode
   `(message-cited-text-face ((,class (:inherit font-lock-comment))))
   `(message-header-name-face ((,class (:foreground ,dotshare-green+1))))
   `(message-header-other-face ((,class (:foreground ,dotshare-green))))
   `(message-header-to-face ((,class (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-from-face ((,class (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-cc-face ((,class (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-newsgroups-face ((,class (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-subject-face ((,class (:inherit 'dotshare-magenta+1 :weight bold))))
   `(message-header-xheader-face ((,class (:foreground ,dotshare-green))))
   `(message-mml-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(message-separator-face ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,dotshare-magenta+1))))
   `(mew-face-header-from ((,class (:foreground ,dotshare-yellow))))
   `(mew-face-header-date ((,class (:foreground ,dotshare-green))))
   `(mew-face-header-to ((,class (:foreground ,dotshare-red))))
   `(mew-face-header-key ((,class (:foreground ,dotshare-green))))
   `(mew-face-header-private ((,class (:foreground ,dotshare-green))))
   `(mew-face-header-important ((,class (:foreground ,dotshare-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,dotshare-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,dotshare-red))))
   `(mew-face-header-xmew ((,class (:foreground ,dotshare-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,dotshare-red))))
   `(mew-face-body-url ((,class (:foreground ,dotshare-magenta+1))))
   `(mew-face-body-comment ((,class (:foreground ,dotshare-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,dotshare-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,dotshare-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,dotshare-magenta+1))))
   `(mew-face-body-cite4 ((,class (:foreground ,dotshare-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,dotshare-red))))
   `(mew-face-mark-review ((,class (:foreground ,dotshare-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,dotshare-green))))
   `(mew-face-mark-delete ((,class (:foreground ,dotshare-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,dotshare-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,dotshare-green))))
   `(mew-face-mark-unread ((,class (:foreground ,dotshare-red))))
   `(mew-face-eof-message ((,class (:foreground ,dotshare-green))))
   `(mew-face-eof-part ((,class (:foreground ,dotshare-yellow))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,dotshare-yellow))))
   `(nav-face-button-num ((,class (:foreground ,dotshare-cyan))))
   `(nav-face-dir ((,class (:foreground ,dotshare-green))))
   `(nav-face-hdir ((,class (:foreground ,dotshare-red))))
   `(nav-face-file ((,class (:foreground ,dotshare-fg))))
   `(nav-face-hfile ((,class (:foreground ,dotshare-red))))

   ;; org-mode
   `(org-agenda-date-today
     ((,class (:foreground "white" :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:foreground ,dotshare-fg :weight bold))))
   `(org-checkbox ((,class (:background ,dotshare-bg+2 :foreground "white"
:box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,dotshare-blue :underline t))))
   `(org-deadline-announce ((,class (:foreground ,dotshare-red))))
   `(org-done ((,class (:bold t :weight bold :foreground ,dotshare-green+1))))
   `(org-formula ((,class (:foreground ,dotshare-yellow))))
   `(org-headline-done ((,class (:foreground ,dotshare-green+1))))
   `(org-hide ((,class (:foreground ,dotshare-bg-1))))
   `(org-level-1 ((,class (:foreground ,dotshare-magenta+1))))
   `(org-level-2 ((,class (:foreground ,dotshare-green+1))))
   `(org-level-3 ((,class (:foreground ,dotshare-cyan+1))))
   `(org-level-4 ((,class (:foreground ,dotshare-yellow))))
   `(org-level-5 ((,class (:foreground ,dotshare-cyan))))
   `(org-level-6 ((,class (:foreground ,dotshare-green))))
   `(org-level-7 ((,class (:foreground ,dotshare-red))))
   `(org-level-8 ((,class (:foreground ,dotshare-blue+1))))
   `(org-link ((,class (:foreground ,dotshare-yellow :underline t))))
   `(org-scheduled ((,class (:foreground ,dotshare-green+1))))
   `(org-scheduled-previously ((,class (:foreground ,dotshare-red))))
   `(org-scheduled-today ((,class (:foreground ,dotshare-blue+1))))
   `(org-special-keyword ((,class (:foreground ,dotshare-yellow))))
   `(org-table ((,class (:foreground ,dotshare-green+1))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-time-grid ((,class (:foreground ,dotshare-magenta+1))))
   `(org-todo ((,class (:bold t :foreground ,dotshare-red :weight bold))))
   `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   `(org-warning ((,class (:bold t :foreground ,dotshare-red :weight bold))))

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
   `(post-email-address-text-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(post-emoticon-face ((,class (:foreground ,dotshare-green+1 :weight bold))))
   `(post-header-keyword-face ((,class (:foreground ,dotshare-bg+1))))
   `(post-header-value-face ((,class (:foreground ,dotshare-fg))))
   `(post-multiply-quoted-text-face ((,class (:foreground ,dotshare-magenta+1))))
   `(post-quoted-text-face ((,class (:foreground ,dotshare-yellow))))
   `(post-signature-text-face ((,class (:foreground ,dotshare-bg+2))))
   `(post-underline-face ((,class (:foreground ,dotshare-green))))
   `(post-url-face ((,class (:foreground ,dotshare-blue :underline t))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,dotshare-cyan :weight bold))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,dotshare-blue+1 :weight bold))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,dotshare-red+1 :weight bold))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,dotshare-green+1 :weight bold))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,dotshare-cyan+1 :weight bold))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,dotshare-green+1 :weight bold))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,dotshare-red :weight bold))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,dotshare-yellow :weight bold))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,dotshare-green+1 :weight bold))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,dotshare-blue+1 :weight bold))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,dotshare-red :weight bold))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,dotshare-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,dotshare-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,dotshare-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,dotshare-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,dotshare-red))))
   `(rpm-spec-package-face ((,class (:foreground ,dotshare-red))))
   `(rpm-spec-section-face ((,class (:foreground ,dotshare-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,dotshare-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,dotshare-red))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,dotshare-fg :background ,dotshare-red :weight bold))))
   `(show-paren-match ((,class (:foreground ,dotshare-fg :background ,dotshare-blue+1 :weight bold))))

   ;; speedbar
   `(speedbar-button-face ((,class (:foreground ,dotshare-green+1))))
   `(speedbar-directory-face ((,class (:foreground ,dotshare-blue+1))))
   `(speedbar-file-face ((,class (:foreground ,dotshare-fg))))
   `(speedbar-highlight-face ((,class (:background ,dotshare-bg+2))))
   `(speedbar-selected-face ((,class (:background ,dotshare-bg+1))))
   `(speedbar-separator-face ((,class (:foreground ,dotshare-bg+1))))
   `(speedbar-tag-face ((,class (:foreground ,dotshare-yellow))))

   ;; wl (wanderlust)
   ;; some faces end with -face, while other don't; confusing
   `(wl-highlight-folder-few-face ((,class (:foreground ,dotshare-red))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,dotshare-red))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,dotshare-magenta+1))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,dotshare-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,dotshare-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,dotshare-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,dotshare-red))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,dotshare-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,dotshare-green+1))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,dotshare-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,dotshare-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,dotshare-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,dotshare-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,dotshare-green+1))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,dotshare-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,dotshare-green+1))))
   `(wl-highlight-message-signature ((,class (:foreground ,dotshare-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,dotshare-fg))))
   `(wl-highlight-summary-answeredace ((,class (:foreground ,dotshare-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,dotshare-fg
:slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,dotshare-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,dotshare-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,dotshare-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,dotshare-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,dotshare-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold)))))

  (custom-theme-set-variables
   'dotshare

   `(ansi-color-names-vector
     [,dotshare-bg ,dotshare-red ,dotshare-green ,dotshare-yellow
,dotshare-blue ,dotshare-magenta ,dotshare-cyan ,dotshare-fg])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,dotshare-bg ,dotshare-red ,dotshare-green ,dotshare-yellow
,dotshare-blue ,dotshare-magenta ,dotshare-blue ,dotshare-fg])))

(provide-theme 'dotshare)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; dotshare-theme.el ends here.
