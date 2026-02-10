## qPCR results
##> qPCRのデータを書く関数
##> 
##> 
library(dplyr)
library(purrr) # map, set_names 関数を使用
library(ggplot2)
# library(patchwork) # facet_wrapを使わない場合、グラフの結合に必要

#> BAR + DOT plot
FUN.PLOT.GGP.STATS <- function(df, x_col, y_col, ylab, Group, GroupColors, MyTitle) {
  
  a_seed <- sample(246, 1)
  mypd = position_jitterdodge(dodge.width = 0.70, 
                              jitter.width = 0.50,
                              jitter.height = 0,
                              seed = a_seed)
  #> rlang::enquo() を使用してExpressionの入っているカラムの
  # rlang::enquo() を使用して引数を非標準評価でキャプチャする
  x_sym <- rlang::enquo(x_col)
  y_sym <- rlang::enquo(y_col)
  Gr_sym <- rlang::enquo(Group)
  
  #> expression levelに値が入っていなければ除外
  df <- 
    df |> dplyr::filter(!is.na(!!y_sym))
  
  y_max <- max(df[[rlang::as_name(y_sym)]], na.rm = TRUE)
  
  plt <-
    df |>
    ggplot(aes(x = !!x_sym, y = !!y_sym, color = !!Gr_sym)) +
    # 棒グラフ (平均値)
    stat_summary(aes(fill = !!Gr_sym),
                 fun = "mean", geom = "bar",
                 width = .6, linewidth = 0,
                 position = position_dodge(width = 0.8),
                 alpha = 0.7) +
    scale_fill_manual(values = GroupColors) +
    # エラーバー (平均 ± SD)
    stat_summary(fun.data = "mean_sdl",
                 fun.args = list(mult = 1),
                 geom = 'errorbar',
                 aes(color = !!Gr_sym), 
                 width = .3, linewidth = 1.0,
                 position = position_dodge(width = 0.8)) +
    # ドットプロット (個々のデータ点)
    geom_point(aes(x = !!x_sym, y = !!y_sym, color = !!Gr_sym),
               size = 6 , shape = 16, position = mypd) + 
    # 体裁
    scale_color_manual(values = GroupColors) +
    scale_y_continuous(expand=c(0,0),
                       limits = c(0, y_max * 1.2)) + 
    labs(title = MyTitle, x="", y = ylab) +
    theme_classic() +
    theme(
      legend.position = 'none',
      plot.title = element_text(hjust = 0.5),
      axis.title = element_text(hjust = 0.5, size= 16, colour = "black"),
      axis.text.x = element_text(size= 16, vjust = 0.5, colour = "black"),
      axis.text.y = element_text(size= 16, colour = "black"),
      axis.line = element_line(colour = "black", linewidth=0.5),
      axis.ticks = element_line(colour = "black", linewidth=0.5),
      axis.ticks.length = unit(1, "mm"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      text = element_text(size = 16),
      aspect.ratio = 1.5
    )
  
  return(plt)
}
# ----------------------------------------------------------------------

#> plotする時はこれ，
# 2. Targetごとにデータを分割し、関数を適用してリストを返す処理
FUN.PLT.QPCR <- function(df, x_col, y_col, ylab, Group, GroupColors) {
  
  #> rlang::enquo() を使用して引数を非標準評価でキャプチャする
  x_sym <- rlang::enquo(x_col)
  y_sym <- rlang::enquo(y_col)
  Gr_sym <- rlang::enquo(Group)
  
  #> expression levelに値が入っていなければ除外
  data_list_by_target <- 
    df |>
    dplyr::filter(!is.na(!!y_sym)) |>
    split(f = df$Target) 
  
  # purrr::map を使用して、リストの各要素に関数を適用
  # .x は data_list_by_target の各要素 (データフレーム)
  plot_list <- data_list_by_target |> 
    purrr::map(
      .f = ~ FUN.PLOT.GGP.STATS(
        df = .x, 
        # {{}} で非標準評価の引数をそのまま渡す
        x_col = {{x_col}},  
        y_col = {{y_col}},  
        Group = {{Group}},
        ylab = ylab, 
        # Target名をタイトルとして利用
        MyTitle = paste0(unique(.x$Target)), 
        GroupColors = GroupColors
      )
    )
  # リストの要素名が Target 名 (split関数が自動で設定) になっている
  return(plot_list)
}


message("FUN.PLT.QPCR がloadされました (FUN.PLT.QPCR_v251226.R)")
message("Usage")
message("plt1 <- list()")
message("plt1 <- FUN.PLT.QPCR(df, x_col, y_col, ylab, Group, GroupColors, MyTitle)")
message("patchwork::wrap_plots(plot_list_results, ncol = xx)")
message("体裁を整え直したい場合 (例)")
message("new_theme_mods <-
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust=1), 
    plot.title = element_text(hjust = 0.5)) ")
message("plt1_modified <- 
  plot_list_results |>
  purrr::map(.f = ~ .x + new_theme_mods )")
message("")
message("まとめてsaveの仕方")
message( 
  'patchwork::wrap_plots(modified_plots, ncol = 4)
  ggsave("IMG.png", width = 12, height = 8, dpi = 200)')

message("個別にsave")
message( 
  'patchwork::wrap_plots(modified_plots, ncol = 4)
  ggsave("IMG.png", width = 12, height = 8, dpi = 200)')

# #>体裁を整える場合．
# # 3. 使用例
# plot_list_results <- 
#   df_actb |>
#   FUN.CREATE.PLOTS.BY.TARGET(
#     y_col = Expression,
#     ylab = "Fold change",
#     GroupColors = color_IFN
#   )
# patchwork::wrap_plots(plot_list_results, ncol = 4)


# #> plotの修正
# library(purrr)
# plot_list_results は FUN.CREATE.PLOTS.BY.TARGET から返されたリスト
# 修正したいテーマ設定を定義
# new_theme_mods <-
#   theme(
#     axis.text.x = element_text(angle = 45, hjust = 1, vjust=1), 
#     plot.title = element_text(hjust = 0.5)
#   ) 
# #> purrr::map を使ってリスト内のすべてのプロットに修正を適用
# #>  # 各プロットオブジェクト(.x)にテーマを上書きで追加
# modified_plots <- 
#   plot_list_results |>
#   purrr::map(.f = ~ .x + new_theme_mods )
