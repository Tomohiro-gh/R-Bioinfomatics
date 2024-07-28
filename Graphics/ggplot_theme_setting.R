d## ggplot option
## https://knknkn.hatenablog.com/entry/2019/02/23/181311

## https://knknkn.hatenablog.com/entry/2019/05/01/142834
library(ggplot2) 
library(ggthemes)


# テキスト項目の設定
ggtitle("Plot title here") + 
theme(axis.title.x = element_text(colour="red", size=14),
      axis.text.x = element_text(colour="blue"), 
      axis.title.y = element_text(colour="red", size=14, angle = 90), 
      axis.text.y = element_text(colour="blue"), 
      plot.title = element_text(colour="red", size=20, face="bold")) 

## Legend
theme(legend.background = element_rect(fill="grey85", colour="red", size=1), 
      legend.title = element_text(colour="blue", face="bold", size=14), 
      legend.text = element_text(colour="red"),
      legend.key = element_rect(colour="blue", size=0.25),
      axis.title.y = element_text(size= 16, face="bold"),
      axis.text.x = element_text(size= 14), # 軸の目盛り文字の大きさ
      axis.text.y = element_text(size= 14),
      axis.line=element_line(colour = "black"), # 軸の色
      axis.ticks=element_line(colour = "black"), # ティックマークの色
      panel.grid.major = element_blank(), # 主グリッドラインを描かない
      panel.grid.minor = element_blank(), # 副グリッドラインを描かない
      panel.background = element_blank()) # バックグラウンドを白にする
labs(title = "", x = "", y= "Frequency")  +
  

# axis.title	両軸ラベルの体裁
# axis.title.x	x軸ラベルの体裁
# axis.title.y	y軸ラベルの体裁
# axis.ticks	両軸目盛ラベルの体裁
# axis.ticks.x	x軸目盛ラベルの体裁
# axis.ticks.y	y軸目盛ラベルの体裁
# legend.title	凡例項目の体裁
# plot.title	タイトルの体裁
# strip.text	両方向ファセットラベルの体裁
# strip.text.x	水平方向ファセットラベルの体裁
# strip.text.y	垂直方向ファセットラベルの体裁


myTheme_230208 <-
  theme(
    plot.title = element_text(hjust=0.5, size=14, face="bold"),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    axis.title.x = element_text(hjust=0.5, size= 16, face="bold"),
    axis.title.y = element_text(hjust=0.5, size= 16, face="bold"),
    axis.text.x = element_text(hjust=0.5, colour = "black", size= 14, face="bold"),
    axis.text.y = element_text(hjust=0.5, colour = "black", size= 14, face="bold"),
    axis.line=element_line(colour = "black"),
    axis.ticks=element_line(colour = "black"),
    text = element_text(size = 12))#,
#legend.position="none")

  




## 自作theme
# theme_bw()を基にしていくつか変更する 
mytheme <- theme_bw() + 
  theme(text = element_text(colour="red"), axis.title = element_text(size = rel(1.25)))

# 基本プロット 
p <- ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point()

# 変更したテーマを使ってプロットする
p + mytheme