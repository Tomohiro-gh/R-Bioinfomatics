## Color paletteについて

# https://k-metrics.netlify.app/post/2018-11/rcolorbrewer/
  

# https://rdrr.io/cran/ggsci/man/pal_jco.html

library(ggsci) ## https://nanx.me/ggsci/articles/ggsci.html
library(ggpubr)
library(scales)
show_col(pal_jco("default")(10))
show_col(pal_jco("default", alpha = 0.6)(10))

# grayとorange
mycolors <- c("#999999","#E69F00")


# Gray gradient
# https://www.color-hex.com/color-palette/69609
# https://www.schemecolor.com/gray-gradient.php
GrayGradient <- c("#696969",
                  "#454545",
                  "#7D7D7D",
                  "#707070",
                  "#9a9a9a",
                  "#9E9E9E", 
                  "#e9e9e9",
                  "#D3D3D3",
                  "#d4d4d4",
                  "#BDBDBD")

## Orange gradient
# https://www.schemecolor.com/metallic-gold-gradient.php
#https://www.schemecolor.com/light-dark-gold-gradient.php

GoldGradient <- c("#DBB701",
                  "#FFDC5B",
                  "#C9A401",
                  "#EECC40",
                  "#EDCB01",
                  "#D4AF37", 
                  "#B79001",
                  "#9F8000",
                  "#A57C01",
                  "#816317" )
                  

# 23/07/25
## Sueratのfeature plot用の色
for(a_gene in GOIs){
  FeaturePlot(object = seurat_obj,
              features = a_gene,
              cols = c("#ffff00", "#330033"),
              pt.size = 0.1)
  ggsave(paste0("FP_NG2nedD4_notCCreg_Dim30Res0.7_", a_gene, ".png"),
         width=5, height=, dpi=300)
}




## Sueratのfeature plot用の色：2 geneをみる場合，blend
FeaturePlot(object = seurat_obj,
            features = c("Cspg4", "tdTomato"),
            blend = TRUE,
            cols = c("#ffff0080", "#ff0000FF", "#0000ffFF"),
            pt.size = 0.1)
ggsave("FP_NG2nedD4_notCCreg_Dim30Res0.7_Cspg4tdTomato.png",
       width=14, height=4, dpi=300)


# 23/08/03
## Gradient color 

gradient_color()

scale_colour_gradient2(low="steelblue", mid="lightgrey", high="darkgoldenrod1")



scale_color_gradientn(colours = viridis::viridis(20)
                      
                      