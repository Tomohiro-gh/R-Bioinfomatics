# R-ggplot2

#### ggplot2 graph 

## Theme settings:
https://ggplot2.tidyverse.org/reference/theme.html
```r
myTHEME <- theme(
  plot.title = element_text(hjust=0.5, size=24, face="bold"),
  plot.subtitle = element_text(size = 24, hjust = 0.5),
  axis.title.x = element_text(hjust=0.5, size=24, face="bold"),
  axis.title.y = element_text(hjust=0.5, size= 24, face="bold"),
  axis.text.x = element_text(hjust=0.5, colour = "black", size= 24, face="bold"),
  axis.text.y = element_text(hjust=0.5, colour = "black", size= 24, face="bold"),
  axis.line=element_line(colour = "black", linewidth=1.0),
  axis.ticks=element_line(colour = "black", linewidth = 1.0),
  axis.ticks.length = unit(4, "mm"),
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  panel.background = element_blank(), 
  text = element_text(size = 24, family="Arial"),
  legend.position = 'none')


## Pattern2

```


```r
myTHEME <- theme(
  plot.title = element_text(hjust=0.5, size=20),
  legend.position = 'none',
  plot.subtitle = element_text(size = 14, hjust = 0.5),
  axis.title.x = element_text(hjust=1, size= 28, face="bold", colour = "black"), 
  axis.title.y = element_text(size= 28, face="bold",colour = "black"),
  axis.text.x = element_text(size= 28, face="bold", colour = "black"), 
  axis.text.y = element_text(size= 28, face="bold", colour = "black"),
  axis.line = element_line(colour = "black", linewidth=1.0), 
  axis.ticks = element_line(colour = "black", linewidth=1.0), 
  axis.ticks.length = unit(4, "mm"),
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  panel.background = element_blank(), 
  text = element_text(size = 12))

```

#### Theme option
-　`panel.grid.major = element_blank()` 背景の主グリッドを消す

-　`panel.grid.minor = element_blank()` 背景の主グリッドを消す

-　`panel.background = element_blank()` 背景を透明にする

-　`axis.ticks.length = unit(4, "mm")` メモリのヒゲの長さ，内向きはマイナス


## 軸目盛りの長さの制御 (内向きも含む)
参考) https://qiita.com/kattsu2003/items/266e1a0709961f5ba81f
theme内の unitの長さで変更可能
```r
 theme(axis.ticks.length = unit(4, "mm"))
 theme(axis.ticks.length = unit(-2, "mm")) #内向き
```

## legendの設定: themeの中で制御
- 凡例の位置
`legend.position` : 1) 座標で指定 (ex `c(0,0)`)  2) 文字列で指定 (`'none', 'left', 'bottom'`など) [参考](https://blog.atusy.net/2018/11/10/ggplot2-legend-pos-n-just/)

- 凡例の並び替え
  guideで制御可能：　`guides(color = guide_legend(reverse = TRUE))`　[参考](https://uribo.hatenablog.com/entry/2019/12/12/071401)

- legendの背景の色を設定
  element_rectで調整：　ex) `theme(legend.key = element_rect(fill = "#e9e4d4", color = "black"))`
- 凡例の文字サイズ
  

```r
## legendについてのまとめ
theme_legend <-
  theme(
    legend.position = 'right',
    legend.position	= c(0.15, 0.85),
    legend.title = element_blank(),
    legend.text = element_text(size = ),
    legend.key = element_blank()) +
  guides(color = guide_legend(reverse = TRUE))
```




## Changing fonts in ggplot2
themeの中にfamilyを指定すれば良い．　他には， "Arial" や  "Comic Sans MS"など
```r
theme(family="Serif")
```
