## defaultのパッケージ以外を削除する方法
#> https://skume.net/entry/2022/01/17/212145

#デフォルトの29パッケージ
Pack <- c("base","boot","class","cluster","codetools",
          "compiler","datasets","foreign","graphics",
          "grDevices","grid","KernSmooth","lattice",
          "MASS","Matrix","methods","mgcv","nlme","nnet",
          "parallel","rpart","spatial","splines","stats",
          "stats4","survival","tcltk","tools","utils")

#デフォルトパッケージ以外を選択する
a <- data.frame(installed.packages())$Package
b <- a[!a %in% Pack]

#インストールしたパッケージを削除する
utils::remove.packages(pkgs=b)



#検索されるパッケージ・パス表示
search()
searchpaths()

#ロードされているパッケージ名の表示
loadedNamespaces()
