library(shinydashboard)
library(highcharter)
library(dygraphs)
ui_dash <- dashboardPage(
  dashboardHeader(title = "- 42 -"),
  skin = "black",
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Stocks", tabName = "Stocks", icon = icon("th"),
               menuSubItem("PSX", tabName = "PSX" ),
               menuSubItem("AXP", tabName = "AXP" ),
               menuSubItem("KO", tabName = "KO" ),
               menuSubItem("KHC", tabName = "KHC" ),
               menuSubItem("WFC", tabName = "WFC" ),
               menuSubItem("USB", tabName = "USB" ),
               menuSubItem("IBM", tabName = "IBM" )
               ),
      menuItem("Portfolio", tabName = "portfolio", icon = icon("chart-pie"))
    )
  ),
  
  dashboardBody(
    includeCSS("./css/custom.css"),
    tabItems(
    # Boxes need to be put in a row (or column)
        tabItem(tabName = "dashboard", source("./body/dash_body.R")),
        tabItem(tabName = "PSX", source("./body/psx.R")),
        tabItem(tabName = "AXP", source("./body/axp.R")),
        tabItem(tabName = "KO", source("./body/ko.R")),
        tabItem(tabName = "KHC", source("./body/khc.R")),
        tabItem(tabName = "WFC", source("./body/wfc.R")),
        tabItem(tabName = "USB", source("./body/usb.R")),
        tabItem(tabName = "IBM", source("./body/ibm.R")),
        tabItem(tabName = "portfolio", source("./body/portfolio_body.R"))
    )
  )
)

