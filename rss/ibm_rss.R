library(feedeR)
news_ibm <- feed.extract("http://articlefeeds.nasdaq.com/nasdaq/symbols?symbol=IBM")
news_ibm_title <- news_ibm$items$title
news_ibm_date <- news_ibm$items$date
news_ibm_link <- news_ibm$items$link
