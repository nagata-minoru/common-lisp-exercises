(defun fib (n)
  "N 番目のフィボナッチ数を返す。"
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t
     (+ (fib (- n 1))
        (fib (- n 2))))))

(defun main (&rest argv)
  "引数で指定した番号のフィボナッチ数を表示する。"
  (if argv
      (format t "~a~%" (fib (parse-integer (car argv))))
      (format t "usage: ros fib.lisp <number>~%")))
