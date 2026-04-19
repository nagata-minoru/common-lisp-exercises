(defun tree-max (lst)
  "入れ子になった LST に含まれる最大値を返す。"
  (cond ((null lst) nil)
        ((atom lst) lst)
        (t
         (let ((left (tree-max (car lst)))
               (right (tree-max (cdr lst))))
           (cond ((null left) right)
                 ((null right) left)
                 (t (max left right)))))))

(defun main (&rest argv)
  "TREE-MAX の実行例を表示する。"
  (declare (ignore argv))
  (format t "~a~%" (tree-max '((1 2) (3 (4 (5)))))))
