# Get gene set retrieval from a GO term 

## 1 biomaRtを使用する方法
### 1.1 BiomaRtの準備
```r
library(biomaRt)

ensembl=useMart("ensembl")

    listDatasets(ensembl)
    ##      dataset                    description             version
    ## 107  mmusculus_gene_ensembl     Mouse genes (GRCm39)    GRCm39

mouse = useEnsembl(biomart = "ensembl", dataset='mmusculus_gene_ensembl')

    ## GetBM functionでどのカラムを抽出できるか？
    listFilters(mouse)

FilterList <- listFilters(mouse)
FilterList[grep("go", FilterList)]
```
例えば，Go termにassignされている遺伝子をsymbolで欲しかったら， `mgi_symbol`


#### 転写因子を拾いたい　-> Transcriptional factors GO:0003700

```r
library(biomaRt)

## For mouse
ensembl=useMart("ensembl")
mouse = useEnsembl(biomart = "ensembl", dataset='mmusculus_gene_ensembl')


GO_BM <- getBM(
    attributes = c('ensembl_gene_id',  'external_gene_name', 'go_parent_term', 'name_1006'), 
      filters = 'go', 
      values = 'GO:0003700', 
      mart = ensembl)

m_genes = getBM(attributes = c("mgi_symbol", 
                               "description",
                               "go_id"), 
                filters = "go", 
                values = "GO:0003700" , 
                mart = mouse)

TF_genes <- m_genes %>% filter(go_id == "GO:0003700") %>% pull(mgi_symbol) %>% unique
  length(TF_genes) #611

```
------------

## 2 Annotationdbiを使用する方法
```r
library(AnnotationDbi)
library(org.Mm.eg.db)

GOterm <- "GO:0006119"
Geneset_df <- AnnotationDbi::select(org.Mm.eg.db, keys = GOterm, columns = c('SYMBOL'), keytype = "GOALL")
  GOterm
  dim(GOterm) #[1] 215   4
  unique(GOterm$SYMBOL) %>% length # [1] 147
  length(GOterm$ONTOLOGYALL) #215
  table(GOterm$EVIDENCEALL)


```
