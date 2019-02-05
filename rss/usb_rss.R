library(feedeR)
news_usb <- feed.extract("http://articlefeeds.nasdaq.com/nasdaq/symbols?symbol=USB")
news_usb_title <- news_usb$items$title
news_usb_date <- news_usb$items$date
news_usb_link <- news_usb$items$link
