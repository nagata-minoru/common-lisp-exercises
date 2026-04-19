(defun flatten (lst)
  "入れ子になった LST を平坦なリストにして返す。"
  (labels ((rec (lst acc)
             (cond
               ((null lst) acc)
               ((atom lst) (cons lst acc))
               (t (rec (cdr lst)
                       (rec (car lst) acc))))))
    (nreverse (rec lst nil))))

(defun main (&rest argv)
  "FLATTEN の実行例を表示する。"
  (declare (ignore argv))
  (format t "~a~%" (flatten '((1 2) (3 (4 (5)))))))
