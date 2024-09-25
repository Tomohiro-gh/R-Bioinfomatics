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


-------------------------------------
## NAが入っている要素も省略しない （defaultではomitされる）
refs) [Do not remove na values in ggplot](https://stackoverflow.com/questions/33501519/do-not-remove-na-values-in-ggplot)

`geom_point`を2回使う 
- 1回目は，naに対して．全て白で塗る　`geom_point(data = subset(df, is.na(p_val_adj)，
color = "white")`
- 2回目は，`geom_point(data = subset(df, !is.na(p_val_adj)),
 aes(color = avg_log2FC, 
size = -log10(p_val_adj)))`

                   
```r
## 例) 240718_GOI_Expression.R 
FUN.DotPlot.Jisaku <- function(DEG_df, GeneList, FileName = NULL){
  
  comp = DEG_df$Comparison %>% unique()
    #print(comp)
  df <- data.frame(Comparison = rep(comp, length(GeneList)),
                   Gene = GeneList)
  ## DFの結合
  DFcombined <- left_join(df, DEG_df, by = c("Comparison", "Gene")) %>% 
    filter(Gene %in% GeneList) %>% 
    dplyr::mutate(p_val_adj = 
                    ifelse(p_val_adj <= 1e-50, 1e-50,
                           p_val_adj))# %>% 
   # sort(Comparison)
  ## 並び順変更
  DFcombined$Comparison <- factor(x = DFcombined$Comparison,
                                  levels = comp)
  DFcombined$Gene <- factor(x = DFcombined$Gene,
                            levels = GeneList)  
      print(DFcombined$Comparison)
  ## 本体
dp <- 
  ggplot(data = DFcombined,
               aes(x = Gene,
                   y = Comparison)) + 
    geom_point(data = subset(DFcombined, is.na(p_val_adj)),
               color = "white") + 
    geom_point(data = subset(DFcombined, !is.na(p_val_adj)),
               aes(color = avg_log2FC,
                   size = -log10(p_val_adj))) +
    # scale_size_continuous(limits = c(-3, 3)) +
    # scale_color_gradientn(colours = viridis::inferno(100),
    scale_color_gradientn(colours = viridis::viridis(100),
                          limits = c(min(DFcombined$avg_log2FC), 
                                     max(DFcombined$avg_log2FC))) + 
    scale_size_continuous(limits = c(0, 
                                     max(-log10(DFcombined$p_val_adj)))) +
    # plot.margin = unit(c(1, 1, -1, 1), "lines")) + 
    labs(title = "DEGs, pvalue x Fold Changes", x = "", y = "") + 
    theme_classic() +
    MyTheme
  
      plot(dp)


```
