# Basic Handling

## オブジェクト名を生かしたlistを作る
https://qiita.com/nozma/items/d5ecaf451e5f67125613




```r
namedlist3 <- function(...){
  object_name <- as.character(eval(substitute(alist(...))))
  x <- list(...)
  vnames <- names(x)
  novnames <- !nzchar(vnames)
  if (length(novnames) > 0L){
    vnames[novnames] <- object_name[novnames]
  } else {
    vnames <- object_name
  }
  setNames(x, vnames)
}
```
execution
```r
a <- 1:3
b <- 11:13
c <- 21:23
namedlist3(a, hoge = b, c)

## Output
# $a
# [1] 1 2 3
# $hoge
# [1] 11 12 13
# $c
# [1] 21 22 23
```
