## Heatmap
library(rhape2) # meltに使用
library(ggplot2)

# mtxを用意 
mtx <- matrix(round(rnorm(200), 2), 10, 10)
colnames(m) <- paste("Col", 1:10)
rownames(m) <- paste("Row", 1:10)


## matrixをdfに分解
df <- melt(mtx)
## colnameは Var1 Var2 Row.nameになる


## ggplot2で visulalization
# http://www.sthda.com/english/wiki/ggplot2-quick-correlation-matrix-heatmap-r-software-and-data-visualization

## example:1 
ggplot(
  data = df, aes(x=Var2, y=Var1, fill=value)) + 
  geom_tile(color = "white") +
  scale_fill_gradient2(
    low = "red", high = "blue", mid = "white",  
    midpoint = 0.5, limit = c(0,1), space = "Lab",
    name="Aggregate\nRank")
ggsave("HeatMap_linana_common_interactions.png",
       width= 5, height = 20, dpi = 300)



## example:2 
# y=forcats::fct_rev(Var1)にすることでVar1を逆順で並べることができる．
ggplot(
  data = df, aes(x=Var2, y=forcats::fct_rev(Var1), fill=value)) + 
  geom_tile(color = "white") +
  scale_fill_gradient2(
    low = "red", high = "blue", mid = "white",  
    midpoint = 0.5, limit = c(0,1), space = "Lab",
    name="Aggregate\nRank")
ggsave("HeatMap_linana_common_interactions.png",
       width= 5, height = 20, dpi = 300)


col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(cormat, col=col, symm=TRUE)
