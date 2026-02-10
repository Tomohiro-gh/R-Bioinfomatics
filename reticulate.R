## Reticulate
## https://rstudio.github.io/reticulate/articles/calling_python.html

library(reticulate)

os <- import("os")
os$listdir(".")


# 現在使用されているPython環境を確認
reticulate::py_config()

config <- py_config()
config$numpy

#> You can also use the py_discover_config() function to see what version of Python will be used without actually loading Python:
py_discover_config()

## pythonを使えるようにする
use_python("/opt/anaconda3/bin/python")
use_python("/opt/homebrew/bin/python3")

# condaのpythonを使う場合 -> terminalで確認 $conda info -e 
use_condaenv(condaenv = "scvi_3.12", conda = "/opt/anaconda3/bin/conda")
#> errorがでた場合，R studioを再起動する


#> R studioでpythonを起動する場合
repl_python()

#> 今の環境でpythonのパッケージが入っているか？
#> 例えば anndata
reticulate::py_module_available(module = 'anndata')
