(defvar *passed* 0)

(defun source-path (name)
  "テストファイルから見た NAME のパス名を返す。"
  (merge-pathnames name (or *load-truename* *default-pathname-defaults*)))

(defun load-source (name)
  "NAME で指定したソースファイルを静かに読み込む。"
  (load (source-path name) :verbose nil :print nil))

(defun forget-functions (&rest names)
  "NAMES で指定した関数定義を未定義に戻す。"
  (dolist (name names)
    (when (fboundp name)
      (fmakunbound name))))

(defmacro check (name expected form)
  "FORM の値が EXPECTED と等しいことを確認する。"
  `(let ((expected-value ,expected)
         (actual-value ,form))
     (unless (equal actual-value expected-value)
       (error "~a: expected ~s, got ~s" ,name expected-value actual-value))
     (incf *passed*)
     (format t "ok ~a~%" ,name)))

;; 入れ子リストに含まれる atom の数を確認する。
(forget-functions 'count-atoms 'main)
(load-source "count-atoms.lisp")
(check "count-atoms: empty list" 0 (count-atoms nil))
(check "count-atoms: nested list" 7 (count-atoms '(1 (2 (3 4) 5) (6 7))))

;; リストから偶数だけを取り出せることを確認する。
(forget-functions 'even-only 'main)
(load-source "even-only.lisp")
(check "even-only: mixed numbers" '(2 4 6) (even-only '(1 2 3 4 5 6)))
(check "even-only: no even numbers" nil (even-only '(1 3 5)))

;; 素朴な再帰版のフィボナッチ数を確認する。
(forget-functions 'fib 'main)
(load-source "fib.lisp")
(check "fib: zero" 0 (fib 0))
(check "fib: one" 1 (fib 1))
(check "fib: ten" 55 (fib 10))

;; 反復的な再帰版のフィボナッチ数を確認する。
(forget-functions 'fib-iter 'fib 'main)
(load-source "fib-fast.lisp")
(check "fib-fast: iterator" 55 (fib-iter 10 0 1))
(check "fib-fast: ten" 55 (fib 10))

;; メモ化版のフィボナッチ数とキャッシュへの保存を確認する。
(forget-functions 'fib 'main)
(load-source "fib-memo.lisp")
(check "fib-memo: ten" 55 (fib 10))
(check "fib-memo: memoized value" 55 (gethash 10 *fib-memo*))

;; 入れ子リストを平坦化できることを確認する。
(forget-functions 'flatten 'main)
(load-source "flatten.lisp")
(check "flatten: empty list" nil (flatten nil))
(check "flatten: nested list" '(1 2 3 4 5) (flatten '((1 2) (3 (4 (5))))))

;; 入れ子リストの構造を保って各要素を変換できることを確認する。
(forget-functions 'map-tree 'main)
(load-source "map-tree.lisp")
(check "map-tree: nested list" '((2 3) (4 (5 (6)))) (map-tree '((1 2) (3 (4 (5))))))

;; append を使った再帰版のリスト反転を確認する。
(forget-functions 'my-reverse 'main)
(load-source "reverse.lisp")
(check "reverse: empty list" nil (my-reverse nil))
(check "reverse: list" '(3 2 1) (my-reverse '(1 2 3)))

;; リストに含まれる数値の合計を確認する。
(forget-functions 'sum-list 'main)
(load-source "sum-list.lisp")
(check "sum-list: empty list" 0 (sum-list nil))
(check "sum-list: list" 10 (sum-list '(1 2 3 4)))

;; 蓄積用リストを使った末尾再帰版のリスト反転を確認する。
(forget-functions 'my-reverse 'main)
(load-source "tail-recursive-reverse.lisp")
(check "tail-recursive-reverse: empty list" nil (my-reverse nil))
(check "tail-recursive-reverse: list" '(3 2 1) (my-reverse '(1 2 3)))

;; 入れ子リストに含まれる最大値を確認する。
(forget-functions 'tree-max 'main)
(load-source "tree-max.lisp")
(check "tree-max: empty list" nil (tree-max nil))
(check "tree-max: nested list" 5 (tree-max '((1 2) (3 (4 (5))))))

(format t "~&~d tests passed.~%" *passed*)
