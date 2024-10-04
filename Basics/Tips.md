

### メモリ関係のエラー
 `Error in getGlobalsAndPackages(expr, envir = envir, globals = globals)` の対処法



[Seuratにも](https://satijalab.org/seurat/archive/v3.1/future_vignette)

Cellchatをrunしたら出た．スクリプトへ下記を加えればいいみたい

```r
options(future.globals.maxSize = XXXX * 1024 ^ 2)
## XXXX　に使用したいメモリを使用 
```
