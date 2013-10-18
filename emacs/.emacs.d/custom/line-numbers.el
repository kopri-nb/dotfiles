;; -------~-------~--~------------------~------
;; LINE NUMBERS
;; -------~-------~--~------------------~------
;; line #s
(line-number-mode 1)
(global-linum-mode 1)

(defun linum-absolute-numbers ()
  "Set linum numbers to absolute values"
  (setq linum-is-relative 0)
  (setq linum-format
        (lambda (line)
          (propertize (format
                       (let ((w (length (number-to-string
                                         (count-lines (point-min) (point-max))))))
                         (concat " %" (number-to-string w) "d "))
                       line)
                      'face 'linum))))

(defun linum-relative-numbers ()
  "Set linum numbers to relative values"
  (defvar my-linum-current-line-number 0)
  (setq linum-is-relative 1)
  (setq linum-format
        (lambda (line-number)
          (propertize (format
                       (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
                         (concat " %" (number-to-string (+ w 1)) "s "))
                       (let ((relative-line (1+ (- line-number my-linum-current-line-number))))
                         (number-to-string (cond ((/= relative-line 0) (- relative-line 1))
                                                 ((= relative-line 0) -1)))))
                      'face 'linum))))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

(defun toggle-linum ()
  "Toggle line number display between absolute and relative numbers"
  (interactive)
  (if (= linum-is-relative 1)
      (linum-absolute-numbers)
    (linum-relative-numbers)))