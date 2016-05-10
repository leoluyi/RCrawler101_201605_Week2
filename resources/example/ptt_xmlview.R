#' ---
#' title: "xmlview (PTT data)"
#' author: "Agilelearning, Leo Lu"
#' date: "`r Sys.Date()`"
#' output:
#'   html_document:
#'     toc: yes
#' ---

library(httr)
library(rvest)
library(xmlview)

#' plain text XML
# xml_view("<note><to>Dale</to><from>Chip</from><heading>Reminder</heading><body>Baby, don't forget tonight! xxxxx</body></note>")

#' read-in XML document
doc <- GET("https://www.ptt.cc/bbs/Stock/M.1452818794.A.FEC.html") %>%
  content(as = "text", encoding = "UTF-8") %>%
  `Encoding<-`("UTF-8") %>%
  read_html()

#' View data with `xml_view()`
# xml_view(doc, add_filter = TRUE)

# xml_find_all(doc, '//span[@class="f3 push-content"]', ns=xml2::xml_ns(doc))
doc %>% html_nodes(xpath = '//span[@class="f3 push-content"]')

doc %>%
  html_nodes(xpath = '//span[@class="f3 push-content"]') %>%
  html_text() %>%
  `Encoding<-`("UTF-8") %>%
  gsub("^: ", "",.)
