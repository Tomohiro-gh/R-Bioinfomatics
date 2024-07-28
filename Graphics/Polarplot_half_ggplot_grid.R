## 10/07/22 Polar plot half 参考
# polar plot　半円をかく， gridのライブラリを使って，した半分をかくす
# https://stackoverflow.com/questions/22398350/how-to-show-only-part-of-the-plot-area-of-polar-ggplot-with-facet

library(ggplot2)
library(reshape2)
library(grid)

data <- melt(matrix(rnorm(1000), nrow = 20))
data$type <- 1:2
data$Var1 <- data$Var1*6 - 60

p1 = ggplot(data, aes(Var1, Var2)) + 
  geom_tile(aes(fill = value)) + 
  coord_polar(theta = "x", start = pi) + 
  scale_x_continuous(limits = c(-180, 180),
                     breaks = seq(-180,180, by = 15),
                     minor_breaks = seq(-180,180, by = 7.5)) +
  facet_wrap(~type)
g1 = ggplotGrob(p1)

grid.newpage()
pushViewport(viewport(height=1, width=1, clip="on"))
grid.draw(g1)
grid.rect(x=0,y=0,height=1, width=2, gp=gpar(col="white"))



  

# Another example, 
# https://twitter.com/yjunechoe/status/1506672410208051201
  
library(ggplot2)
library(ggtrace)
library(reshape2)
library(grid)
  
data <- melt(matrix(rnorm(1000), nrow = 20))
data$type <- 1:2
data$Var1 <- data$Var1*6 - 60

p <- ggplot(data, aes(Var1, Var2)) + 
  geom_tile(aes(fill = value)) + 
  coord_polar(theta = "x", start = pi) + 
  scale_x_continuous(limits = c(-180, 180)) +
  facet_wrap(~type)

ggtrace::with_ggtrace(
  x = p + theme(aspect.ratio = .52),
  method = Layout$render,
  trace_steps = 5L,
  trace_expr = quote({
    panels <- lapply(panels, editGrob, vp = viewport(yscale = c(0.48, 1)))
  }),
  out = "g"
)


data <- melt(matrix(rnorm(1000), nrow = 20))
data$type <- 1:2
data$Var1 <- data$Var1*6 - 60

p1 = ggplot(data, aes(Var1, Var2)) + 
  geom_tile(aes(fill = value)) + 
  coord_polar(theta = "x", start = pi) + 
  scale_x_continuous(limits = c(-180, 180)) +
  facet_wrap(~type)
g1 = ggplotGrob(p1)

grid.newpage()
pushViewport(viewport(height=1, width=1, clip="on"))
grid.draw(g1)
grid.rect(x=0,y=0,height=1, width=2, gp=gpar(col="white"))

