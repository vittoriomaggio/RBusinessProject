library(feedeR)
news_khc <- feed.extract("http://articlefeeds.nasdaq.com/nasdaq/symbols?symbol=KHC")
news_khc_title <- news_khc$items$title
news_khc_date <- news_khc$items$date
news_khc_link <- news_khc$items$link
