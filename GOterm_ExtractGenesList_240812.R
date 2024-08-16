library(biomaRt)
library(org.Mm.eg.db)
library(GO.db)
library(AnnotationDbi)

library(ggplot2)
library(ggvenn)

## GO termのgene setを取ってくる
#> 1 biomartから
mouse = useEnsembl(biomart = "ensembl", dataset='mmusculus_gene_ensembl')
FilterList <- listFilters(mouse)
FilterList[grep("go", FilterList)]

Glucose_BM <- getBM(attributes=c('mgi_symbol', 'description', 'go_id'),
                    filters = 'go', values = 'GO:0006006', mart = mouse)
  Glucose_BM$mgi_symbol %>% unique()
  Glucose_BM$mgi_symbol %>% unique() %>% length() #79


Glucose_BM_simple <- getBM(attributes=c('mgi_symbol'),
                           filters = 'go', values = 'GO:0006006', mart = mouse)
Glucose_BM_simple$mgi_symbol %>% unique()
Glucose_BM_simple$mgi_symbol %>% unique() %>% length() #79
#> Glucose_BMとGlucose_BM_simpleは同じ

#> 2 Amigoから
glucose_Amigo <- read.xlsx("/Users/tomohiro/Dropbox/FukuharaLab_Res/GO0006006_Glucosemetabolism.xlsx")
  glucose_Amigo$bioentity %>% unique
  glucose_Amigo$bioentity %>% unique %>% length() #142


#> 3 Annotation dbi
glucose_Annodbi <- AnnotationDbi::select(org.Mm.eg.db, keys=c("GO:0006006"), columns = c('SYMBOL'), keytype = "GOALL")
  glucose_Annodbi$SYMBOL %>% unique
  glucose_Annodbi$SYMBOL %>% unique %>% length() #225
  table(glucose_Annodbi$EVIDENCEALL)

#> 4 Quick GO
glucose_quickGO <- read.csv("/Users/tomohiro/Dropbox/FukuharaLab_Res/QuickGO-annotations-1723242331848-20240809.tsv",
                            sep = "\t")
  glucose_quickGO$SYMBOL %>% unique
  glucose_quickGO$SYMBOL %>% unique %>% length() #123


## ベン図でも
Glucose_list <- list(`biomart` = Glucose_BM_simple$mgi_symbol %>% unique(),
                     `Amigo2` =   glucose_Amigo$bioentity %>% unique(),
                     `Annotationbdi` = glucose_Annodbi$SYMBOL %>% unique(),
                     `QuickGO` = glucose_quickGO$SYMBOL %>% unique())
  ggvenn::ggvenn(Glucose_list)



