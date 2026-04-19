(defun my-butlast (lst)
  "LST から最後の要素を除いたリストを返す。"
  (cond
    ((null lst) nil)
    ((null (cdr lst)) nil)
    (t (cons (car lst) (my-butlast (cdr lst))))))

(defun main ()
  "MY-BUTLAST の実行例を表示する。"
  (let ((my-list '(1 2 3 4 5)))
    (format t "The list without the last element is: ~a~%"
            (my-butlast my-list))))
