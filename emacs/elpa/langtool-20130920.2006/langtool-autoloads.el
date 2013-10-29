;;; langtool-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (langtool-switch-default-language langtool-check-buffer)
;;;;;;  "langtool" "langtool.el" (21103 13804 644064 799000))
;;; Generated autoloads from langtool.el

(defalias 'langtool-check 'langtool-check-buffer)

(autoload 'langtool-check-buffer "langtool" "\
Check context current buffer and light up errors.
Optional \\[universal-argument] read LANG name.

You can change the `langtool-default-language' to apply all session.
Restrict to selection when region is activated.

\(fn &optional LANG)" t nil)

(autoload 'langtool-switch-default-language "langtool" "\
Switch `langtool-read-lang-name' to LANG

\(fn LANG)" t nil)

;;;***

;;;### (autoloads nil nil ("langtool-pkg.el") (21103 13804 788975
;;;;;;  967000))

;;;***

(provide 'langtool-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; langtool-autoloads.el ends here
