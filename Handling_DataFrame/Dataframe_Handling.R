# data frame handling


#dataframe(df オブジェクト)中の要素の数を取得する (重複要素を1つとする)
#length(table()) を使用する
length(table(ZftoHsa.raw$zf_symbol))


# data frameの1一部の行名，列名を変更する :https://indenkun.hatenablog.com/entry/2020/06/20/202500
# colnames()の外（後ろ）に列番号を指定する
colnames(df)[2] <- "ID"


#### 重複行を見つける，削除する
#重複してる遺伝子の行を除く# group_byの後，filter関数で要素が1つのものだけを取り出す
TopAll_unique = TopAll %>%
  group_by(cluster) %>% 
  filter(n() == 1)

## 重複行の最初の行以外を除く dplyr::distinct
DEGs　<- DEGs %>% distinct(ENTREZID, .keep_all = TRUE) 
  # .keep_all = TRUE でdf全体を返す




#### 列の入れ替え
iris2 <- iris[,c(2,1,3,4,5)]
iris2[1,]

#Sepal.Width Sepal.Length Petal.Length Petal.Width Species
#1         3.5          5.1          1.4         0.2  setosa



### ベクトルの総当たり表を作る: expand.grid 関数
# http://goldenstate.cocolog-nifty.com/blog/2019/08/post-1142e9.html
  D <- c("aa","ab","cc")
  E <- c("r","o","t","m")
expand.grid(D,E) 


## matrix 　から 変換するには？？？
  #確認
  class(mtx)　# dgCmatrix
## data frameへの変換：https://discuss.analyticsvidhya.com/t/how-to-convert-a-cscmatrix-or-dgcmatrix-into-dataframe/7792
mtx.df <- as.data.frame(as.matrix(mtx))



### Data frame handling
## 共通のみ結合できる: inner_join() "「2つのデータ両方に含まれる値だけ残して結合する」"
### Usage: https://manamina.valuesccg.com/articles/898
inner_joined_data <- inner_join(kenko_ec_data, user_master, by = "userid")



## Listからdata framへの変換
### https://stackoverflow.com/questions/23217792/convert-a-list-from-tapply-to-data-frame-in-r
do.call(rbind, t) #tはリスト



## 230315
## Barcode の抽出
#RBCとつけられた名前だけを取り出す
RBC_name <- rownames(RBCell[[]])
## Objectから barcode由来のものを除く
wh.woRBC <- wh[,!colnames(wh) %in% RBC_name]




## 230315
## DataFrameの特定の値や文字のみ変更する場合 (example script: 230315_MCannotation.R)
## SMC barcodのところを PericytesからSMCへ変更する
# Example 
#                         Author_Annotation Modified_MCannotation
# AAACCTGAGTTAAGTG-1           T cells               T cells
# AAACCTGTCCATTCTA-1           T cells               T cells
# AACACGTGTTCCACAA-1           T cells               T cells

AnnotationData = AnnotationData %>%
  mutate(
    Modified_MCannotation = 
      case_when(rownames(AnnotationData) %in% Barcode_SMC ~ 'SMC',
                TRUE ~ Author_Annotation))
# Modified_MCannotationの中のpericyteの一部をrownamesを参照してSMC変更したい．
# 他の名前はそのまま -> TRUEを使うことでこれが可能

