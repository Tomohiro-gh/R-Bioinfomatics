# R-data-frame-handling
R data frame handling (memo)


##  <span style="color: `#007AFF`">重複なしのrownamesを作成</span>
ref) https://staffblog.amelieff.jp/entry/2021/10/05/120000

```r
# using make.names() function
genes.df[[1]] <- make.names(genes.df[[1]], unique=TRUE)
```

## NA処理について
ある列にNAが入った場合，　同じ行にある列の要素を代入するやり方 https://anpontan382.hatenablog.com/entry/2017/05/07/223539
```r
## １列目のNAの要素を3列目で置き換える
genes.df[[1]][which(is.na(genes.df[[1]]))] <-
  genes.df[[3]][which(is.na(genes.df[[1]]))]
```

##　重複行を置換する機能
重複を見つけ出し，　重複があった場合には別の列を参照し，その値を入れる
```r
# 3列目の重複部分について，1行目を代入する
  genes.df[[3]][which(duplicated(df.merge[[3]]))] <- 
    df.merge[[1]][which(duplicated(df.merge[[3]]))]
```

-------------------------------------

## colnameの変更 - 特定の列名のみ変更する場合

・　[参考１)](https://tips-r.blogspot.com/2018/02/r.html) : `names` 関数を使用

・　[参考2)](https://indenkun.hatenablog.com/entry/2020/06/20/202500) : `colnames`　関数を使用

```r
# Example1)
colnames(df)[1] <- "ID"
colnames(df)[length(ncol(df))] <- "ID"

# Example2)：　colnameの番号を指定せず， colnameが一致する箇所だけを変更する
objectname <- names(df) %>% tail(1)
names(df)names(df)[which(names(df) == objectname)] <- "ID"

names(df)names(df)[which(names(df) == "xxxxx")] <- "ID"

```

・　[参考3)](https://keachmurakami.github.io/2016/04/01/colnames.html) : 中間生成なしでカラムの名前を変える５つの方法
`dplyr::rename`, `magrittr::set_names`, `data.table::setnames`, `select`, `dplyr::tranmute`

を使うと良いが，　個人的には`dplyr::rename`が使いやすい

