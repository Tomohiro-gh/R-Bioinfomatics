library(ggplot2) 
library(openxlsx)
library(ggthemes)
library(psych)
library(dplyr)



## 測定データを２つの変数でまとめて平均値とSDを折れ線でplotする
## related: Exp146
## reference code: 221013_RBCvelocity_TotalTimePoint.R



## 
## 横軸DAY，縦軸Velocityのグラフ
###
# 使用するcolumn: Vessel, RBC, Day, Velocity


## 10/14/22 Day vs Velocity
BarPlot_DayvsVelocity <- function(ImportData, FileName){
  
  # Naming
  TitleName <- paste0("RBC velocity: ", FileName)
  ImageName <- paste0(FileName, "_RBCvelocity.png")
  SeetName <- paste0(FileName, "_RBCvelocity_statics.xlsx")
  
  #Data Summerize 
  ## %>%　パイプ演算子を使って解決
  ## Vessel typeとDayの２つでグループ分け，
  ## summerizeの n()は各グループの要素の数を算出
  VelocitySummaried <- ImportData %>% 
    group_by(Vessel, Day) %>% 
    summarise(n = n(),
              Mean = mean(Velocity),
              SD = sd(Velocity))
  
  write.xlsx(VelocitySummaried, file=SeetName, rowNames=FALSE)
  
  VelocityMax <- max(VelocitySummaried$Mean)*1.2
  
  # Graph
  p <- ggplot(VelocitySummaried,
              aes(x = Day, y = Mean, group=Vessel, color=Vessel)) + 
    geom_line(size=1) +
    geom_point(size=2)+
    geom_errorbar(aes(x=Day, ymin=Mean-SD, ymax=Mean+SD), width=.2) +
    scale_color_brewer(palette= "Paired") +
    scale_y_continuous(expand=c(0,0),
                       breaks=seq(0,1100,100),
                       minor_breaks=seq(0,1000,50),
                       limits=c(0,VelocityMax)) +
    labs(title = TitleName, x = "Day", y= "Velocity (µm/sec)")  +
    theme_classic() +
    theme(plot.title = element_text(hjust=0.5, size=20), # タイトルの文字サイズと位置
          plot.subtitle = element_text(size = 14, hjust = 0.5), # サブタイトルの文字サイズと位置
          axis.title.x = element_text(hjust=0.5, size= 16, face="bold"), 
          # 軸の名前の大きさ
          axis.title.y = element_text(hjust=0.5, size= 16, face="bold"),
          axis.text.x = element_text(colour = "black", size= 14, face="bold"), # 軸の目盛り文字の大きさ
          axis.text.y = element_text(colour = "black", size= 14, face="bold"),
          axis.line=element_line(colour = "black"), # 軸の色
          axis.ticks=element_line(colour = "black"), 
          text = element_text(size = 12))
  # , legend.position="none")
  
  plot(p)
  
  ggsave(filename = ImageName,
         plot = p, 
         device = "png", 
         scale = 1, 
         width = 15, height = 12, 
         units = c("cm"),
         dpi = 600)
}



## 10/14/22 Example
F146_1 <- read.xlsx("/Users/tomohiro/Dropbox/FukuharaLab_Res/Experiment/Exp146_RBCvelocity_PCloss/146-1_RBC/Exp146-1_LieScan_measurement.xlsx", sheet=1, startRow=1)
BarPlot_DayvsVelocity(F146_1, "F146-1")
