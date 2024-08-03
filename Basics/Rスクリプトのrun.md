## Rスクリプトをs`ource`関数を用いてrunする

参考：　

[Rのsource関数で呼び出すスクリプトに引数を渡すとき](https://blog.statsbeginner.net/entry/2021/07/08/180414)

アメリエフブログ→ [Rスクリプトの使い方](https://staffblog.amelieff.jp/entry/rscript.usage)


## R source codeを Rで動かす
`commandArgs`でsouce codeへ引数を渡す
```r

subdir = "Analyzed_subdirecotry"
 dir.create(subdir)
  setwd(subdir)

commandArgs <- function(...) {subdir}
source(paste0(wd, "MySourceCodes.R")) #> source codeの実行

```
- 関数内ではうまく動かないっぽい．　引数の渡しがうまくいかない．

------


## Rスクリプトをコマンドラインで動かす
