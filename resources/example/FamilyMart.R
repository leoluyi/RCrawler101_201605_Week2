#' ---
#' title: "公開資訊觀測站(Market Observation Post System)"
#' author: "Agilelearning, Mansun Kuo "
#' date: "`r Sys.Date()`"
#' output:
#'   html_document:
#'     toc: yes
#' ---

#+ include=FALSE
# set root dir when rendering
knitr::opts_knit$set(root.dir = '..')

#' [PCHome](http://ecshweb.pchome.com.tw/search/v3.3/)


library(httr)
library(jsonlite)

res <- GET("http://api.map.com.tw/net/familyShop.aspx",
          query = list(
            searchType = "ShopList",
            city = "基隆市",
            area = "仁愛區",
            fun = "showStoreList"
          ))

content(res,as="parsed")

sub("[^\\]]*$","",sub("^[^\\[]*","",resStr))
jsonDataString = sub("[^\\]]*$","",sub("^[^\\[]*","",resStr))

jsonData = fromJSON(jsonDataString)
View(data.frame(do.call(rbind,jsonData)))
