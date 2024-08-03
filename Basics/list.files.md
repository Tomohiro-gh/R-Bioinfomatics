### `list.files`機能でファイルリストを取得する


参考）[R：list.filesによるファイルパス取得あれこれ。](https://qiita.com/dokokano_panda/items/8962650700130bd99ab7)

```r
wd = "my/workingdirectory"

list.files()

## パターの指定
list.files(wd, pattern=".R$") #.Rファイルのみ

## さぶディレクトリの指定
list.files(wd, recursive=T)

## ディレクトリも含める
list.files(path, include.dirs=T)

## fullpath
list.files(wd, full.names=T)

```




