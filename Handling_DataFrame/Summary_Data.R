## Data summary


#要素の数を確認してみる
by(Exp088_5dpi, Exp088_5dpi$Measurement, summary)



#データのsummerization
## ここでは，meanとsdを求める
## varnameに求めたい変数，groupnamesにcategolyを入れる
fun.mean.sd <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func, varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

sprouting_sum <- fun.mean.sd(Exp088_5dpi,
                              varname="SproutingEvents_per_mm",
                              groupnames=c("Group", "VesselType"))




## ID, Group, Typeの３つで分けて，Total lengthを算出．するfunction
## varnameに求めたい変数，groupnamesにcategolyを入れる
fun.summary_sum <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(TotalLength = sum(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func, varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

##ID,   
Totlength <- fun.summary_sum(raw,
                             varname="Length_microm",
                             groupnames=c("ID","Group","Type"))
