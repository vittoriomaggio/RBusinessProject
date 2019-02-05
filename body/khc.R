fluidPage(
  fluidRow(h2("KHC - Kraft Heinz Company")),
  fluidRow( valueBoxOutput("mean_khc", width = 4), 
            valueBoxOutput("var_khc", width = 4),
            valueBoxOutput("sd_khc", width = 4)
  ),
  box(title = "Descriptive Analytics" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(h3("Returns"), HTML("<hr>")),
      fluidRow( class = "my_row1",
                column(8,  dygraphOutput("cc_return_khc") ), 
                column(4, plotOutput("hist_khc", click = "plot_click" ))
      ), 
      fluidRow( class = "my_row2",
                column(8, tabBox(
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", width = "100%", height = "100%",
                  tabPanel("Boxplot",  plotOutput("boxplot_khc"), width="100%"),
                  tabPanel("Qqplot",  plotOutput("qqplot_khc")),
                  tabPanel("Quartile", plotOutput("quartile_khc")),
                  tabPanel("Beta", dygraphOutput("beta_khc"), "* Beta is computed respect SP500 index")
                ) ),
                column(4,
                       fluidRow(  column(12, infoBoxOutput("sk_khc")) ),
                       fluidRow( column(12, infoBoxOutput("ku_khc")) )
                )
      )
  ),
  # Forecasting box
  box(title = "Forecasting" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      column(12,  plotOutput("forecast_khc") )
  ),
  
  #News box
  box(title = "News" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(infoBoxOutput("news1_khc")),
      fluidRow(infoBoxOutput("news2_khc")),
      fluidRow(infoBoxOutput("news3_khc")),
      fluidRow(infoBoxOutput("news4_khc")),
      fluidRow(infoBoxOutput("news5_khc"))
  )
  
)

