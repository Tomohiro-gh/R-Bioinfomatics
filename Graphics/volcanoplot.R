library(tidyverse) # including ggplot2

# volcano plot
volp <- function(res, ){
  A <- res
  vp <- ggplot(data=A, 
               aes(x= logFC, 
                   y= -log10(PValue), 
                   col= diffexpressed,
                   label=delabel,
                      text = SYMBOL)) +
    xlim(-8.0, 8.0) + ylim(0, 20) +
    geom_point() +
    scale_color_manual(values = mycolors) +
    geom_text_repel(data=head(order(A[A$diffexpressed==DOWN, ], A[A$FDR, ]), ), aes(label=delabel))+
    theme_minimal() +
    labs(title = "edgeR",
         caption = "UP () : FDR < 0.05 & logFC > 1 .0 \nDown () :FDR < 0.05 & logFC < -1.0") +
    theme(plot.title = element_text(hjust=0.5, size=20, face="bold"),
          plot.caption = element_text(hjust = 0.5, size=12),
          axis.title.x = element_text(hjust=0.5, size= 16, face="bold"), 
          axis.title.y = element_text(hjust=0.5, size= 16, face="bold"))
  plot(ggvol)
  
}


