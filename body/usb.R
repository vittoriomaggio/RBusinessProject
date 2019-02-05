fluidPage(
  fluidRow(h2("USB - U.S. Bancorp")),
  fluidRow( valueBoxOutput("mean_usb", width = 4), 
            valueBoxOutput("var_usb", width = 4),
            valueBoxOutput("sd_usb", width = 4)
  ),
  box(title = "Descriptive Analytics" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(h3("Returns"), HTML("<hr>")),
      fluidRow( class = "my_row1",
                column(8,  dygraphOutput("cc_return_usb") ), 
                column(4, plotOutput("hist_usb", click = "plot_click" ))
      ), 
      fluidRow( class = "my_row2",
                column(8, tabBox(
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", width = "100%", height = "100%",
                  tabPanel("Boxplot",  plotOutput("boxplot_usb"), width="100%"),
                  tabPanel("Qqplot",  plotOutput("qqplot_usb")),
                  tabPanel("Quartile", plotOutput("quartile_usb")),
                  tabPanel("Beta", dygraphOutput("beta_usb"), "* Beta is computed respect SP500 index")
                ) ),
                column(4,
                       fluidRow(  column(12, infoBoxOutput("sk_usb")) ),
                       fluidRow( column(12, infoBoxOutput("ku_usb")) )
                )
      )
  ),
  # Forecasting box
  box(title = "Forecasting" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      column(12,  plotOutput("forecast_usb") )
  ),
  
  #News box
  box(title = "News" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(infoBoxOutput("news1_usb")),
      fluidRow(infoBoxOutput("news2_usb")),
      fluidRow(infoBoxOutput("news3_usb")),
      fluidRow(infoBoxOutput("news4_usb")),
      fluidRow(infoBoxOutput("news5_usb"))
  )
  
)


