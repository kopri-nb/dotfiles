;;; evil-nerd-commenter-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (evilnc-default-hotkeys evilnc-copy-and-comment-lines
;;;;;;  evilnc-comment-or-uncomment-lines evilnc-toggle-comment-empty-lines
;;;;;;  evilnc-comment-or-uncomment-to-the-line evilnc-comment-or-uncomment-paragraphs)
;;;;;;  "evil-nerd-commenter" "evil-nerd-commenter.el" (21103 13836
;;;;;;  584862 855000))
;;; Generated autoloads from evil-nerd-commenter.el

(autoload 'evilnc-comment-or-uncomment-paragraphs "evil-nerd-commenter" "\
Comment or uncomment paragraph(s). A paragraph is a continuation non-empty lines.
Paragraphs are separated by empty lines.

\(fn &optional NUM)" t nil)

(autoload 'evilnc-comment-or-uncomment-to-the-line "evil-nerd-commenter" "\
Comment or uncomment from the current line to the LINENUM line

\(fn &optional LINENUM)" t nil)

(autoload 'evilnc-toggle-comment-empty-lines "evil-nerd-commenter" "\


\(fn)" t nil)

(autoload 'evilnc-comment-or-uncomment-lines "evil-nerd-commenter" "\
Comment or uncomment lines.
   Case 1: If no region selected, comment/uncomment on current line. if NUM>1, comment/uncomment
   extra N-1 lines from next line
   Case 2: If a region selected, the region is expand to make sure the region contain
   whole lines. Then we comment/uncomment the expanded region. NUM is ignored.

\(fn &optional NUM)" t nil)

(autoload 'evilnc-copy-and-comment-lines "evil-nerd-commenter" "\
Copy and paste lines. Then comment original lines.
   Case 1: If no region selected, operate on current line. if NUM>1, comment/uncomment
   extra N-1 lines from next line
   Case 2: If a region selected, the region is expand to make sure the region contain
   whole lines. Then we operate the expanded region. NUM is ignored.

\(fn &optional NUM)" t nil)

(autoload 'evilnc-default-hotkeys "evil-nerd-commenter" "\
Set the hotkeys of evil-nerd-comment

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("evil-nerd-commenter-pkg.el") (21103 13836
;;;;;;  679271 992000))

;;;***

(provide 'evil-nerd-commenter-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-nerd-commenter-autoloads.el ends here
