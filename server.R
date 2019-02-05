source("./data/analysis.R")
source("./rss/psx_rss.R")
source("./rss/axp_rss.R")
source("./rss/ko_rss.R")
source("./rss/khc_rss.R")
source("./rss/wfc_rss.R")
source("./rss/usb_rss.R")
source("./rss/ibm_rss.R")
source("./data/beta.R")
source("./data/forecasting/axp_for.R")
source("./data/forecasting/psx_for.R")
source("./data/forecasting/ko_for.R")
source("./data/forecasting/khc_for.R")
source("./data/forecasting/wfc_for.R")
source("./data/forecasting/usb_for.R")
source("./data/forecasting/ibm_for.R")

source("./data/portfolio.R")

library(timeSeries)


server <- shinyServer( function(input, output, session) {
  source("./servers/dashboard_server.R", local = TRUE)
  
  source("./servers/psx_server.R", local = TRUE)
  source("./servers/axp_server.R", local = TRUE)
  source("./servers/ko_server.R", local = TRUE)
  source("./servers/khc_server.R", local = TRUE)
  source("./servers/wfc_server.R", local = TRUE)
  source("./servers/usb_server.R", local = TRUE)
  source("./servers/ibm_server.R", local = TRUE)
  
  source("./servers/portfolio_server.R", local = TRUE)
  
}
)

