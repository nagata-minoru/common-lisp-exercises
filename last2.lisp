(defun last2 (lst)
  "LST の最後の 2 要素をリストとして返す。"
  (cond
    ((null lst) nil)
    ((null (cdr lst)) nil)
    ((null (cdr (cdr lst))) lst)
    (t
     (last2 (cdr lst)))))

(defun main ()
  "LAST2 の実行例を表示する。"
  (format t "~a~%" (last2 '(1 2 3 4 5))))
