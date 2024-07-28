
# Reactome PA 
# https://bioconductor.riken.jp/packages/3.3/bioc/vignettes/ReactomePA/inst/doc/ReactomePA.html


library(ReactomePA)
library(enrichplot)
library(openxlsx)
library(AnnotationDbi)
library(org.Dr.eg.db)
library(ggnewscale) #cneplotで使用する

data <- read.xlsx("/Users/tomohiro/Dropbox/BioInfomatics/R_CommandList/sampledata/DEgenes_Mesenchyme_scRNAseq.xlsx")
head(data,10)


#GENE SYMBOLやEnsembl ID をENTREZ IDへ変換し，結合する
row.names(data) <- data[,1] # row.nameに1列目のsymbolを入れておく

id <- mapIds(org.Dr.eg.db, keys=rownames(data),
             keytype="SYMBOL", column="ENTREZID")

# GENE SYMBOLをキーにして，dataframeへENTREZIDを追加する
data <- data.frame(data, ENTREZID=id) 

# ENTREZIDがNAのものを取り除く
data <- data[!is.na(data$ENTREZID), ]
# ENTREZIDをrownameに切り変える
row.names(data) <- data[,7]

# adjp <0.01のリストを作成
allgenes <- data[, 6] # vector型になる　is.vector(adjp)はTRUEが返ってくる．
names(allgenes) <- data$ENTREZID # vectorへ名前を入れる : names関数
adjp <- allgenes[allgenes<0.01] # adjusted pvalue (FDR) <0.01 だけ残す

logfc <- data$avg_log2FC
names(logfc) <- row.names(data)




#Reactomeパスウェイ解析を実行
RA_res <- enrichPathway(gene = names(adjp), # ajusted pval <0.01のだけを抽出
                        organism = "zebrafish",  
                        pvalueCutoff = 0.05,
                        pAdjustMethod = "BH",
                        readable = TRUE)
#結果の表示
head(as.data.frame(RA_res))


# visualization
barplot(RA_res, 
        showCategory=20,
        x = "GeneRatio") #xは "Count" か "GeneRatio"

dotplot(RA_res, 
        showCategory=15,
        x = "GeneRatio")

RA_res <- pairwise_termsim(RA_res) 
emapplot(RA_res)

#cnetプロット
cnetplot(RA_res,
         categorySize="pvalue",
         foldChange=logfc,
         showCategory = 8)








################### Install #####################
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("ReactomePA", force=TRUE)
BiocManager::install("enrichplot", force=TRUE)
#ggnewscale
install.packages("ggnewscale")




# もし入らなければ，http://yiqingxu.org/public/BigSurError.pdf 参照
# makevarsへ下記を加え，restartする
    ~/.R/Makevars
    CC = gcc
    CXX = g++
    CXX98 = g++
    CXX11 = g++
    CXX14 = g++
    CXX17 = g++
    CXX20 = g++
    CXXCPP = g++
    FC = gfortran
    F77 = gfortran
    OBJC = gcc
    OBJCXX = g++