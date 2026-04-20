# Common Lisp 練習用コード集

Common Lisp の基本的な再帰処理、リスト操作、木構造の処理を試すための小さなコード集です。
各ファイルは独立して読み込めるようにしてあり、簡単な `main` 関数とテストを用意しています。

## 必要なもの

- Roswell
- Roswell から起動できる Common Lisp 処理系

## ファイル

| ファイル | 内容 |
| --- | --- |
| `count-atoms.lisp` | 入れ子リストに含まれる atom の数を数える |
| `double-all.lisp` | リストや入れ子リストの各数値を 2 倍にする |
| `even-only.lisp` | リストから偶数だけを取り出す |
| `fib.lisp` | 素朴な再帰でフィボナッチ数を求める |
| `fib-fast.lisp` | 末尾再帰でフィボナッチ数を求める |
| `fib-memo.lisp` | メモ化してフィボナッチ数を求める |
| `firsts.lisp` | リストの要素になっている各リストから先頭要素を取り出す |
| `flatten.lisp` | 入れ子リストを平坦なリストにする |
| `last2.lisp` | リストの最後の 2 要素を返す |
| `map-tree.lisp` | 入れ子リストの構造を保ったまま各要素に 1 を足す |
| `my-butlast.lisp` | リストから最後の要素を除いたリストを返す |
| `my-last.lisp` | リストの最後の要素を返す |
| `reverse.lisp` | `append` を使った再帰でリストを逆順にする |
| `sum-list.lisp` | リストに含まれる数値の合計を求める |
| `tail-recursive-reverse.lisp` | 蓄積用リストを使った末尾再帰でリストを逆順にする |
| `third.lisp` | リストの 3 番目の要素を返す |
| `tree-max.lisp` | 入れ子リストに含まれる最大値を求める |
| `tests.lisp` | 各ファイルの簡単なテスト |

## 実行例

各ファイルは `main` 関数を持っています。Roswell でファイルを読み込んで実行できます。

固定のサンプル入力を表示するファイルは、次のように実行します。

```sh
ros run -l sum-list.lisp -e '(main)' -q
```

`fib.lisp`、`fib-fast.lisp`、`fib-memo.lisp` は数値引数を受け取ります。

```sh
ros run -l fib.lisp -E main -- 10
```

## テスト

次のコマンドでテストを実行できます。

```sh
ros run +Q -l tests.lisp -q
```

成功すると、最後に次のように表示されます。

```text
40 tests passed.
```

GitHub Actions でも同じテストを実行します。
