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
library(data.table)
library(DT)


#' ## Connector
Target_URL = "http://tw.stock.yahoo.com/d/s/major_2451.html"
res = GET(Target_URL)


# check content-type
headers(res)$`content-type`
doc_str = content(res, as = "text", encoding = "Big5")

#' ## Parser

# Solution 1: `httr::html_table()`

if (.Platform$OS.type == "unix"){
  dat = doc_str %>%
    read_html() %>%
    html_nodes(xpath = "//table[1]//table[2]") %>%
    html_table(header=TRUE)
  dat = dat[[1]]
}


# Solution 2: `XML::htmlParse(res_text, encoding = "UTF-8")`

dat2 = doc_str %>%
  read_html(encoding = "UTF-8") %>%
  html_nodes(xpath = "//table[1]//table[2]") %>%
  as.character() %>%
  readHTMLTable(encoding = "UTF-8") %>%
  .[[1]]

head(dat2)

#' ## Data Cleansing

stock_table <- dat2
names(stock_table) <- NULL
stock_table[,c(1, 5)] <- sapply(stock_table[, c(1, 5)], as.character)
stock_table[, c(2:4, 6:8)] <- sapply(stock_table[, c(2:4, 6:8)],
                                     function(x) {
                                       as.integer(as.character(x))
                                     })
names(stock_table)[c(1, 5)] <- "券商"
names(stock_table)[c(2, 6)] <- "買進"
names(stock_table)[c(3, 7)] <- "賣出"
names(stock_table)[c(4, 8)] <- "買賣超"

dt <- rbind(df, stock_table[, 1:4], stock_table[, 5:8])

# dt <- data.table::rbindlist(
#   list(stock_table[, 1:4], stock_table[, 5:8]),
#   use.names = FALSE)

#' ## Result
DT::datatable(dt)


