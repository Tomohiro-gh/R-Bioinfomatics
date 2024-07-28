# namigに関するプログラム

#一括で名前を作る
ClusterAna <- c("Myeloid", "Mesenchyme", "Osteoblast", "Cleithrum", "Epi-Basal", "Epi-Int", "Epi-Super", "Leukocyte")
shtname=c("vs2dpi", "vs4dpi", "vs7dpi")
# Naming
CSname <- NULL
for (i in 1:length(ClusterAna)){
  C <- paste(ClusterAna[i], sep="")
  for (j in 1:length(shtname)){
    S <- paste(shtname[j], sep="")
    CS <- paste(C, S, sep="_")
      CSname <- append(CSname, CS)
  }
}



# Listリストに名前をつけて保存
DEGsList <- setNames(DEGsList,CSname)
setNames

# Listの名前を取り出す
names(list.object) #全て
names(list.object)[1]　#一番目の名前のみ



