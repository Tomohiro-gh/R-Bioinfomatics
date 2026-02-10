library(sparrow)
library(reactome)
library(magrittr)
library(dplyr)
library(ggplot2)
library(ComplexHeatmap)
library(circlize)
library(edgeR)
library(data.table)
## https://lianos.github.io/sparrow/articles/sparrow.html
## https://lianos.github.io/sparrow/index.html

theme_set(theme_bw())
RC <- getReactomeCollection(
  species = "mouse",
  id.type = c("entrez", "ensembl"),
  rm.species.prefix = TRUE
)