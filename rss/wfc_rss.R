library(feedeR)
news_wfc <- feed.extract("http://articlefeeds.nasdaq.com/nasdaq/symbols?symbol=WFC")
news_wfc_title <- news_wfc$items$title
news_wfc_date <- news_wfc$items$date
news_wfc_link <- news_wfc$items$link
