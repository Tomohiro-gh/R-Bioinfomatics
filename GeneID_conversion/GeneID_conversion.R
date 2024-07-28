library(AnnotationDbi)
library(org.Dr.eg.db)
library(rtracklayer)　# gene id をgene symbolに変えるために使用する
library(SummarizedExperiment)
library(openxlsx)


# rownamesにgeen symbol, Ensembl, Entrezidのどれかを持っていれば，それを元に，残りのidを付与する関数
# 条件 : rownamesがemsebl, symbol, entrezidのいずれかであること
id.addition.zf <- function(res.df, rownameType){
  # rowNameのタイプにより，残りのtypeを同定し，dfへ追加していく
  keytpyes = c("ENSEMBL", "SYMBOL", "ENTREZID")
    convType <- keytpyes[!(keytpyes %in% rownameType)]
    T1 <- convType[1]
    T2 <- convType[2]
   
  # 変換のdfを作っていく
  id <- mapIds(org.Dr.eg.db, keys=rownames(res.df),
                keytype=rownameType, column=T1)
  id2 <- mapIds(org.Dr.eg.db, keys=rownames(res.df),
                keytype=rownameType, column=T2)
    
  genes.df <- data.frame(id, id2)
     genes.df$rownameType <- row.names(genes.df)
    colnames(genes.df) <- c(T1, T2, rownameType) # colnameに名前をつける

# input dataとrownamesでくっつける :  merge関数
res.df　<-　merge(genes.df, res.df, by="row.names", all=T)
  #row.nameが1列目が生成されるため除く
  res.df <- res.df[ ,-1]
    
  
return(res.df)
}

# ex) 
DEG2d <- id.addition.zf(DEG2d, "ENSEMBL")



## manualで変換
id <- mapIds(org.Dr.eg.db, keys=rownames(res.df),
             keytype="ENSEMBL", column="SYMBOL")


## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
## Example2: matrixの行名を変換するだけ
## source code
## 231129_Step1_DataPreparation.R

FUN.ID.Conversion.Human <- function(Matrix, TypeOfRawname, ConversionID){
  require(org.Hs.eg.db)
  # rowNameのタイプにより，残りのtypeを同定し，dfへ追加していく
  keytpyes = c("ENSEMBL", "SYMBOL", "ENTREZID")
  OtherType <- keytpyes[!(keytpyes %in% c(TypeOfRawname, ConversionID))]
  
  # 変換のdfを作っていく
  id1 <- mapIds(org.Hs.eg.db, 
                keys=rownames(Matrix),
                keytype=TypeOfRawname,
                column=ConversionID)
  
  id2 <- mapIds(org.Hs.eg.db, 
                keys=rownames(Matrix),
                keytype=TypeOfRawname,
                column=OtherType)
  
  genes.df <- data.frame(id1, id2)
  genes.df$TypeOfRawname <- row.names(genes.df)
  # colnameに名前をつける
  colnames(genes.df) <- c(ConversionID, OtherType, TypeOfRawname) 
  
  # matrixを一度データフレームにする 
  df_temp <- as.data.frame(Matrix)
  
  #rownamesでgenes.dfとdf_tempをくっつける :  merge関数
  df_temp_id <- merge(genes.df, df_temp, by="row.names", all=T)
  #これだと目的のrownameは２列目に来るはず
  rownames(Matrix) <- df_temp_id[,2]
  
  return(Matrix)
}