fluidPage(
  fluidRow(
    valueBox("PSX", "Phillips 66", icon = icon("bolt"), color = "yellow"),
    valueBox("AXP", "American Express", icon = icon("credit-card")),
    valueBox("KO", "Coca-Cola Company", icon = icon("utensils"), color = "red"),
    valueBox("KHC", "Kraft Heinz Company", icon = icon("utensils"), color = "red"),
    valueBox("WFC", "Wells Fargo", icon = icon("piggy-bank "), color = "green"),
    valueBox("USB", "U.S. Bancorp", icon = icon("piggy-bank "), color = "green"),
    valueBox("IBM", "International Business Machines Corporation", icon = icon("laptop"), color = "blue")
  ),
    box(title = "Returns" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
        dygraphOutput("cc_returns")
    ),
  
    box(title = "Box Plot" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
        plotOutput("box_plot", height = '600px')
    ),
    box(title = "Scatter Plot" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
        plotOutput("scatter_plot", height = '600px')
    )
)
