(defun touch (filename)
  "Updates a file's modification time (mtime) to the curremt time"
  (interactive "Ffilename: ")
  ;; `set-file-times` requires the file to exist. `write-region` will
  ;; create a file if it does not exist, but will not append an empty
  ;; string to an existing file.
  (let ((f (shell-quote-argument filename)))
    (if (file-exists-p f)
      (set-file-times f)
    (write-region "" nil f t))))
