## To install

devtools::install_github("wch/webshot")


library(heatmaply)

## 05/22/23 
##PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
##Warning messages:
##  1: 'plotly::orca' is deprecated.
##Use 'kaleido' instead.
##See help("Deprecated") 
##2: In value[[3L]](cond) : plotly::orca failed:
##  Error: The orca command-line utility is required for this functionality.

##Please follow the installation instructions here -- https://github.com/plotly/orca#installation

##3: 'plotly::export' is deprecated.
##Use 'orca' instead.
##See help("Deprecated") 

## どうやらこれを解決しないといけないらしい
##https://github.com/plotly/orca#installation
## Method 4  mac os の方法にしたがってinstall
## 開く
## ダメなので，環境設定のプライバシーとセキュリティで許可を押す
## パスワード入力して開いたら完了．


## これでも動かないので，

## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
## Warning messages:
##   1: 'plotly::orca' is deprecated.
## Use 'kaleido' instead.
## See help("Deprecated") 
## 2: In value[[3L]](cond) : plotly::orca failed:
##   Error in "processx::run(\"orca\", args, echo = TRUE, spinner = TRUE, ...)": ! System command 'orca' failed

## 3: 'plotly::export' is deprecated.
## Use 'orca' instead.
## See help("Deprecated") 



# https://kazumaxneo.hatenablog.com/entry/2020/02/29/073000
heatmaply(mtcars)


