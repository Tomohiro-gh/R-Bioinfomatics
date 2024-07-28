## Gene ID Conversion 大きく分けて３つのやり方あり -> 1) MapIDs 2) Ensdb 3) BiomaRt
## ref: https://zenn.dev/rchiji/articles/99bf231c92aad9

## 1) MapIDs


## 2) Ensdb
HSensembl <- keys(org.Hs.eg.db, keytype = "ENSEMBL")

AnnotationDbi::select(x = EnsDb.Hsapiens.v86, 
                      keys = HSensembl,  ## keysに変換したいものを入れる
                      keytype = "GENEID",
                      columns = "ENTREZID")





## 3) BiomaRt
library(biomaRt)

listMarts()
db <- useMart(biomart = "ENSEMBL_MART_ENSEMBL")
hg <- useDataset("hsapiens_gene_ensembl", mart = db)

HSsymbol_df <- 
  getBM(attributes = c("ensembl_gene_id","hgnc_symbol"), 
        mart = hg, 
        filters = "ensembl_gene_id", 
        values = HSensembl)

  ## Does mitochrondrial gene include ?
  HSsymbol_df$hgnc_symbol[grep("^MT-", HSsymbol_df$hgnc_symbol)]
  ## Yes!
