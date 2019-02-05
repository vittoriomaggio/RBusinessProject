library(feedeR)
news_psx <- feed.extract("http://articlefeeds.nasdaq.com/nasdaq/symbols?symbol=PSX")
news_psx_title <- news_psx$items$title
news_psx_date <- news_psx$items$date
news_psx_link <- news_psx$items$link
