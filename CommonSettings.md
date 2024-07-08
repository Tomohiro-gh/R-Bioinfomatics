# Common settings for writing R script

----
## 自作Functionをlocal environmentにloadする
```r
## Load a script only to my environment
Dir="/Path/to/myFunction"
scripts <- 
  c("function_Graphs_v2.R",
    "function_FindAllMarkers.R", 
    "function_ClusteringCondition.R",
    "function_check_Clustering_UMAPplot.R")

.myfunc.env = new.env()
for(sc in scripts){
  sys.source(paste0(Dir, sc), envir = .myfunc.env ) # localにload
}
attach(.myfunc.env)
```
----
