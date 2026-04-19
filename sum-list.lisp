(defun sum-list (lst)
  "LST に含まれる数値の合計を返す。"
  (reduce #'+ lst :initial-value 0))

(defun main (&rest argv)
  "SUM-LIST の実行例を表示する。"
  (declare (ignore argv))
  (format t "~a~%" (sum-list '(1 2 3 4))))
