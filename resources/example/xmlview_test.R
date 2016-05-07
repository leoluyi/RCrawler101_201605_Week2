library(xml2)
library(xmlview)
library(magrittr)

## plain text XML
xml_view("<note><to>Dale</to><from>Chip</from><heading>Reminder</heading><body>Baby, don't forget tonight! xxxxx</body></note>")

## read-in XML document
doc <- xml2::read_html("https://www.ptt.cc/bbs/Stock/M.1452818794.A.FEC.html",
                  encoding = "UTF-8")
# xml_view(doc, add_filter = TRUE)

doc_string <- as.character(doc) %>% `Encoding<-`("UTF-8")
xml_view(doc_string, add_filter = TRUE)

read_html("https://www.ptt.cc/bbs/Stock/M.1452818794.A.FEC.html",
                encoding = "UTF-8")


xml_find_all(doc, '//span[@class="f3 push-content"]', ns=xml2::xml_ns(doc))
# doc %>% rvest::html_nodes(xpath = '//span[@class="f3 push-content"]')

doc %>%
  rvest::html_nodes(xpath = '//span[@class="f3 push-content"]') %>%
  rvest::html_text() %>%
  `Encoding<-`("UTF-8") %>%
  gsub("^: ", "",.)
