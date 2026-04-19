(defun map-tree (lst)
  "LST の構造を保ったまま各要素に 1 を足したリストを返す。"
  (cond
    ((null lst) nil)
    ((atom lst) (+ 1 lst))
    (t
     (cons (map-tree (car lst))
           (map-tree (cdr lst))))))

(defun main (&rest argv)
  "MAP-TREE の実行例を表示する。"
  (declare (ignore argv))
  (format t "~a~%" (map-tree '((1 2) (3 (4 (5)))))))
