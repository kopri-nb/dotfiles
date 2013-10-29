;org mode ya bish
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
(setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
'("article"
"\\documentclass{article}"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/doctors.org" 
                             "~/org/home.org"))
