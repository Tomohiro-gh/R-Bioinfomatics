## Ortholog conversion:

#Human to mice

library(nichenetr)

#### 
# nichenetrでconvert_mouse_to_human_symbolsのfunctionの中身を調べると，
convert_mouse_to_human_symbols # This function is build in nichenetr packages
## 中身
##convert_mouse_to_human_symbols <- 
function (symbols, version = 1) 
{
  if (!is.character(symbols)) 
    stop("symbols should be a character vector of mouse gene symbols")
  requireNamespace("dplyr")
  if (version == 1) {
    unambiguous_mouse_genes = geneinfo_human %>% drop_na() %>% 
      group_by(symbol_mouse) %>% count() %>% filter(n < 
                                                      2) %>% .$symbol_mouse
    ambiguous_mouse_genes = geneinfo_human %>% drop_na() %>% 
      group_by(symbol_mouse) %>% count() %>% filter(n >= 
                                                      2) %>% .$symbol_mouse
    geneinfo_ambiguous_solved = geneinfo_human %>% filter(symbol_mouse %in% 
                                                            ambiguous_mouse_genes) %>% filter(symbol == toupper(symbol_mouse))
    geneinfo_human = geneinfo_human %>% filter(symbol_mouse %in% 
                                                 unambiguous_mouse_genes) %>% bind_rows(geneinfo_ambiguous_solved) %>% 
      drop_na()
    mousesymbol2humansymbol = mapper(geneinfo_human, "symbol", 
                                     "symbol_mouse")
    converted_symbols = symbols %>% mousesymbol2humansymbol[.]
  }
  else if (version == 2) {
    unambiguous_mouse_genes = geneinfo_2022 %>% drop_na() %>% 
      group_by(symbol_mouse) %>% count() %>% filter(n < 
                                                      2) %>% .$symbol_mouse
    ambiguous_mouse_genes = geneinfo_2022 %>% drop_na() %>% 
      group_by(symbol_mouse) %>% count() %>% filter(n >= 
                                                      2) %>% .$symbol_mouse
    geneinfo_ambiguous_solved = geneinfo_2022 %>% filter(symbol_mouse %in% 
                                                           ambiguous_mouse_genes) %>% filter(symbol == toupper(symbol_mouse))
    geneinfo_2022 = geneinfo_2022 %>% filter(symbol_mouse %in% 
                                               unambiguous_mouse_genes) %>% bind_rows(geneinfo_ambiguous_solved) %>% 
      drop_na()
    mousesymbol2humansymbol = mapper(geneinfo_2022, "symbol", 
                                     "symbol_mouse")
    converted_symbols = symbols %>% mousesymbol2humansymbol[.]
  }
  return(converted_symbols)
}
#bytecode: 0x2ee2d6eb0>
#  <environment: namespace:nichenetr>
  
  
  
## この中にある　mapperと定義した関数が ortholog変換を実施しているらしい．
## mapperについては下記に詳細に書かれている
# https://rdrr.io/github/browaeysrobin/nichenetr/src/R/supporting_functions.R


# geneinfo_human = load("data/geneinfo_human.rda")
mapper = function(df, value_col, name_col) setNames(df[[value_col]], df[[name_col]])
# entrez2symbol = mapper(geneinfo_human, "symbol_mouse", "entrez_mouse")
# symbol2entrez = mapper(geneinfo_human, "entrez_mouse", "symbol_mouse")
# humanentrez2humansymbol = mapper(geneinfo_human,"symbol","entrez")
# humansymbol2humanentrez = mapper(geneinfo_human, "entrez", "symbol")
# mouseentrez2humansymbol = mapper(geneinfo_human, "symbol","entrez_mouse")
# humanentrez2mousesymbol = mapper(geneinfo_human, "symbol_mouse", "entrez")
# humansymbol2mouseentrez = mapper(geneinfo_human, "entrez_mouse", "symbol")
# mousesymbol2humanentrez = mapper(geneinfo_human,"entrez","symbol_mouse")
# humansymbol2mousesymbol = mapper(geneinfo_human,"symbol_mouse","symbol")
# mousesymbol2humansymbol = mapper(geneinfo_human,"symbol","symbol_mouse")