## 
library(ggsci) # https://nanx.me/ggsci/articles/ggsci.html
library(scales)

scale_color_palname()
scale_fill_palname()

## npg
pal_npg(palette = c("nrc"), alpha = 1)(10)　## cloor codeで表示：
show_col(pal_npg("nrc")(10)) ## paletteで表示

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
show_col(pal_nejm("default")(8))

NEJM_cols = c("#BC3C29FF", "#0072B5FF", "#E18727FF", "#20854EFF",
              "#7876B1FF", "#6F99ADFF", "#FFDC91FF", "#EE4C97FF")
  # ggplotで使うときはこれを加える
  scale_color_nejm()
  scale_fill_nejm()



## 
cols = c("#F8766DFF","#ABA300FF", "#7CAE00FF","#00BE67FF",
         "#00A9FFFF","#C77CFFFF", "#FF61CCFF")

