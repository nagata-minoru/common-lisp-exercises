(defun my-third (lst)
  "LST の 3 番目の要素を返す。"
  (car (cdr (cdr lst))))

(defun main ()
  "MY-THIRD の実行例を表示する。"
  (format t "~a~%" (my-third '(1 2 3 4 5))))
