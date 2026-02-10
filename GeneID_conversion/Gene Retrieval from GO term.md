## GO termから 遺伝子リストを取得する

```r
Glucose <- AnnotationDbi::select(org.Mm.eg.db, keys=c("GO:0006006"), columns = c('SYMBOL'), keytype = "GOALL")
  Glucose
  dim(Glucose) #[1] 305   4
  unique(Glucose$SYMBOL) %>% length # [1] 225
```

  
