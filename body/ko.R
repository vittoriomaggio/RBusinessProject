fluidPage(
  fluidRow(h2("KO - The Coca-Cola Company")),
  fluidRow( valueBoxOutput("mean_ko", width = 4), 
            valueBoxOutput("var_ko", width = 4),
            valueBoxOutput("sd_ko", width = 4)
  ),
  box(title = "Descriptive Analytics" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(h3("Returns"), HTML("<hr>")),
      fluidRow( class = "my_row1",
                column(8,  dygraphOutput("cc_return_ko") ), 
                column(4, plotOutput("hist_ko", click = "plot_click" ))
      ), 
      fluidRow( class = "my_row2",
                column(8, tabBox(
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", width = "100%", height = "100%",
                  tabPanel("Boxplot",  plotOutput("boxplot_ko"), width="100%"),
                  tabPanel("Qqplot",  plotOutput("qqplot_ko")),
                  tabPanel("Quartile", plotOutput("quartile_ko")),
                  tabPanel("Beta", dygraphOutput("beta_ko"), "* Beta is computed respect SP500 index")
                ) ),
                column(4,
                       fluidRow(  column(12, infoBoxOutput("sk_ko")) ),
                       fluidRow( column(12, infoBoxOutput("ku_ko")) )
                )
      )
  ),
  # Forecasting box
  box(title = "Forecasting" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      column(12,  plotOutput("forecast_ko") )
  ),
  
  #News box
  box(title = "News" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(infoBoxOutput("news1_ko")),
      fluidRow(infoBoxOutput("news2_ko")),
      fluidRow(infoBoxOutput("news3_ko")),
      fluidRow(infoBoxOutput("news4_ko")),
      fluidRow(infoBoxOutput("news5_ko"))
  )
  
)

