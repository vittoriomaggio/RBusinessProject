fluidPage(
  h2("Portfolio"),
  fluidRow( valueBoxOutput("mean_portfolio", width = 4), 
            valueBoxOutput("var_portfolio", width = 4),
            valueBoxOutput("sd_portfolio", width = 4)
  ),
    box(title = "Portfolio Return", collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
        dygraphOutput("porfolio_returns")
        ),
    box(title = "Mean-variance analysis" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
        column(6, 
        plotOutput("effFrontier")
        ),
        column(6, 
               plotOutput("mvpweights")
        )
    )

)
