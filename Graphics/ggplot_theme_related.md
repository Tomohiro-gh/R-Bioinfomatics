


#theme settings
theme_heat <- theme(
    plot.margin= unit(c(0, 0, 0, 0), "inch"),
    text = element_text(hjust = 0.5, size = 16, face="bold", color = "black"),
    # axis.text.x = element_text(hjust=0.5, size=18, face="bold", color = "black"),
    axis.text.y = element_text(hjust=0.5, size=10, face="bold", color = "black")) 

my_theme <-  theme(text = element_text(hjust=0.5, size=20, face="bold"),
                   axis.text = element_text(hjust=0.5, size=16, face="bold"),
                   axis.ticks.length = unit(2, "mm"),
                   axis.line = element_line(colour = "black", linewidth=1.0),
                   aspect.ratio = 1)
