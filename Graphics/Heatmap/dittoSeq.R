# dittoSeq
# https://rdrr.io/github/dtm2451/dittoSeq/
# https://rdrr.io/github/dtm2451/dittoSeq/f/README.md
# https://www.biostars.org/p/454292/
# install
  install.packages("remotes")
  remotes::install_github("dtm2451/dittoSeq")
  # or
  BiocManager::install("dittoSeq")

#Seurat objectもそのまま使える

library(dittoSeq)

# Usage :  https://rdrr.io/github/dtm2451/dittoSeq/man/dittoHeatmap.html
# 背後では complexheatmapの pheatmapがある
  # https://jokergoo.github.io/2020/05/06/translate-from-pheatmap-to-complexheatmap/
  
dittoHeatmap(
  object,
  genes = getGenes(object, assay),
  metas = NULL,
  cells.use = NULL,
  annot.by = NULL,
  order.by = .default_order(object, annot.by),
  main = NA,
  cell.names.meta = NULL,
  assay = .default_assay(object),
  slot = .default_slot(object),
  swap.rownames = NULL,
  heatmap.colors = colorRampPalette(c("blue", "white", "red"))(50),
  scaled.to.max = FALSE,
  heatmap.colors.max.scaled = colorRampPalette(c("white", "red"))(25),
  annot.colors = c(dittoColors(), dittoColors(1)[seq_len(7)]),
  annotation_col = NULL,
  annotation_colors = NULL,
  data.out = FALSE,
  highlight.features = NULL,
  highlight.genes = NULL,
  show_colnames = isBulk(object),
  show_rownames = TRUE,
  scale = "row", 
  cluster_cols = isBulk(object),
  border_color = NA,
  legend_breaks = NA,
  drop_levels = FALSE,
  breaks = NA,
  complex = FALSE, # TRUEにすると, pheatmapのoptionが使える
  ...
)



## example 
## Example 1 : 05/25/22 
d <- dittoHeatmap(msen20.020, 
                  getGenes(msen20.020)[1:20],
                  annot.by = c("seurat_clusters", "Condition"))
png("dittoseq_hp.png",res=300, height=2000, width=2000)
d
dev.off()


# 
d <- dittoHeatmap(msen20.020, 
                  getGenes(msen20.020)[1:40],
                  annot.by = "Condition",
                  complex = TRUE,
                  column_split = msen20.020$seurat_clusters)
png("dittoseq_hp.png", res=300, height=800, width=2000)
d
dev.off()




d <- 
  dittoHeatmap(
    object = seurat_obj %>% 
      subset(idents= "MC"),
    genes = DEG.MC.gene.up,
    annot.by = c("State"),
    slot = "data")

