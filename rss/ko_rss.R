library(feedeR)
news_ko <- feed.extract("http://articlefeeds.nasdaq.com/nasdaq/symbols?symbol=KO")
news_ko_title <- news_ko$items$title
news_ko_date <- news_ko$items$date
news_ko_link <- news_ko$items$link
