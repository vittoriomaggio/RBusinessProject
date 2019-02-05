fluidPage(
  fluidRow(h2("IBM - International Business Machines Corporation")),
  fluidRow( valueBoxOutput("mean_ibm", width = 4), 
            valueBoxOutput("var_ibm", width = 4),
            valueBoxOutput("sd_ibm", width = 4)
  ),
  box(title = "Descriptive Analytics" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(h3("Returns"), HTML("<hr>")),
      fluidRow( class = "my_row1",
                column(8,  dygraphOutput("cc_return_ibm") ), 
                column(4, plotOutput("hist_ibm", click = "plot_click" ))
      ), 
      fluidRow( class = "my_row2",
                column(8, tabBox(
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", width = "100%", height = "100%",
                  tabPanel("Boxplot",  plotOutput("boxplot_ibm"), width="100%"),
                  tabPanel("Qqplot",  plotOutput("qqplot_ibm")),
                  tabPanel("Quartile", plotOutput("quartile_ibm")),
                  tabPanel("Beta", dygraphOutput("beta_ibm"), "* Beta is computed respect SP500 index")
                ) ),
                column(4,
                       fluidRow(  column(12, infoBoxOutput("sk_ibm")) ),
                       fluidRow( column(12, infoBoxOutput("ku_ibm")) )
                )
      )
  ),
  # Forecasting box
  box(title = "Forecasting" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      column(12,  plotOutput("forecast_ibm") )
  ),
  
  #News box
  box(title = "News" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(infoBoxOutput("news1_ibm")),
      fluidRow(infoBoxOutput("news2_ibm")),
      fluidRow(infoBoxOutput("news3_ibm")),
      fluidRow(infoBoxOutput("news4_ibm")),
      fluidRow(infoBoxOutput("news5_ibm"))
  )
  
)


