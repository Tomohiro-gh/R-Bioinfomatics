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

## 軸目盛りの長さの制御 (内向きも含む)
参考) https://qiita.com/kattsu2003/items/266e1a0709961f5ba81f
theme内の unitの長さで変更可能
```r
 theme(axis.ticks.length = unit(4, "mm"))
 theme(axis.ticks.length = unit(-2, "mm")) #内向き
```


## Changing fonts in ggplot2
themeの中にfamilyを指定すれば良い．　他には， "Arial" や  "Comic Sans MS"など
```r
theme(family="Serif")
```
