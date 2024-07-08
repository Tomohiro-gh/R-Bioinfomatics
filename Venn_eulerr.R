library(eulerr) # https://github.com/jolars/eulerr
# install.packages("eulerr")
Genes_P = DEG_Pericytes %>% filter(avg_log2FC >0) %>% rownames()
Genes_S = DEG_SMC %>% filter(avg_log2FC >0) %>% rownames()
Genes_F = Fibro = DEG_Fibro %>% filter(avg_log2FC >0) %>% rownames()


PS <- intersect(Genes_P, Genes_S) # A∩B
PF <- intersect(Genes_P, Genes_F) # B∩C
SF <- intersect(Genes_S, Genes_F) # C∩A
PSF <- Reduce(intersect, list(Genes_P, Genes_S, Genes_F)) # A∩B∩C
onlyP <- Reduce(setdiff, list(Genes_P, Genes_S, Genes_F)) 
onlyS <- Reduce(setdiff, list(Genes_S, Genes_P, Genes_F))
onlyF <- Reduce(setdiff, list(Genes_F, Genes_P, Genes_S))

n.P <- length(Reduce(setdiff, list(Genes_P, Genes_S, Genes_F))) # A-A∩B-C∩A
n.S <- length(Reduce(setdiff, list(Genes_S, Genes_P, Genes_F))) # B-A∩B-B∩C
n.F <- length(Reduce(setdiff, list(Genes_F, Genes_P, Genes_S))) # C-C∩A-B∩C
n.PSF <- length(PSF)
n.PS <- length(PS) - n.PSF
n.PF <- length(PF) - n.PSF
n.SF <- length(SF) - n.PSF

v <- euler(c("Pericyte" = n.P, "SMC" = n.S, "Fibro" = n.F, 
             "Pericyte&SMC" = n.PS, "Pericyte&Fibro" = n.PF, 
             "SMC&Fibro" = n.SF, "Pericyte&SMC&Fibro" = n.PSF))

png("WOupregulatedGenes.png", width = 1500, height = 1500, res=300)
plot(v, 
     quantities = T, # <-- circle内に値を表示
     alpha = 0.5, # 透明度
     fill = c("#EE0000FF", "#3B4992FF", "#008B45FF"), # 塗りつぶし色
     col = c("#BB0021FF", "#5F559BFF", "#20854EFF"), # 枠の色
)
dev.off()

## この関係をdataframeに入れる
DEG_Pericytes = DEG_Pericytes %>%
  mutate(Specificity = case_when(
    rownames(.) %in% onlyP ~ "Pericyte",
    rownames(.) %in% PS ~ "Pericyte & SMC",
    rownames(.) %in% PF ~ "Pericyte & Fibro",
    rownames(.) %in% PSF ~ "Pericyte & SMC & Fibro ",
    TRUE ~ "Downregulated"
  ))



## 参考
# eulerr ベン図 円の大きさを集合要素数に応じて変更
# https://zenn.dev/rchiji/articles/e171b1656061d7
AB <- intersect(A,B) # A∩B
BC <- intersect(B,C) # B∩C
CA <- intersect(C,A) # C∩A
ABC <- Reduce(intersect, list(A,B,C)) # A∩B∩C

n.A <- length(Reduce(setdiff, list(A,B,C))) # A-A∩B-C∩A
n.B <- length(Reduce(setdiff, list(B,A,C))) # B-A∩B-B∩C
n.C <- length(Reduce(setdiff, list(C,A,B))) # C-C∩A-B∩C
n.ABC <- length(ABC)
n.AB <- length(AB) - n.ABC
n.BC <- length(BC) - n.ABC
n.CA <- length(CA) - n.ABC

v <- euler(c("A" = n.A, "B" = n.B, "C" = n.C, "A&B" = n.AB, "B&C" = n.BC, "C&A" = n.CA, "A&B&C" = n.ABC))

# Plotしてみる
plot(v, 
     quantities = T, # <-- circle内に値を表示
)

# 色、透明度
plot(v, 
     quantities = T, # <-- circle内に値を表示
     alpha = 0.5, # 透明度
     fill = c("#FFFF33", "lightgray", "lightblue"), # 塗りつぶし色
     col = c("red", "black", "blue"), # 枠の色
)


# 凡例を表示
plot(v, 
     quantities = T, # <-- circle内に値を表示
     legend = T, # <-- TRUEにすると凡例が作られるが、circle内の文字が消える。
)

# 表示ラベルを変更
plot(v, 
     quantities = T, # <-- circle内に値を表示
     labels = c("cluster1","cluster2","cluster3")
)
