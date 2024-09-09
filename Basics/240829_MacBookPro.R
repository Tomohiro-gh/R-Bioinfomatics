
install.packages('Seurat')
remotes::install_github("satijalab/seurat-data", "seurat5", quiet = TRUE)
remotes::install_github("satijalab/azimuth", "seurat5", quiet = TRUE)
remotes::install_github("satijalab/seurat-wrappers", "seurat5", quiet = TRUE)
remotes::install_github("satijalab/signac", "seurat5", quiet = TRUE)

remotes::install_github("stuart-lab/seurat-data", "seurat5", quiet = TRUE)

if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("mojaveazure/seurat-disk")


if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("edgeR")
BiocManager::install("DESeq2")


install.packages("SeuratObject")

install.packages("openxlsx", dependencies = TRUE)
BiocManager::install("tximport", force=TRUE)
BiocManager::install("topGO", force = TRUE)
BiocManager::install("pathview", force=TRUE)
BiocManager::install("DEGreport",force=TRUE) # DESeq2で使用
BiocManager::install("corrgram") # DESeq2で使用
BiocManager::install("pcaExplorer")
BiocManager::install("vsn", force=TRUE)



### R以外の操作
## 

############ scRNAseq    ############ 
#Seurat
install.packages("Seurat", dependencies = TRUE)
install.packages("SeuratObject")
remotes::install_github('satijalab/seurat-wrappers')
devtools::install_github('satijalab/seurat-data', force=TRUE) # libraryはSeuratData


#scRNASeq ligand-receptor interactions
devtools::install_github(repo = "https://github.com/SCA-IRCM/SingleCellSignalR_v1", subdir = "SingleCellSignalR")
devtools::install_github("sqjin/CellChat")
devtools::install_github('msraredon/Connectome', ref = 'master')


# NicheNets: https://github.com/saeyslab/nichenetr
if(!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools") 
}
devtools::install_github("saeyslab/nichenetr")

# Velocity analysis
devtools::install_github("velocyto-team/velocyto.R")
## Trajectory analysis
# monole3
BiocManager::install(c('BiocGenerics',
                       'DelayedArray',
                       'DelayedMatrixStats',
                       'limma',
                       'lme4',
                       'S4Vectors',
                       'SingleCellExperiment',
                       'SummarizedExperiment',
                       'batchelor',
                       'HDF5Array',
                       'terra',
                       'ggrastr'),force = TRUE)
install.packages("devtools")
devtools::install_github('cole-trapnell-lab/monocle3')

#liana
remotes::install_github('saezlab/liana')

# https://github.com/jinworks/CellChat
devtools::install_github("jinworks/CellChat")

# SCENIC
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")
devtools::install_github("aertslab/SCENIC") 


## SCENIC:https://htmlpreview.github.io/?https://github.com/aertslab/SCENIC/blob/master/inst/doc/SCENIC_Setup.html
## Required
  BiocManager::install(c("AUCell", "RcisTarget"))
  BiocManager::install(c("GENIE3"))
  ## Optional (but highly recommended):
  # To score the network on cells (i.e. run AUCell):
  BiocManager::install(c("zoo", "mixtools", "rbokeh"), force = TRUE)
  # For various visualizations and perform t-SNEs:
  BiocManager::install(c("DT", "NMF", "ComplexHeatmap", "R2HTML", "Rtsne"),force = TRUE)
  # To support paralell execution (not available in Windows):
  BiocManager::install(c("doMC", "doRNG"))
  # To export/visualize in http://scope.aertslab.org
    if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")
    devtools::install_github("aertslab/SCopeLoomR", build_vignettes = TRUE)


# scpa: https://jackbibby1.github.io/SCPA/
devtools::install_version("crossmatch", version = "1.3.1", repos = "http://cran.us.r-project.org")
install.packages('nbpMatching')
devtools::install_version("multicross", version = "2.1.0", repos = "http://cran.us.r-project.org")
devtools::install_github("jackbibby1/SCPA", force = TRUE)
BiocManager::install("GSVA")
BiocManager::install("singscore")



# calculation
install.packages("devtools")
install.packages("openxlsx", dependencies = TRUE)
install.packages("dplyr")
install.packages(c("Matrix", "gdata", "reshape", "reshape2"))
devtools::install_github("rstats-db/RSQLite") # 
install.packages("RSQLite", force=TRUE)
install.packages("magrittr")



### RNAseq
BiocManager::install("edgeR")
BiocManager::install("DESeq2")
BiocManager::install("tximport", force=TRUE)
BiocManager::install("topGO", force = TRUE)
BiocManager::install("pathview", force=TRUE)
BiocManager::install("DEGreport",force=TRUE) # DESeq2で使用
BiocManager::install("corrgram") # DESeq2で使用
BiocManager::install("pcaExplorer")
BiocManager::install("vsn", force=TRUE)
BiocManager::install("clusterProfiler")



# gene id をgene symbolの変換等に
BiocManager::install("rtracklayer")
BiocManager::install("AnnotationDbi", force = TRUE)
BiocManager::install("org.Dr.eg.db")
BiocManager::install("org.Mm.eg.db", force = TRUE)
BiocManager::install("org.Hs.eg.db", force = TRUE)
BiocManager::install("biomaRt", force = TRUE)


## Graphics
install.packages("tidyverse")
install.packages("ggplot2") 
install.packages("ggrepel") #organize the labels nicely using the "ggrepel" package and the geom_text_repel() function
install.packages("ggsignif") 
install.packages("pheatmap")
install.packages("ggVennDiagram")
install.packages("shiny")
BiocManager::install("dittoSeq")
install.packages("RColorBrewer")
install.packages("viridis")
install.packages("ggsci")
install.packages("viridis")
if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("ComplexHeatmap")

install.packages("RColorBrewer")
BiocManager::install("RColorBrewer", force=TRUE)
install.packages("plotly")
install.packages("rgl")  #3D PCA plotの時に必要
install.packages("gplots") #heatmaps()で必要
install.packages("remotes")
remotes::install_github("clauswilke/ungeviz")#hplineを使うのに必要
devtools::install_github('dgkf/ggpackets', build_vignettes = TRUE)
install.packages("wesanderson")
install.packages("scales")






## statistics



## loom, hdf5のインストール
## 下記をやる前に，hdf5をインストールする必要あり

## terminalから -> brew install hdf5

## https://satijalab.org/loomr/loomr_tutorial
# Install devtools from CRAN
install.packages("devtools")
# Use devtools to install hdf5r and loomR from GitHub
devtools::install_github(repo = "hhoeflin/hdf5r")
devtools::install_github(repo = "mojaveazure/loomR", ref = "develop")





