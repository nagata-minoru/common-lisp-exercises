(defun fib-iter (n a b)
  "A と B を使って N 番目のフィボナッチ数を反復的に求める。"
  (if (= n 0)
      a
      (fib-iter (- n 1) b (+ a b))))

(defun fib (n)
  "N 番目のフィボナッチ数を返す。"
  (fib-iter n 0 1))

(defun main (&rest argv)
  "引数で指定した番号のフィボナッチ数を表示する。"
  (if argv
      (format t "~a~%" (fib (parse-integer (car argv))))
      (format t "usage: ros fib.lisp <number>~%")))
