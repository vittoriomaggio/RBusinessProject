fluidPage(
  fluidRow(h2("WFC - Wells Fargo")),
  fluidRow( valueBoxOutput("mean_wfc", width = 4), 
            valueBoxOutput("var_wfc", width = 4),
            valueBoxOutput("sd_wfc", width = 4)
  ),
  box(title = "Descriptive Analytics" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(h3("Returns"), HTML("<hr>")),
      fluidRow( class = "my_row1",
                column(8,  dygraphOutput("cc_return_wfc") ), 
                column(4, plotOutput("hist_wfc", click = "plot_click" ))
      ), 
      fluidRow( class = "my_row2",
                column(8, tabBox(
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", width = "100%", height = "100%",
                  tabPanel("Boxplot",  plotOutput("boxplot_wfc"), width="100%"),
                  tabPanel("Qqplot",  plotOutput("qqplot_wfc")),
                  tabPanel("Quartile", plotOutput("quartile_wfc")),
                  tabPanel("Beta", dygraphOutput("beta_wfc"), "* Beta is computed respect SP500 index")
                ) ),
                column(4,
                       fluidRow(  column(12, infoBoxOutput("sk_wfc")) ),
                       fluidRow( column(12, infoBoxOutput("ku_wfc")) )
                )
      )
  ),
  # Forecasting box
  box(title = "Forecasting" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      column(12,  plotOutput("forecast_wfc") )
  ),
  
  #News box
  box(title = "News" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(infoBoxOutput("news1_wfc")),
      fluidRow(infoBoxOutput("news2_wfc")),
      fluidRow(infoBoxOutput("news3_wfc")),
      fluidRow(infoBoxOutput("news4_wfc")),
      fluidRow(infoBoxOutput("news5_wfc"))
  )
  
)

