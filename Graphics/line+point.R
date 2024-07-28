## Geom line + geom point grouping
## source Exp088_graph_2101004_v2.R

graph <- ggplot(f, aes(x = Time, y = DirDegree, colour = VesID)) +
  geom_line() +
  scale_x_continuous(breaks = seq(0,120,12)) +
  scale_y_continuous(expand=c(0,0), breaks=seq(-180,180,30), limits=c(-180,180)) +
  geom_point(aes(colour = VesID)) +
  labs(title = n, x = "hpi") + 
  theme_classic() +
  theme(plot.title = element_text(hjust=0.5, size=20),
        legend.position = 'none',
        axis.title.x = element_text(hjust=0.5, size= 16, face="bold"), axis.title.y = element_text(size= 16, face="bold"),
        axis.text.x = element_text(size= 14), axis.text.y = element_text(size= 14)) +
  annotate("rect", xmin= 0, xmax=120, ymin=-45, ymax=45, alpha=0.3)