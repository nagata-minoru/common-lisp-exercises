(defun my-last (lst)
  "LST の最後の要素を返す。"
  (cond
    ((null lst) nil)
    ((null (cdr lst)) (car lst))
    (t (my-last (cdr lst)))))

(defun main ()
  "MY-LAST の実行例を表示する。"
  (let ((my-list '(1 2 3 4 5)))
    (format t "The last element of the list is: ~a~%" (my-last my-list))))
