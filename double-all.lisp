(defun double-all (lst)
  "LST の各要素を 2 倍にし、入れ子リストの構造を保って返す。"
  (cond
    ((null lst) nil)
    ((atom lst) (* 2 lst))
    (t
     (cons (double-all (car lst))
           (double-all (cdr lst))))))

(defun main ()
  "DOUBLE-ALL の実行例を表示する。"
  (format t "~a~%" (double-all '(1 2 3))))
