##上付文字 
labs(title="",
    x="",
    y=expression(paste(bold("Number of EdU+ECs (per "), bold({mm^2}), bold(")"), sep="")))


## Arial fontに変更
install.packages("extrafont")
library(extrafont)
font_import()
loadfonts(device = "win") #all, pdf など

## Fontのコントロール
## familyで指定する
Theme(text = element_text(size = 24, family="Arial"))