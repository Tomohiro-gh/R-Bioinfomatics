library(dplyr)
library(tidyr)


#> qPCRのCq値を用い，ddCtを計算する関数．
#> reference geneと，control groupを指定する
#> dfは，CFX maestroで出てきたエクセルシートを想定
#> 
## function >> 
FUN.CALC.ddCt <- function(df, ref_gene, control_group) {
  
  # 1. Delta Ct の計算: 各サンプルの各遺伝子から、同じサンプルのリファレンス遺伝子のCqを引く
  df_dct <- df %>%
    group_by(Sample.Biological.Group) %>%
    mutate(
      ref_cq = Mean.Cq[Target == ref_gene],
      dCt = Mean.Cq - ref_cq
    ) %>%
    ungroup()
  
  # 2. Control群の平均Delta Ct を計算 (遺伝子ごと)
  control_avg <- df_dct %>%
    filter(Control == control_group) %>%
    group_by(Target) %>%
    summarise(avg_dCt_ctrl = mean(dCt, na.rm = TRUE), .groups = "drop")
  
  # 3. Delta Delta Ct と Fold Change の計算
  df_final <- df_dct %>%
    left_join(control_avg, by = "Target") %>%
    mutate(
      ddCt = dCt - avg_dCt_ctrl,
      Fold_Change = 2^(-ddCt)
    )
  
  return(df_final)
}
## << end function -------------------------------
