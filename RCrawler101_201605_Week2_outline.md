---
title: "RCrawler101_201605"
subtitle: "Week2"
output: 
  html_document: 
    theme: united
    toc: yes
---


## 學習目標

1. 複習 Week1 內容能熟悉並應用觀察技巧找到資料
2. 瞭解如何在R上面使用GET和POST的連線方式
3. 學習各種Parsing技巧及資料儲存
4. 介紹基本觀念，以案例重複練習來學習


## 內容大綱

1. 複習觀察技巧

2. 爬蟲設計的流程

3. Parsing技巧
    + XPath & CSS
    + json
    + xml
    + html table
    + regex
 
4. Save Results


--------------------------------------------------------------

## Chrome 套件
+ [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=zh-TW)
+ [XPath Helper](https://chrome.google.com/webstore/detail/xpath-helper/hgimnogjllphhhkhlmebbmlgjoejdpjl?hl=zh-TW)
+ [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)


## 複習觀察技巧及 HTTP request
+ URL, Method, GET, POST, Headers, Body
+ Excample: PTT Gossiping


## R Basic (quick recap) (5 min)

+ 設定工作目錄
+ RStudio Hot Key
    - CTRL+SHIFT+ENTER
    - CTRL+ENTER
+ Recap Basic R
    - How to get help: `?`, `??`, google, how to read manuel, Forum
    - Basic Data Structure: `vector`, `list`，`apply` series, `unlist`
    - `do.call`, `data.table::rbindlist`
    - Function in R: Iteration, `tryCatch`
    - magrittr

## 爬蟲設計流程 (10 min)
+ Yahoo Stock


-----------------------------------------------------------

## Crawler’s toolkits in R
+ rvest: a web scraper based on httr and xml2
+ httr: toolkit of HTTP methods in R
+ XML: XML parser
+ xml2: xml parser based on libxml2
+ RCurl: a wrapper of libcurl

## HTML 簡介

[html basic](http://www.w3schools.com/html/html_basic.asp)

tags, attributes, text


## Connector

### R 套件簡介
+ `httr`
+ `rvest`
+ `XML`
+ `xmlview`

+ Create HTML document
    - `read_html`: `{xml_document}` class in `rvest`
    - `htmlParse`: `{HTMLInternalDocument}` class in `XML`

+ Extract nodes with XPath & CSS (`rvest::html_nodes`)
    - 一個例子學會 XPath & CSS: [擷取PTT推文](https://github.com/datasci-info/RC101-TAITRA/blob/master/Lecture3/extract_ptt_push.R)

+ Extract tags (`html_text`, `html_name`, `html_attr`, `html_table`(有雷))


### GET method
+ PTT Gossiping (with and without cookie)


### POST method
+ GuestBook


### Secret of URL
+ Concatenate strings / String formatting
    - `URLEncode`, `URLdecode`
    - `sprintf`, `paste`, `whisker.render`

+ manipulate url template
    - 東森房屋 (URLencode: GET query string)
    - Yahoo News (中文網址)
    - Yahoo Stocks (網址數字的祕密)


### Connection with cookie
+ PTT 八卦板

## Parsing 技巧
### Useful R functions
+ `do.call` + `rbind`
+ `data.table::rbindlist`



### 結構化資料
+ html table: 公開資訊觀測站 (`rvest::html_table`, `XML::readHtmlTable`)
+ json, jsonp: PChome, 紫外線即時監測資料
+ xml: 7-11 (`XML::xmlToDataFrame`)

### 非結構化資料
+ RegEx: 7-11 的 citycode (areacode.js)


## Save Results
+ `download.file`
+ `writeBin`
+ `write.csv`
+ `SQLite`

----------------------------------------------------------------

## Case study 綜合演練

+ 氣象局觀測資料：典型的用CSS/Xpath 找 table 範例


