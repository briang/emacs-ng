;;; make-matrix creates a matrix (a vector of vectors).
(define make-matrix
  (lambda (rows columns)
    (do ((m (make-vector rows))
         (i 0 (+ i 1)))
        ((= i rows) m)
      (vector-set! m i (make-vector columns)))))
