# Biomartの便利な使い方

#### 1 GO termにassaignされているGeneを拾ってくる

#### 転写因子を拾いたい　-> Transcriptional factors GO:0003700

```r
library(biomaRt)


mouse = useEnsembl(biomart = "ensembl", dataset='mmusculus_gene_ensembl')

getBM(attributes = c('ensembl_gene_id','external_gene_name', 'go_parent_term', 'name_1006'), 
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
