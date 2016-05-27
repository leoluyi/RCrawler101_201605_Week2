#!/usr/bin/env Rscript
library(rmarkdown)

## === install required packages ===
pkg_list <- c("magrittr", "httr", "rvest", "stringr", "data.table",
              "jsonlite", "RSQLite", "DT", "leaflet","xmlview",
              "devtools")
pkg_new <- pkg_list[!(pkg_list %in% installed.packages()[,"Package"])]
if(length(pkg_new)) install.packages(pkg_new)
if("xmlview" %in% pkg_new) devtools::install_github("hrbrmstr/xmlview")
rm(pkg_new, pkg_list)


## render all examples
examples <- list.files("resources/example", pattern = ".*\\.R", full.names = TRUE)
for (example in examples) {
    render(example)
}


## render install_R.rmd
render("install_R.Rmd")
