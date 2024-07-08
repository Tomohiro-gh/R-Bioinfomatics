library(VennDiagram)

## 参考　https://data-science.gr.jp/implementation/ida_r_venn_diagram.html
## listで渡さないとダメなので， 比べたいものをリストにして作成
EClist = list(Rough=rownames(EC1type), Fine=rownames(EC54types))

## Venn図 2 groups
venn.diagram(
  venn_list,
  category.names = c("12w", "72w"),
  fill = c(4,7),VennDiagram
  cex=c(2,2,2),
  cat.cex=c(2,2),
  cat.pos=c(330,30),
  cat.dist=c(0.07,0.07),
  margin = 0.07,
  scaled=T,
  inverted =F, 
  height=3000,
  width=3000,
  resolution=500,
  filename="VD_commonInteractions_12w_vs72w.png",
  imagetype="png"
)


## Venn図 3 groups


##  lwd	枠線の太さの指定	lwd=c(1,2)
##  lty	枠線のスタイルの指定	lty=c(2,2)
##  col	枠線の色の指定	col=c(3,5)
##  fill	領域の色の指定	fill=c(2,7)
##  alpha	領域の透明度の指定	alpha=c(0.2,0.5)
##  label.col	各領域のラベル (上の69, 17, 53) の色の指定	label.col=c(1,2,3)
##  cex	各領域のラベルフォントサイズの指定	cex=c(1,2,3)
##  fontface	各領域のラベルのフォントデザインの指定	fontface=c(1,2,3)
##  fontfamily	各領域のラベルのフォントの指定	fontfamily=c(1,2,3)
##  cat.dist	カテゴリー名 (上のFOOおよびBAR) の枠線からの距離の指定	cat.dist=c(0.05,0.05)
##  cat.pos	カテゴリー名の位置の指定 (0から360度)	cat.pos=c(30,330)
##  cat.cex	カテゴリー名のフォントサイズの指定	cat.cex=c(1,2)
##  cat.col	カテゴリー名の表示色の指定	cat.col=c(2,1)
##  cat.fontface	カテゴリー名のフォントデザインの指定	cat.fontface=c(3,4)
##  cat.fontfamily	カテゴリー名のフォントの指定	cat.fontfamily=c(5,6)
##  margin	作成されるベン図画像の余白の指定	margin=0.3
##  scaled	データのサイズを領域の面積に反映する (T) かしないか (F)	scaled=F
##  inverted	2データセットからなるベン図の各領域の位置を逆にする (T)	inverted=T
##  height	作成されるベン図画像の高さの指定	height=3000
##  width	作成されるベン図画像の幅の指定	width=3000
##  resolution	作成されるベン図画像の解像度の指定	resolution=500
