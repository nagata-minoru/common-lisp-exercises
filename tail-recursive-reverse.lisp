(defun my-reverse (lst &optional (acc '()))
  "LST の要素を逆順にしたリストを返す。"
  ;; ACC は再帰中に反転済みの要素をためる蓄積用リスト。
  (if (null lst)
      acc
      (my-reverse (cdr lst)
                  (cons (car lst) acc))))

(defun main (&rest argv)
  "MY-REVERSE の実行例を表示する。"
  (declare (ignore argv))
  (format t "~a~%" (my-reverse '(1 2 3))))
