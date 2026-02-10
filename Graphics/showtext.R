# Rセッションを再起動してから実行することを推奨
install.packages("showtext")

library(showtext)
library(ggplot2) # ggplot2もロード
# library(Seurat)

# showtextを自動適用モードにする
showtext_auto()

# Arialフォントファイルを明示的に追加
# MacのArial.ttfの典型的なパスです。もし場所が異なる場合は変更してください。
# このパスが正確でないとフォントは適用されません。
# 例："/System/Library/Fonts/Arial.ttf" の場合もあります
font_add("Arial", regular = "/System/Library/Fonts/Supplemental/Arial.ttf")

font_families()# 確認


