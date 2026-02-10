## ggシリーズまとめ

## ggsignif
```r
install.packages("ggsignif") 
```
## ggrepel

## ggsci

```r
install.packages("ggsci")
```

## 

### ggeasy
ref)
- https://jonocarroll.github.io/ggeasy/
- https://hoxo-m.hatenablog.com/entry/2022/05/06/080000
#### how to use 
```r
install.packages("ggeasy")
library(ggeasy)
```
ggplotの後に +で追加していけばいい
- x軸のラベルを90度回転させる：　`easy_rotate_x_labels()`
- xy軸の線を消す：　`easy_remove_x_axes()`
- legendを消す：　`easy_remove_legend`
- テキストのサイズを変更：　`easy_all_text_size(size = 20)`
- x軸のタイトルサイズを変更： `easy_x_axis_title_size(20)`
- x軸のラベルサイズを変更： `easy_x_axis_labels_size(size = 20)`
- テキストの色を変更：　`easy_all_text_color(color = NULL, teach = FALSE)`

easy_text_color(which = .all_theme_els, color = NULL, teach = FALSE)

-`easy_text_colour(which = .all_theme_els, colour = NULL, teach = FALSE)`
-`easy_plot_title_size(size = NULL, teach = FALSE)`
-`easy_plot_subtitle_size(size = NULL, teach = FALSE)`
-`easy_plot_caption_size(size = NULL, teach = FALSE)`
-`easy_plot_legend_size(size = NULL, teach = FALSE)`
-`easy_plot_legend_title_size(size = NULL, teach = FALSE)`
