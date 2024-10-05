### CommandArgを使ってスクリプトへ引数を渡す

## Rスクリプト（コマンド） -> Rスクリプト　を動かす
参考) [Rのsource()関数で呼び出すスクリプトに引数を渡すとき](https://blog.statsbeginner.net/entry/2021/07/08/180414)
#### 引数を送る側のスクリプト
```r
# 第１引数: 
  subdir = "CellChat_results_ECMC_Wounded"
  dir.create(subdir)
# 第２引数
  Idents(subObject) <- "Annotation1"
  unique(subObject$Annotation1)  
  vertex.receiver = c(1,2,5,6)

#引き数をリストで渡す
commandArgs <- function(...) {list(subdir, vertex.receiver)}
source(SourceFile)
```

#### 引数を受け取る側のスクリプト (SourceFile)
```r
#> Now analyzing
Args = commandArgs(trailingOnly = TRUE) ## 引数受け取り
# Args = commandArgs()
  print(Args)

## 引き数をリストで受ける

## 第一引数:ファイルの名前
Args1_Filename = Args[[1]]
  print(paste0 ("Argument1: ", Args1_Filename))
## 第二引数:ファイルの名前
vertex.receiver = Args[[2]]
  print(paste0 ("Argument2: ", vertex.receiver))
```
----------------
