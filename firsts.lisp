(defun firsts (lst)
  "LST に含まれる各リストの先頭要素を集めたリストを返す。"
  (cond
    ((null lst) nil)
    ((atom (car lst)) (firsts (cdr lst)))
    (t
     (cons (car (car lst))
           (firsts (cdr lst))))))

(defun main ()
  "FIRSTS の実行例を表示する。"
  (format t "~a~%" (firsts '((1 2) (3 4) (5 6))))
  (format t "~a~%" (firsts ''((1 2) foo (3 4)))))
