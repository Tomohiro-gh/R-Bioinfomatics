## Required ##
library(tidyverse)
library(dplyr)
library(SingleCellSingnalR)


wd = "/Users/tomohiro/Dropbox/FukuharaLab_Res/Experiment/Exp130_WH_scRNAseq_Analysis/SeuratAnalysis_v5/4-1_SingleCellSignalR_practice"
setwd(wd)

one2one <- read.xlsx("/Users/tomohiro/Dropbox/FukuharaLab_Res/Database/ensembl_biomart/BiomaRt_ensembl_zf_hsa_ortholog_list_one2one(9766).xlsx")
## gene nameをhumanへ変換
colnames(one2one) <- c("zf_emsebl","zf_symbol", "human_ensembl","human_symbol")

one2one <- one2one[,c(2,4)]
rownames(one2one) <- one2one$zf_symbol
dim(one2one) # 9766    2


## input dataについて，一致するものだけにする


## Seuratからcountを取り出し，data frameへ変換する
mtx <- msen20.050[["RNA"]]@counts #dgCMatrix 
class(mtx)
mtx.df <- as.data.frame(as.matrix(mtx))
  #　確認
  dim(mtx)　　# 23158  1789
  
  

## one 2 one に乗っている遺伝子のみにしぼる
mtx.df <- mtx.df %>% 
          filter(rownames(mtx.df) %in% one2one$zf_symbol)
  # 確認
  dim(mtx.df) # 9417  1789

## one2oneの方も 9417にする
one2one <- one2one %>%
  filter(rownames(one2one) %in% rownames(mtx.df))
  #確認
  dim(one2one) # 9417    2 -> OK

# one2one とmerge -> rownamesにhumanを入れる
mtx.df.human <- merge(one2one, mtx.df,  by="row.names", all=T)
  # 確認
  mtx.df.human[1:5,1:5] #1列目にRow.namesが入っている


row.names(mtx.df.human) <- mtx.df.human$human_symbol # row.nameにhumanを入れる
mtx.df.human <- mtx.df.human[, -c(1:3)] # 1 - 3列目を除く
  # 確認
  mtx.df.human[1:5,1:5] #1列目にRow.namesが入っている -> OK

write.csv(x=mtx.df.human, file="msenchyme_humangene.txt")

  
######### SingleCellSignalR ###############
# The file containing the read counts should be placed in the working directory.
file <- "msenchyme_humangene.txt"
data <- data_prepare(file = file) #発現していないgeneは除かれる


clust <- clustering(data = data, 
                    n.cluster = 9, 
                    n = 10, 
                    method = "simlr",
                    write = FALSE,
                    pdf=FALSE)

# cluster analsysis function:
# differentially expressed genes in one cluster compared to the others are identified
clust.ana <- cluster_analysis(data = data,
                              genes = rownames(data),
                              cluster = clust$cluster,
                              write = FALSE)



# The SIMLR_Estimate_Number_of_Clusters() function determined the number of clusters, between 2 and n (n=10 above).
signal <- cell_signaling(data = data,
                         genes = rownames(data),
                         cluster = clust$cluster,
                         write = FALSE)


# An intercellular network can also be generated to map the overall ligand/receptor interactions
inter.net <- inter_network(data = data,
                           signal = signal,
                           genes = genes,
                           cluster = clust$cluster,
                           write = FALSE)


visualize_interactions(signal = signal)
visualize_interactions(signal = signal,write.in=c(1:9))




