#' ---
#' title: "全家FamilyMart (店舖查詢)"
#' author: "Agilelearning, Mansun Kuo "
#' date: "`r Sys.Date()`"
#' output:
#'   html_document:
#'     toc: yes
#' ---

#+ include=FALSE
# set root dir when rendering
knitr::opts_knit$set(root.dir = '..')

#' [全家FamilyMart (店舖查詢)](http://www.family.com.tw/marketing/inquiry.aspx)


library(httr)
library(jsonlite)

res <- GET("http://api.map.com.tw/net/familyShop.aspx",
           add_headers(
             Referer="http://www.family.com.tw/marketing/inquiry.aspx"
           ),
           query = list(
             searchType = "ShopList",
             type = "",
             city = "基隆市",
             area = "仁愛區",
             road = "",
             fun = "showStoreList",
             key = "6F30E8BF706D653965BDE302661D1241F8BE9EBC"
           ))

resStr <- content(res,as="text")


jsonDataString <- resStr %>%
  sub("^[^\\[]*","",.) %>%
  sub("[^\\]]*$","",.)

jsonData = fromJSON(jsonDataString)
# View(data.frame(do.call(rbind,jsonData)))
