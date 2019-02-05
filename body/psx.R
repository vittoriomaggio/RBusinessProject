fluidPage(
  fluidRow(h2("PSX - Phillips 66")),
  fluidRow( valueBoxOutput("mean_psx", width = 4), 
          valueBoxOutput("var_psx", width = 4),
          valueBoxOutput("sd_psx", width = 4)
         ),
  box(title = "Descriptive Analytics" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(h3("Returns"), HTML("<hr>")),
      fluidRow( class = "my_row1",
        column(8,  dygraphOutput("cc_return_psx") ), 
        column(4, plotOutput("hist_psx", click = "plot_click" ))
      ), 
      fluidRow( class = "my_row2",
        column(8, tabBox(
          # The id lets us use input$tabset1 on the server to find the current tab
          id = "tabset1", width = "100%", height = "100%",
          tabPanel("Boxplot",  plotOutput("boxplot_psx"), width="100%"),
          tabPanel("Qqplot",  plotOutput("qqplot_psx")),
          tabPanel("Quartile", plotOutput("quartile_psx")),
          tabPanel("Beta", dygraphOutput("beta_psx"), print("* Beta is computed respect SP500 index"))
          ) ),
        column(4,
              fluidRow(  column(12, infoBoxOutput("sk_psx")) ),
               fluidRow( column(12, infoBoxOutput("ku_psx")) )
          )
      )
  ),
  # Forecasting box
  box(title = "Forecasting" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      column(12,  plotOutput("forecast_psx") )
  ),
  
  #News box
  box(title = "News" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(infoBoxOutput("news1_psx")),
      fluidRow(infoBoxOutput("news2_psx")),
      fluidRow(infoBoxOutput("news3_psx")),
      fluidRow(infoBoxOutput("news4_psx")),
      fluidRow(infoBoxOutput("news5_psx"))
  )
    
)

