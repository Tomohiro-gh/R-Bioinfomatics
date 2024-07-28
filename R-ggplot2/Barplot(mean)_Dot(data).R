#棒グラフとエラーバーをつける

#ライブラリの読み込み
library(ggplot2)
library(ggsignif)
library(dplyr)
library(plyr)
library(gdata)  #excel ファイルを読むためのファイル


#データの読み込み，gdataを用いてexcelのシートを読み込む
#シートの名前でなく，シートの何番目かを指定

setwd("/Users/tomohiro/Dropbox/FukuharaLab_Res/Experiment/Exp122_ECproliferation(EdU)_PCablation/122-13-20_2dpi_analysis/Analysis_v1_220520")
d <- read.xlsx("Exp122_13-20_EdUECs.xlsx", sheet=1, colNames=TRUE)

d$Normalized_number <- d$Num_EdU_ECs/d$vascular_length_all_um*1000

###   Function for summarize
data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}
##Execution
d_sum <- data_summary(d, varname="Normalized_number", groupnames="Group")



