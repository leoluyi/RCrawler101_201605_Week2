#' ---
#' title: "Yahoo Stock"
#' author: "Agilelearning, Mansun Kuo"
#' date: "`r Sys.Date()`"
#' output:
#'   html_document:
#'     toc: yes
#' ---

#+ include=FALSE
# set root dir when rendering
knitr::opts_knit$set(root.dir = '..')


#' [Yahoo Stock](http://tw.stock.yahoo.com/d/s/major_2451.html)

library(httr)
library(rvest)
library(XML)
library(DT)


#' ## Connector
Target_URL = "http://tw.stock.yahoo.com/d/s/major_2451.html"
res = GET(Target_URL)

#' ## Parser Solution 1: `httr::html_table()`

# check content-type
headers(res)$`content-type`
# read as text (Big5)
doc_str = content(res, as = "text", encoding = "Big5")

## Parser
if (.Platform$OS.type == "unix"){
  dat = doc_str %>%
    read_html() %>%
    html_nodes(xpath = "//table[1]//table[2]") %>%
    html_table(header=TRUE)
  dat = dat[[1]]
}


#' ## Parser Solution 2: XMLXML::htmlParse(res_text, encoding = "UTF-8")

## Parser
dat2 = doc_str %>%
  read_html(encoding = "UTF-8") %>%
  html_nodes(xpath = "//table[1]//table[2]") %>%
  as.character() %>%
  readHTMLTable(encoding = "UTF-8") %>%
  .[[1]]


#' Data Cleansing

stock_table <- tables[[1]]
names(stock_table) <- NULL
stock_table[,1] <- as.character(stock_table[,1])
stock_table[,5] <- as.character(stock_table[,5])

dat <- data.table::rbindlist(list(stock_table[, 1:4], stock_table[, 5:8]), use.names = FALSE)



#' Result
datatable(dat)

