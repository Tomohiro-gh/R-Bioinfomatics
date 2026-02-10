# R-ggplot2

#### ggplot2 graph 
## BAR + DOT PLOT
- ggplotで bar + dot plotを描写
- plotを返す関数 > 保存は別コマンド
- x_col, y_colは任意のカラムを指定できる．Character型で入れないこと
```r
## ggplot2で任意のx軸，y軸を指定し，plotをオブジェクトとして返す関数
FUN.PLOT.BAR.DOT <- function(df, x_col, y_col, Group, ylab, GraphTitle=NULL, GroupColors = NULL) {
  require(ggplot2)
  require(rlang)
  require(ggsci)
  require(dplyr)
  
  # rlang::enquo() を使用して引数を非標準評価でキャプチャする
  y_sym <- rlang::enquo(y_col)
  x_sym <- rlang::enquo(x_col)
  Gr_sym <- rlang::enquo(Group)
  
  # 1. NAの除外 (Y軸の値が存在しない行は除外)
  df <- df |> dplyr::filter(!is.na(!!y_sym))
  
  # 2. GroupColorsの自動設定
  if (is.null(GroupColors)) {
    # データの存在するグループ名と数を取得し，色を生成
    group_levels <- df |>
      dplyr::pull(!!Gr_sym) |>
      unique() |>
      sort()
    num_groups <- length(group_levels)
    pal <- ggsci::pal_aaas()(num_groups)
    # scale_manual の values に渡す
    GroupColors <- setNames(pal, group_levels)
  }
  
  # a_seed <- 155 # 固定値にすることで再現性を確保
  mypd = position_jitterdodge(dodge.width = 0.70, 
                              jitter.width = 0.50,
                              jitter.height = 0)
  # Y軸リミットの計算
  y_max <- max(df[[rlang::as_name(y_sym)]], na.rm = TRUE)
  
  # 3. plots
  plt <-
    df |>
    ggplot(aes(x = !!x_sym, y = !!y_sym, color = !!Gr_sym)) +
    # barplot
    stat_summary(aes(fill = !!Gr_sym),
                 fun = "mean", geom = "bar",
                 width = .6, linewidth = 0,
                 position = position_dodge(width = 0.8),
                 alpha = 0.7) +
    scale_fill_manual(values = GroupColors) + 
    # Errorbar (平均 ± SD)
    stat_summary(fun.data = "mean_sdl",
                 fun.args = list(mult = 1),
                 geom = 'errorbar',
                 aes(color = !!Gr_sym),
                 width = .3, linewidth = 1.0,
                 position = position_dodge(width = 0.8)) +
    # Dotplot
    geom_point(data = df,
               aes(x = !!x_sym, y = !!y_sym, color = !!Gr_sym), 
               size = 6 , shape = 16, position = mypd) + 
    scale_color_manual(values = GroupColors) + 
    scale_y_continuous(expand=c(0,0),
                       limits = c(0, y_max * 1.2)) + 
    # label & Theme
    labs(title = GraphTitle, x="", y = ylab) +
    theme_classic() +
    theme(
      legend.position = 'none',
      axis.title.y = element_text(hjust = 0.5, size= 16, colour = "black"),
      axis.text.x = element_text(size= 16, vjust = 0.5, colour = "black"),
      axis.text.y = element_text(size= 16, colour = "black"),
      axis.line = element_line(colour = "black", linewidth=0.5),
      axis.ticks = element_line(colour = "black", linewidth=0.5),
      axis.ticks.length = unit(1, "mm"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      text = element_text(size = 16),
      aspect.ratio = 1.5,
      plot.title = element_text(hjust = 0.5) # タイトル中央寄せ (以前の要望)
    )
    
  return(plt)
} # end function ---

```


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
