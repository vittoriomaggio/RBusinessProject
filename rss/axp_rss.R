library(feedeR)
news_axp <- feed.extract("http://articlefeeds.nasdaq.com/nasdaq/symbols?symbol=AXP")
news_axp_title <- news_axp$items$title
news_axp_date <- news_axp$items$date
news_axp_link <- news_axp$items$link
