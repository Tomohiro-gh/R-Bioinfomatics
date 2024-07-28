# 参考にしたファイル
# 210607_edgeR_sadatoFC_KEGGgene.R

# zebrafishのTopGo & KEGG analysis

#.Rprofieで読み込まれる
library(edgeR)
library(rtracklayer)　# gene id をgene symbolに変えるために使用する
library(ggplot2)
library(ggrepel)  #organize the labels nicely using the "ggrepel" package and the geom_text_repel() function
library(ggsignif)
library(dplyr)
library(plyr)
library(gdata) 
library(AnnotationDbi)
library(org.Dr.eg.db)
library(openxlsx)

library(clusterProfiler)


############# "goana"  GO, KEGG in edgeR (limma)    ####################   
### https://www.rdocumentation.org/packages/limma/versions/3.28.14/topics/goana
    
go <- goana(lrt, species="Dr")    #glmQLtestの結果でも良い
  BPup <- topGO(go, ont="BP", sort="up", n=30)
  BPdown <- topGO(go, ont="BP", sort="down", n=30)
  MFup <- topGO(go, ont="MF", sort="up", n=30)
  MFdown <- topGO(go, ont="MF", sort="down", n=30)
  top <- rbind(BPup, BPdown, MFup, MFdown)
  
  #気になったGOtermの遺伝子だのところだけをdata frameの中から取り出す
  library(org.Dr.eg.db)
    x <- org.Dr.egGO2ALLEGS
        Rkeys(x) <- "GO:0006351"  #気になるGOを入れる
    ID <- mappedLkeys(x)
    i <- lrt.df.cpm$ENTREZID %in% ID
    #指定したGOにmatchするものだけにTRUEをかえす
    interest <- lrt.df.cpm[i,]   # TRUEだけを表示
    write.xlsx(interest, "./edgeR/GO0006351_Transcription.xlsx", rowNames = FALSE)

### KEGG    
keg <- kegga(lrt, species="Dr")
   kegup <- topKEGG(keg, sort="up")
   kegdown <- topKEGG(keg, sort="down")
   kegg <- rbind(kegup, kegdown)

  #KEGGからgeneをとり出す https://support.bioconductor.org/p/89629/
  GK <- getGeneKEGGLinks(species.KEGG = "dre")
  k <- kegga(lrt, species.KEGG="dre", gene.pathway=GK)
  kup <- topKEGG(k, sort="up")
  kdown <- topKEGG(k, sort="down")
      
# 指定したKEGG pathwayのアノテーションのついた遺伝子を返してくれる．
# "path:drexxxx"を入れるとここに含まれる遺伝子を返してくれる関数
kg <- function(y){
    j <- lrt.df.cpm$ENTREZID %in% GK$GeneID[GK$PathwayID==y]
    j2 <- print(lrt.df.cpm[j,])  #画面にも表示させる
    s <- strsplit(y, ":",)[[1]][2] # drexxxxだけを文字列として抽出
    nam <- paste("./edgeR/", s, ".xlsx", sep="")
    write.xlsx(j2, nam, sheetName = s, append=TRUE)
  }
    kg("path:dre04110")


#topGOとKEGGをリストにしてexcelで保存．     
  l <- list("topGO"=top, "kegg"=kegg)      
  write.xlsx(l, "./edgeR/210616topGOKEGG.xlsx", rowNames = TRUE)    

  
  
  
############# "TopGo" #################################   
# https://bi.biopapyrus.jp/pathway/go/topgo.html
# GeneIDとFDA (adj-P)やlogFCを用意

# rownameにgene idをもつFDRを準備する

data <- read.xlsx("/Users/tomohiro/Dropbox/FukuharaLab_Res/Experiment/Exp130_WH_scRNAseq_Analysis/CountCondition2(partialdata)/SeuratAnalysis/ExportFiles_Integration/220308_Analyzed_woRBCs/DEgenes_InterEpi_woRBC.61.15.xlsx", sheet=2)

# FDRの列は "p_val_adj"(６列め)
adjp <- data[, 6] # vector型になる　is.vector(adjp)はTRUEが返ってくる．
names(adjp) <- data[,1] 
adjp <- adjp[adjp<0.01]
  
# DEG 判定関数（FDR < 0.01 ならば DEG とする）
  f <- function(q) {
    return (q < 0.01)
  }
  
# preparation
topgo <- new("topGOdata",
              ontology = "CC",           # オントロジー
              allGenes = adjp,            # FDR 値
              geneSel = f,               # DEG 判定関数
              annot = annFUN.org,        # アノテーション
              mapping = "org.Dr.eg.db",  # アノテーションデータ
              ID = "Ensembl")            # Ensembl ID を利用しているのでこれを指定
# GO term 検定
result <- runTest(topgo, algorithm = "classic", statistic = "fisher")

# GO term 検定結果を表に出力する（検定結果のトップ 20）
result.table <- GenTable(topgo, FisherTest = result, topNodes = 20)
result.table



pathways.list <- keggList("pathway", "dre") #dre = zebrafish
head(pathways.list)


pathway.codes <- sub("path:", "", names(pathways.list)) 
genes.by.pathway <- sapply(pathway.codes,
                           function(pwid){
                             pw <- keggGet(pwid)
                             if (is.null(pw[[1]]$GENE)) return(NA)
                             pw2 <- pw[[1]]$GENE[c(TRUE,FALSE)] # may need to modify this to c(FALSE, TRUE) for other organisms
                             pw2 <- unlist(lapply(strsplit(pw2, split = ";", fixed = T), function(x)x[1]))
                             return(pw2)
                           }
)
head(genes.by.pathway)





  GOFisherTest(object)
  GOKSTest(object)
  GOtTest(object)
  GOglobalTest(object)
  GOSumTest(object)
  GOKSTiesTest(object)