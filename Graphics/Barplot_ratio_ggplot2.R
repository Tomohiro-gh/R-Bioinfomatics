library(openxlsx)
library(ggplot2)
library(ggsci)
library(scales)

# 積み上げ棒グラフ


s



# 積み上げの順番を決める
# https://qiita.com/novenove/items/7d7b4d0a564da32e4979
# 積み上げ順を指定するには、データフレームのcategoryを因子型(Factor)とした上で、順序をlevelsで指定します。ここではcategory2という列を追加して設定してみます。

dt$category2 <- factor(dt$category, levels = c('エンターテイメント','音楽','歌ってみた','演奏してみた','踊ってみた','VOCALOID','ニコニコインディーズ','動物','料理','自然','旅行','スポーツ','ニコニコ動画講座','車載動画','歴史','政治','科学','ニコニコ技術部','ニコニコ手芸部','作ってみた','アニメ','ゲーム','実況プレイ動画','東方','アイドルマスター','ラジオ','描いてみた','例のアレ','日記','その他'))


# 凡例タイトルを自由に設定
+scale_fill_discrete(name="Category")

