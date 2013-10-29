(make-face 'mode-line-evil)
(make-face 'mode-line-padder)
(set-face-attribute 'mode-line-evil nil :box nil)
(set-face-attribute 'mode-line-padder nil :box '(:line-width 4 :color "grey20"))

(add-to-list 'load-path (concat vendor-dir "evil-plugins/"))
(require 'evil-mode-line)

(setq-default mode-line-format
  '(""
    ;; the buffer name; the file name as a tool tip

	 (:propertize evil-mode-line-msg face mode-line-evil)
	 " "
	 (:propertize (:eval (shorten-directory default-directory 30))
								face mode-line-folder-face)
	 (:propertize "%b" face mode-line-buffer-name)
	 mode-line-frame-identification
	 (:propertize mode-line-modified face mode-line-modified)
	 " "
	 (:propertize "%4l:" face mode-line-line-face)
   (:eval (propertize "%c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-col-face)))
	 " " 
	 (:propertize mode-name face mode-line-mode-face)
	 mode-line-process
	 "%n"
	 " "
	 (which-func-mode ("" which-func-format "-"))
	 (:propertize " " face mode-line-padder)
	 (powerline-fill mode-line-padder)
	 (:propertize minor-mode-alist face mode-line-minor-mode-face)
	 ;; global-mode-string
	 ))

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))
