library(pheatmap)


# https://zenn.dev/rchiji/articles/c043f8df9b4aaf


## Example
## 項目内でどのサンプルが平均より離れているのかを見やすくするには、scaleオプションが有用。
pheatmap(demo, show_rownames = F, scale = "column")
