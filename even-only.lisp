(defun even-only (lst)
  "LST から偶数だけを取り出したリストを返す。"
  (remove-if-not #'evenp lst))

(defun main (&rest argv)
  "EVEN-ONLY の実行例を表示する。"
  (declare (ignore argv))
  (format t "~a~%" (even-only '(1 2 3 4 5 6))))
