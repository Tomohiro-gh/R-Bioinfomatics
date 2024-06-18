# R-Bioinfomatics
Bioinfomatical handling

## Gene ID conversion
#### Gene ID Conversion 大きく分けて３つのやり方あり -> 1) MapIDs 2) Ensdb 3) BiomaRt
ref: https://zenn.dev/rchiji/articles/99bf231c92aad9


#### 1) MapIDs 遺伝子変換 select()/mapIDs()
```r

#mapIDはconversionを１つしか選べない．

```


#### 2) Ensdb
```r
library(EnsDb.Hsapiens.v86) #Human

HSensembl <- keys(org.Hs.eg.db, keytype = "ENSEMBL")
  dim(HSensembl)

genes.df <-
  AnnotationDbi::select(x = EnsDb.Hsapiens.v86, 
                        keys = HSensembl,       # keysに変換したいものを入れる
                        keytype = "GENEID",     # Ensdb パッケージの場合は， GENEID = Ensembl gene ID
                        columns = c("SYMBOL", "ENTREZID"))
```


#### 3) BiomaRt
```r
library(biomaRt)

listMarts() #利用できるmartリストを表示

db <- useMart(biomart = "ENSEMBL_MART_ENSEMBL") #使用するmart指定

# ヒトのデータベースを取得
hg <- useDataset("hsapiens_gene_ensembl", mart = db)


genes.df <- 
  getBM(attributes = c("ensembl_gene_id","hgnc_symbol"),  #ここで要素に入れたい項目を指定
        mart = hg, 
        filters = "ensembl_gene_id", 
        values = HSensembl)

  # Does mitochrondrial gene include ?
    HSsymbol_df$hgnc_symbol[grep("^MT-", HSsymbol_df$hgnc_symbol)]
    # [1] "MT-ND6"  "MT-CO2"  "MT-CYB"  "MT-ND2"  "MT-ND5"  "MT-CO1"  "MT-ND3"  "MT-ND4"  "MT-ND1"  "MT-ATP6" "MT-CO3"  "MT-ND4L" "MT-ATP8"
      # Yes!
```

##### Mouseの場合：
```r
library(biomaRt)

listMarts() #利用できるmartリストを表示

db <- useMart(biomart = "ENSEMBL_MART_ENSEMBL") #使用するmart指定

# マウスのデータベースを取得
Mm <- useDataset("_gene_ensembl", mart = db)

getBM()機能のfilters=引数、attributes=引数で指定可能なtermを調べるには、listFilters()機能、listAttributes()機能が有用である。

listFilters


genes.df <- 
  getBM(attributes = c("ensembl_gene_id","hgnc_symbol"),  #ここで要素に入れたい項目を指定
        mart = hg, 
        filters = "ensembl_gene_id", 
        values = HSensembl)

  # Does mitochrondrial gene include ?
    HSsymbol_df$hgnc_symbol[grep("^MT-", HSsymbol_df$hgnc_symbol)]
    # [1] "MT-ND6"  "MT-CO2"  "MT-CYB"  "MT-ND2"  "MT-ND5"  "MT-CO1"  "MT-ND3"  "MT-ND4"  "MT-ND1"  "MT-ATP6" "MT-CO3"  "MT-ND4L" "MT-ATP8"
      # Yes!
```
