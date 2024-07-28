## Statistics

## Required library
library(multcomp) # multiple comparison

### t-test
## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
### Example 1 (Exp122_EdUEC_graph_test.R 参照)
t.test(Normalized_number ~ Group, data = d, var.equal = T)

### Example 2 
# 1) 7dpi - normalized (normalizedを採用)
t.test(Length_mm ~ Group, data = injnv088[injnv088$Measurement=="Normalized" & injnv088$Type == "7dpi", ], var.equal = T)




### two way anova
## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
m <- lm(NorIndex ~ Group*Type, d)
  summary(anova(m)) #Two-way ANOVA


### turkey 
## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Groupとtypeで2x2の4群の総当たり比較．
C1 <- NorIndex~Group*Type
TukeyHSD(aov(C1, d))
  ###results
  ## Arteriole (ctrl vs MTZ) p<0.01 ***
  ## Venule (ctrl vs MTZ) p=0.36 n.s.
  ## Control (arteriole vs MTZ) p<0.01 ***


## Dunnett
 ## https://note.com/eiko_dokusho/n/nadcfee67b9d1
library(multcomp)
  order=factor(data$order)
  value=data$value
  ## Dunnett's
  test <- summary(glht(aov(value~order),
                  linfct=mcp(order="Dunnett"))) 

 ## https://stats.biopapyrus.jp/stats/dunnett-test.html
library(SimComp)
library(reshape)
SimTestDiff(data = df, grp = "group", resp = "weight", type = "Dunnet", base = 1, covar.equal = T)


### Mann Whitneys test
## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
###　検定　：Regression について
wilcox.test(Num_Regression ~ Group, data=file)
# 変数　~ 郡分け，　データの種類

# data:  Num_Regression by Group
# W = 24, p-value = 1
# alternative hypothesis: true location shift is not equal to 0


