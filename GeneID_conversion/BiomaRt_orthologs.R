# BiomaRt  http://www.biomart.org/

# BiomaRtをRで使用する
# R から BioMart を利用する方法 - bioinformatics 
#   https://bi.biopapyrus.jp/rnaseq/annotation/r-biomart.html
# biomaRt — プログラム的にデータ取得
#   https://heavywatal.github.io/rstats/biomart.html  

# ensemblのbiomart   https://www.ensembl.org/biomart/martview/6ff31b907bbfe7d8faccb0d6d3a68cd3


library(biomaRt)

listMarts()
#biomart                version
#1 ENSEMBL_MART_ENSEMBL      Ensembl Genes 105
#2   ENSEMBL_MART_MOUSE      Mouse strains 105
#3     ENSEMBL_MART_SNP  Ensembl Variation 105
#4 ENSEMBL_MART_FUNCGEN Ensembl Regulation 105
ensembl = useMart("ensembl")
listDatasets(ensembl)
attributePages(ensembl)
# [1] "feature_page" "structure" "homologs" "snp"  "sequences"
listMarts(host="asia.ensembl.org")



# Zebrafishのdatasetを作成
dr = useMart("ENSEMBL_MART_ENSEMBL", "drerio_gene_ensembl", host="asia.ensembl.org")

# getBMのattributeに入れる変数の一覧を取得する
listAttributes(dr)
  la <- as.data.frame(listAttributes(dr))
  write.xlsx(la, "BiomaRt_ensembl_zf_listAttributes.xlsx", rowNames=F)

# zebrafish ensembl idを元に,対応するhuman geneを idとsymbolで対応させたdfを作成
dr2hsa <- getBM(attributes = c("ensembl_gene_id",
                               "external_gene_name",
                               "hsapiens_homolog_ensembl_gene",
                               "hsapiens_homolog_associated_gene_name"),
                filters = "", 
                values = "",
                uniqueRows=TRUE,
                mart = dr)
write.xlsx(as.data.frame(dr2hsa), "BiomaRt_ensembl_zf_hsa_ortholog_list.xlsx", rowNames=F)