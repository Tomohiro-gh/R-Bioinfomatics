library(dplyr)



########
# dplyr パッケージの distinct 関数を使用して、R の列ごとに重複する行を削除する
# https://www.delftstack.com/ja/howto/r/remove-duplicates-in-r/



### 場合に応じて 新しいカラムへ変数を入れる mutate + casewhen

df.Ctrlvs7d <- df.Ctrlvs7d %>%
  filter(!is.na(padj)) %>%
  arrange(padj) %>%
  mutate(diffexpressed=case_when(
    padj<0.05 & log2FoldChange> 1 ~ "UP",
    padj<0.05 & log2FoldChange< -1 ~ "DOWN",
    padj>=0.05 ~ "None"))



#### Group_byの後にarrangeで並び替える時，groupを保持する方法
# arrangeないを.by_group = TRUE　とすればOK
DEGang <- df %>% 
  mutate(diffexpressed = case_when(
    avg_log2FC>0 ~ "UP",
    avg_log2FC<0 ~ "DOWN")) %>%
  group_by(diffexpressed) %>%
  arrange(p_val, .by_group = TRUE ) ## <------



####  Filterの中身を変数でわたしたい時
## Dplyr functions with string
## https://www.r-bloggers.com/2019/11/dplyr-functions-with-string/

var <- "gender" # this is a string
val <- "female" # this is a string
df %>%
  filter(., !!sym(var) == val)

## id gender
## 1 2 female
## 2 4 female
## 3 5 female

