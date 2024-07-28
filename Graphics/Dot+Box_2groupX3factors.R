#https://stackoverflow.com/questions/48954358/add-geom-line-to-link-all-the-geom-point-in-boxplot-conditioned-on-a-factor-with

library(ggplot2)
library(openxlsx)


## 2群 x 3種のデータのplot
##dot plotで可視化する


data$Events <- factor(data$Events, levels=c("Neovasculature","Sprouting","Regression"))
pd = position_jitterdodge(dodge.width = 0.75, jitter.width = 0.3)

G <- ggplot(data, aes(x=Events, y=Number, fill=Group)) +
  geom_boxplot(alpha=0.2)+
  geom_point(aes(color = Group), position = pd, size=2)+
  scale_fill_brewer(palette = 'Set1')+
  scale_color_brewer(palette = 'Set1')
plot(G)

ggsave(G, filename = "3-5dpf_plot_events.png",dpi=300)
