#> R4.3.2
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.18")

BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))


if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
install.packages("devtools")
install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))

install.packages("usethis")
install.packages("reticulate")
install.packages("gitcreds")


## Graphics gg系 ------------------------------------------------------
install.packages("tidyverse")
install.packages("ggplot2") 
install.packages("ggrepel") #organize the labels nicely using the "ggrepel" package and the geom_text_repel() function
install.packages("ggsignif") 
install.packages("ggVennDiagram")
install.packages("ggvenn")

install.packages("pheatmap")
install.packages("shiny")
BiocManager::install("dittoSeq")
install.packages("RColorBrewer")
install.packages("viridis")
install.packages("ggsci")
BiocManager::install("ComplexHeatmap")
BiocManager::install("RColorBrewer", force=TRUE)
install.packages("plotly")
install.packages("rgl")  #3D PCA plotの時に必要
install.packages("gplots") #heatmaps()で必要
remotes::install_github("clauswilke/ungeviz")#hplineを使うのに必要
devtools::install_github('dgkf/ggpackets', build_vignettes = TRUE)
install.packages("wesanderson")
install.packages("scales")
install.packages('ComplexUpset') #https://krassowski.github.io/complex-upset/index.html
#igraph
# options(
#   repos = c(
#     igraph = 'https://igraph.r-universe.dev',
#     CRAN = 'https://cloud.r-project.org'
#   )
# )
install.packages('igraph')
#logger
pak::pak("daroczig/logger") #or install.packages("logger")
systemfonts
textshaping


## --------------  calculation
install.packages("dplyr")
install.packages(c("Matrix", "gdata", "reshape", "reshape2"))
install.packages("RSQLite", force=TRUE)
install.packages("magrittr")




############ scRNAseq    ############ ------------------
#Seurat
install.packages("Seurat", dependencies = TRUE)
install.packages("SeuratObject")
remotes::install_github("satijalab/seurat-data", "seurat5")

remotes::install_github("mojaveazure/seurat-disk")
  remotes::install_github("satijalab/azimuth", "seurat5")
  remotes::install_github("satijalab/seurat-wrappers", "seurat5")
  remotes::install_github("stuart-lab/signac", "seurat5")
## https://satijalab.org/loomr/loomr_tutorial
# Install devtools from CRAN
# Use devtools to install hdf5r and loomR from GitHub
devtools::install_github(repo = "hhoeflin/hdf5r")
devtools::install_github(repo = "mojaveazure/loomR", ref = "develop")

#> others
devtools::install_github("immunogenomics/presto") #fast Wilcoxon
remotes::install_github("huayc09/SeuratExtend")
remotes::install_version(package = "Matrix", version = "1.6-4", dependencies = FALSE, repos = "http://cran.us.r-project.org")


############ RNAseq ##############################
BiocManager::install("edgeR")
BiocManager::install("DESeq2")
install.packages("openxlsx")
BiocManager::install("tximport", force=TRUE)
BiocManager::install("topGO", force = TRUE)
BiocManager::install("pathview", force=TRUE)
BiocManager::install("DEGreport",force=TRUE) # DESeq2で使用
BiocManager::install("corrgram") # DESeq2で使用
BiocManager::install("pcaExplorer")
BiocManager::install("vsn", force=TRUE)
BiocManager::install("clusterProfiler")
BiocManager::install("fgsea")
BiocManager::install("ReactomePA")

# gene id をgene symbolの変換等に
BiocManager::install("rtracklayer", force = TRUE)
BiocManager::install("AnnotationDbi", force = TRUE)
BiocManager::install("org.Dr.eg.db", force = TRUE)
BiocManager::install("org.Mm.eg.db", force = TRUE)
BiocManager::install("org.Hs.eg.db", force = TRUE)
BiocManager::install("biomaRt", force = TRUE)
install.packages("msigdbr")


## poathway analysis
# scpa: https://jackbibby1.github.io/SCPA/
install.packages('nbpMatching')
devtools::install_version("crossmatch", 
                          version = "1.3.1", 
                          repos = "http://cran.us.r-project.org")
devtools::install_version("multicross", 
                          version = "2.1.0", 
                          repos = "http://cran.us.r-project.org")
devtools::install_github("jackbibby1/SCPA", force = TRUE)
#GSVA
BiocManager::install("GSVA")
BiocManager::install("singscore")



########## ligand-receptor interactions #########
#CellChat:  https://github.com/jinworks/CellChat
install.packages('NMF')
devtools::install_github("jokergoo/circlize")
devtools::install_github("jokergoo/ComplexHeatmap")
devtools::install_github("jinworks/CellChat")
#liana
  remotes::install_github('saezlab/liana')
#SingleCellSignalR
devtools::install_github(repo = "https://github.com/SCA-IRCM/SingleCellSignalR_v1",
                         subdir = "SingleCellSignalR")
devtools::install_github('msraredon/Connectome', ref = 'master')
# NicheNets: https://github.com/saeyslab/multinichenetr
devtools::install_github("saeyslab/nichenetr")
devtools::install_github("saeyslab/multinichenetr", force = TRUE)


############  Trajectory analysis ########################
# Velocity analysis
devtools::install_github("velocyto-team/velocyto.R")
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
                       'ggrastr'),
                     force = TRUE)
devtools::install_github('cole-trapnell-lab/monocle3')



############ SCENIC ################################################
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




# doublet finder
remotes::install_github('chris-mcginnis-ucsf/DoubletFinder')


## statistics
install.packages("exactRankTests")



#> 12/08/24
devtools::install_github("cellgeni/sceasy")
BiocManager::install(c("LoomExperiment", "SingleCellExperiment"))





