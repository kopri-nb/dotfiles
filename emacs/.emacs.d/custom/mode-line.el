;; mode line
(setq-default mode-line-format
              (quote
               (" "
                ;; mode string
                (:propertize global-mode-string face 'mode-line-mode-string)

                ;; file path
                (:propertize (:eval (if (> (length default-directory) 17)
                                        (concat "..." (substring default-directory -20))
                                      default-directory))
                             face 'mode-line-folder-face)

                ;; file name
                (:propertize mode-line-buffer-identification face 'mode-line-buffer-name)
                (:propertize mode-line-modified face 'mode-line-modified-face)
                "  "
                ;; value of 'mode-name'
                (:propertize "%m" face 'mode-line-mode-name)
                " :: "
                ;; line #
                "line %l, %p")))