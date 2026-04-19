(defun count-atoms (lst)
  (cond
    ((null lst) 0)
    ((atom lst) 1)
    (t (+ (count-atoms (car lst))
          (count-atoms (cdr lst))))))

(defun main (&rest argv)
  (declare (ignore argv))
  (format t "~a~%" (count-atoms '(1 (2 (3 4) 5) (6 7)))))
