## 自分の環境にのみファイルを反映させる

## ex) original code: 
## 230120_ClusterAnnotation.R


# Load a script only to my environment
.myfunc.env = new.env()
sys.source("/Users/tomohiro/Dropbox/BioInfomatics/R_CommandList/Seurat/function_Graphs_v2.R", 
           envir = .myfunc.env ) #graphに関する function
sys.source("/Users/tomohiro/Dropbox/BioInfomatics/R_CommandList/Seurat/function_FindAllMarkers.R", 
           envir = .myfunc.env ) #FindAllmarkersに関するfunction
attach(.myfunc.env)
