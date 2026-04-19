(defun my-reverse (lst)
  "LST の要素を逆順にしたリストを返す。"
  (cond
    ((null lst) '())
    (t
     (append (my-reverse (cdr lst))
             (list (car lst))))))

(defun main (&rest argv)
  "MY-REVERSE の実行例を表示する。"
  (declare (ignore argv))
  (format t "~a~%" (my-reverse '(1 2 3))))
