# Install list for new updata

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.16")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.15") # for R version4.2.0

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.14") # for R version4.1.3

## 10/30/23
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.18") # for R version4.3.1 

### R以外の操作
## 

############ scRNAseq    ############ 
#Seurat
install.packages("Seurat", dependencies = TRUE)
install.packages("SeuratObject")
remotes::install_github('satijalab/seurat-wrappers')
devtools::install_github('satijalab/seurat-data', force=TRUE) # libraryはSeuratData
install.packages("sctransform")
BiocManager::install("glmGamPoi", force=TRUE)
install.packages("quantreg", type = "source")


#scRNASeq ligand-receptor interactions
devtools::install_github(repo = "https://github.com/SCA-IRCM/SingleCellSignalR_v1", subdir = "SingleCellSignalR")
devtools::install_github("sqjin/CellChat")
devtools::install_github('msraredon/Connectome', ref = 'master')

devtools::install_github("Coolgenome/iTALK", build_vignettes = TRUE, force = TRUE)

# NicheNets: https://github.com/saeyslab/nichenetr
install.packages("devtools")
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


HDF5Array



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



