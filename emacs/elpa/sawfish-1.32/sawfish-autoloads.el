;;; sawfish-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (sawfish-interaction sawfish-console sawfish-rep-info
;;;;;;  sawfish-info sawfish-complete-symbol sawfish-apropos sawfish-info-variable
;;;;;;  sawfish-info-function sawfish-describe-variable sawfish-describe-function
;;;;;;  sawfish-eval-print-last-sexp sawfish-eval-last-sexp sawfish-eval-expression
;;;;;;  sawfish-eval-defun sawfish-eval-buffer sawfish-eval-region
;;;;;;  sawfish-mode) "sawfish" "sawfish.el" (21103 13802 472010
;;;;;;  529000))
;;; Generated autoloads from sawfish.el

(autoload 'sawfish-mode "sawfish" "\
Major mode for editing sawfish files and for interacting with sawfish.

Special commands:

\\{sawfish-mode-map}

\(fn)" t nil)

(autoload 'sawfish-eval-region "sawfish" "\
Evaluate the region bounded by START and END.

TARGET-BUFFER is the optional target for the return value of the
evaluation.

\(fn START END &optional TARGET-BUFFER)" t nil)

(autoload 'sawfish-eval-buffer "sawfish" "\
Evaluate the whole buffer.

\(fn)" t nil)

(autoload 'sawfish-eval-defun "sawfish" "\
Evaluate the top level form at or near `point'.

INSERT-VALUE is a prefix parameter, if it is non-NIL the value of the
expression is inserted into the buffer after the form.

\(fn INSERT-VALUE)" t nil)

(autoload 'sawfish-eval-expression "sawfish" "\
Evaluate SEXP and display the value in the minibuffer.

If the optional parameter INSERT-VALUE is supplied as a non-NIL value the
value of SEXP will be inserted into the current buffer.

\(fn SEXP &optional INSERT-VALUE)" t nil)

(autoload 'sawfish-eval-last-sexp "sawfish" "\
Version of `eval-last-sexp' that interacts with sawfish.

\(fn TO-BUFFER)" t nil)

(autoload 'sawfish-eval-print-last-sexp "sawfish" "\


\(fn)" t nil)

(autoload 'sawfish-describe-function "sawfish" "\
Display the doc-string for FUNCTION.

\(fn FUNCTION)" t nil)

(autoload 'sawfish-describe-variable "sawfish" "\
Display the doc-string for VARIABLE.

\(fn VARIABLE)" t nil)

(autoload 'sawfish-info-function "sawfish" "\
Display the Info documentation for FUNCTION.

\(fn FUNCTION)" t nil)

(autoload 'sawfish-info-variable "sawfish" "\
Display the Info documentation for VARIABLE.

\(fn VARIABLE)" t nil)

(autoload 'sawfish-apropos "sawfish" "\
Show all bound sawfish symbols whose names match REGEXP.

\(fn REGEXP)" t nil)

(autoload 'sawfish-complete-symbol "sawfish" "\
Attempt to complete the symbol at `point'.

\(fn)" t nil)

(autoload 'sawfish-info "sawfish" "\
View the sawfish info file.

\(fn)" t nil)

(autoload 'sawfish-rep-info "sawfish" "\
View the librep info file.

\(fn)" t nil)

(autoload 'sawfish-console "sawfish" "\
Run the sawfish client as an inferior lisp.

\(fn)" t nil)

(autoload 'sawfish-interaction "sawfish" "\
Create a sawfish interaction buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("sawfish-pkg.el") (21103 13802 642597
;;;;;;  578000))

;;;***

(provide 'sawfish-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sawfish-autoloads.el ends here
