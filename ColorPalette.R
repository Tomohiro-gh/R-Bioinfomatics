library(ggsignif)
library(ggsci)

#> R default 3 colors
Base3colors <- hue_pal()(3)
  Base3colors <- c("#F8766D", "#00BA38", "#619CFF")   

Base2colors <- hue_pal()(2)
  Base2colors <- c("#F8766D", "#00BFC4")   


#> heatmapの描写に
#> color
mapal <- RColorBrewer::brewer.pal(11, "RdBu")

#> Gradient colors
#> viridis
scale_color_gradientn(colours = viridis::magma(20))
scale_color_gradientn(colours = viridis::viridis(20))


#> wesanderson
#> 8 colorのため，ggplotで指定するにはscale_color_gradientnを使用．
library(wesanderson)
scale_color_gradientn(
  colours = wes_palette("Zissou1", type = "continuous"))

#> 2 group colors
#> Young Aged
color_YorA = c("Young" = "#4DBBD5","Aged" = "#E64B35")
col_state = c("Dormant" = "#91D1C2FF","Active" =  "#DC0000FF")




#> ctrl vs Ercc1
two_colors <- pal_d3("category10")(2) #> "#1F77B4FF" "#FF7F0EFF" 
names(two_colors) <- c("Ctrl", "Ercc1ΔiEC")

#> ctrl vs Irf2
col_Irf2 <- c("Ctrl"="#008B45FF", "Irf2ΔiEC"="#808180FF")

#> ctrl vs Ercc1
col_Ercc1 <- c("Ctrl"="#374E55FF", "Ercc1ΔiEC"="#DF8F44FF")  #jama
col_Ercc1 <- c("Ctrl"="#1F77B4FF", "Ercc1ΔiEC"="#FF7F0EFF")  #



#> ggsci
## npg
pal_npg(palette = c("nrc"), alpha = 1)(10)　## cloor codeで表示：
  # show_col(pal_npg("nrc")(10)) ## paletteで表示
npg_cols =c("#E64B35FF","#4DBBD5FF", "#00A087FF", "#3C5488FF", "#F39B7FFF",
            "#8491B4FF", "#91D1C2FF", "#DC0000FF", "#7E6148FF","#B09C85FF")
## aaas
pal_aaas(palette = c("default"), alpha = 1)(10)　## cloor codeで表示：
show_col(pal_aaas("default")(10))

aaas_cols = c("#3B4992FF", "#EE0000FF", "#008B45FF", "#631879FF", "#008280FF",
              "#BB0021FF", "#5F559BFF", "#A20056FF", "#808180FF", "#1B1919FF")
  show_col(pal_aaas("default", alpha = 0.8)(10))

## NEJM 
pal_nejm(palette = c("default"), alpha = 1)(8)　## cloor codeで表示：
ggshow_col(pal_nejm("default")(8))

NEJM_cols = c("#BC3C29FF", "#0072B5FF", "#E18727FF", "#20854EFF",
              "#7876B1FF", "#6F99ADFF", "#FFDC91FF", "#EE4C97FF")

# ggplotで使うときはこれを加える
  scale_color_nejm()
  scale_fill_nejm()

#> jama 
pal_jama(palette = c("default"), alpha = 1)(7)　## cloor codeで表示：
JAMA_cols = c("#374E55FF", "#DF8F44FF", "#00A1D5FF", "#B24745FF", "#79AF97FF", "#6A6599FF", "#80796BFF")
show_col(pal_jama("default")(2))
  scale_color_jama()  
  
  
## 
cols = c("#F8766DFF","#ABA300FF", "#7CAE00FF","#00BE67FF",
         "#00A9FFFF","#C77CFFFF", "#FF61CCFF")

#> Original color pallete
GradientColors <- 
  c("lightgray", "gray", "orange", "red", "darkred", "black")


#> Gradient colors
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
                      
                      
