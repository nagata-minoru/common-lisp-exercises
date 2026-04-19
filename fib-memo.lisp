(defparameter *fib-memo* (make-hash-table))

(defun fib (n)
  "N 番目のフィボナッチ数をメモ化して返す。"
  (or (gethash n *fib-memo*)
      (setf (gethash n *fib-memo*)
            (cond ((= n 0) 0)
                  ((= n 1) 1)
                  (t
                   (+ (fib (- n 1))
                      (fib (- n 2))))))))

(defun main (&rest argv)
  "引数で指定した番号のフィボナッチ数を表示する。"
  (if argv
      (format t "~a~%" (fib (parse-integer (car argv))))
      (format t "usage: ros fib-memo.lisp <number>~%")))
