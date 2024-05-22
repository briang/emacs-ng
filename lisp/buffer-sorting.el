(require 'seq)

(defun compare-buffer-names (a b)
  ""
  (string< (downcase a)
           (downcase b)))

(defun filter-buffer-names-p (b)
  ""
  (let ((first (substring b 0 1)))
    (or (string= "*" first)
        (string= " " first))))

;; maybe use projectile's idea of a project?
(defun buffers ()
  (cl-remove-if ; seq-filter or seq-remove?
   #'filter-buffer-names-p
   (mapcar #'buffer-name (buffer-list))))

(defun sort-buffers ()
  ""
  (sort (buffers) #'compare-buffer-names))

(defun page-up-down (page-up-p)
  (let* ((this (buffer-name (current-buffer)))
         ;; if 'buffers' is empty, remain in current buffer
         (buffers (or (if page-up-p
                          (reverse (sort-buffers))
                        (sort-buffers))
                      (list this)))
         ;; 'index=0' if 'this' isn't in 'buffers'
         (index (or (seq-position buffers this) 0)))
    (switch-to-buffer
     (seq-elt (append buffers (list (car buffers))) (+ 1 index)))))

(defun page-down ()
  ""
  (interactive)
  (page-up-down nil))

(defun page-up ()
  ""
  (interactive)
  (page-up-down t))

(global-set-key (kbd "C-<next>") #'page-down)
(global-set-key (kbd "C-<prior>") #'page-up)
