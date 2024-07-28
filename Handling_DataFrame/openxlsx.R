install.packages("openxlsx", dependencies = TRUE)
library(openxlsx)

## https://multivariate-statistics.com/2021/12/07/r-programming-xlsx-files/#saveWorkbook


# open xlsx file
read.xlsx("Directory+filename.xlsx", rowNames = FALSE, startRow = 2)　


# save xlsx file
write.xlsx(file="filename.xlsx", rowNames = FALSE, startRow = 2)


# forで一度にsaveするため


#複数のシートを一度に保存する
filename <- paste("ClusterProfiler_", Clustername, "_", stage, sep="")
workbook <- createWorkbook()
# sheetを作る
  addWorksheet(workbook, sheetName = "GO")
  addWorksheet(workbook, sheetName = "KEGG")
  addWorksheet(workbook, sheetName = "GSEA")
# dataを書き込む
  writeData(workbook, sheet = 1, x=res_GO, rowNames = FALSE)
  writeData(workbook, sheet = 2, x=res_KEGG, rowNames = FALSE)
  writeData(workbook, sheet = 3, x=res_GSEA, rowNames = FALSE)
#save
saveWorkbook(workbook, file = paste(filename,"xlsx", sep="."), overwrite = TRUE)