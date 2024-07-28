

# Human gene < - > zebrafish gene Ortholog Conversion

# <<<<< 05/19/22 
# 対応表を使う

# これらをzebrafishのgeneへ変換
# Zebrafish <-> Human geneの対応表
Zf_to_Hsa <- read.xlsx("/Users/tomohiro/Dropbox/FukuharaLab_Res/Database/ensembl_biomart/BiomaRt_ensembl_zf_hsa_ortholog_list_raw(41965).xlsx", rowNames = FALSE, startRow = 1)　
  head(Zf_to_Hsa)
    #下記4つの列からなる
    # ensembl_gene_id >>>>>>>> zebrafish ID
    # external_gene_name >>>>>>>> zebrafish symbol
    # hsapiens_homolog_ensembl_gene  >>>>>>>> human ID
    # hsapiens_homolog_associated_gene_name  >>>>>>>> human symbol

fun.OrthologConversion <- function(human_genes){
  converted <- Zf_to_Hsa %>% 
    filter(hsapiens_homolog_associated_gene_name %in% human_genes) %>% 
    pull(external_gene_name)
  return(converted)
}

 # ) example
  h.skin <-c("MALAT1","ATP5F1E","CAVIN1","SELENOW","CLU","H3F3A","NOP53","S100A6","VIM","ATP5MC2","CD74","IFITM3")
  zf_skin <- fun.OrthologConversion(h.skin)
  
  
  
  
  
# Zebrafish gene -> human conversion
# one to one pairのみを変える
fun.Zf.to.Human <- function(zf.genes){
  
  
}
  
