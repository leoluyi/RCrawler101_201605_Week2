#!/usr/bin/env Rscript
library(rmarkdown)

## === install required packages ===
pkg_list <- c("magrittr", "httr", "rvest", "stringr", "data.table",
              "jsonlite", "RSQLite", "DT", "leaflet")
pkg_new <- pkg_list[!(pkg_list %in% installed.packages()[,"Package"])]
if(length(pkg_new)) install.packages(pkg_new)
rm(pkg_new, pkg_list)

examples <- list.files("resources/example", pattern = ".*\\.R", full.names = TRUE)
for (example in examples) {
    render(example)
}
