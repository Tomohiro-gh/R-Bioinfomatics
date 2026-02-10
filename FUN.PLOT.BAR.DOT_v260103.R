
## ggplot2で任意のx軸，y軸を指定し，plotをオブジェクトとして返す関数
FUN.PLOT.BAR.DOT <- function(df,
                             x_col,
                             y_col,
                             Group,
                             ylab,
                             GraphTitle=NULL,
                             GroupColors = NULL,
                             facet_by = NULL) {
  require(ggplot2)
  require(rlang)
  require(ggsci)
  require(dplyr)
  
  # rlang::enquo() を使用して引数を非標準評価でキャプチャする
  x_sym <- rlang::enquo(x_col)
  y_sym <- rlang::enquo(y_col)
  Gr_sym <- rlang::enquo(Group)
  Fc_sym <- rlang::enquo(facet_by)
  
  # 1. NAの除外 (Y軸の値が存在しない行は除外)
  df <- df |> dplyr::filter(!is.na(!!y_sym))
  
  # 2. GroupColorsの自動設定
  if (is.null(GroupColors)) {
    # データの存在するグループ名と数を取得し，色を生成
    group_levels <- df |>
      dplyr::pull(!!Gr_sym) |>
      unique() |>
      sort()
    num_groups <- length(group_levels)
    pal <- ggsci::pal_aaas()(num_groups)
    # scale_manual の values に渡す
    GroupColors <- setNames(pal, group_levels)
  }
  
  # a_seed <- 155 # 固定値にすることで再現性を確保
  mypd = position_jitterdodge(dodge.width = 0.70, 
                              jitter.width = 0.50,
                              jitter.height = 0)
  # Y軸リミットの計算
  y_max <- max(df[[rlang::as_name(y_sym)]], na.rm = TRUE)
  
  # 3. plots
  plt <-
    df |>
    ggplot(aes(x = !!x_sym, y = !!y_sym, color = !!Gr_sym, fill = !!Gr_sym)) +
    # barplot
    stat_summary(aes(fill = !!Gr_sym),
                 fun = "mean", geom = "bar",
                 width = .6, linewidth = 0,
                 position = position_dodge(width = 0.8),
                 alpha = 0.7) +
    scale_fill_manual(values = GroupColors) + 
    # Errorbar (平均 ± SD)
    stat_summary(fun.data = "mean_sdl",
                 fun.args = list(mult = 1),
                 geom = 'errorbar',
                 aes(color = !!Gr_sym),
                 width = .3, linewidth = 1.0,
                 position = position_dodge(width = 0.8)) +
    # Dotplot
    geom_point(data = df,
               aes(x = !!x_sym, y = !!y_sym, color = !!Gr_sym), 
               size = 6 , shape = 16, position = mypd) + 
    scale_color_manual(values = GroupColors) + 
    scale_y_continuous(expand=c(0,0),
                       limits = c(0, y_max * 1.2)) + 
    # label & Theme
    labs(title = GraphTitle, x="", y = ylab) +
    theme_classic() +
    theme(
      legend.position = if (rlang::quo_is_null(Fc_sym)) 'none' else 'right',
      # facet時は凡例を出す
      axis.title.y = element_text(
        hjust = 0.5, size= 16, colour = "black"),
      axis.text.x = element_text(
        size= 16, vjust = 0.5, colour = "black"),
      axis.text.y = element_text(size= 16, colour = "black"),
      axis.line = element_line(colour = "black", linewidth=0.5),
      axis.ticks = element_line(colour = "black", linewidth=0.5),
      axis.ticks.length = unit(1, "mm"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      text = element_text(size = 16),
      aspect.ratio = if (rlang::quo_is_null(Fc_sym)) 1.5 else NULL,
      plot.title = element_text(hjust = 0.5)
    )
  
  # facet_by が指定されている場合のみ実行
  if (!quo_is_null(Fc_sym)) {
    plt <- plt + facet_wrap(vars(!!Fc_sym), scales = "free_y")
  }
  
  return(plt)
  
} # end function ---

