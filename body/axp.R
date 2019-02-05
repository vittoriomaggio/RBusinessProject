fluidPage(
  fluidRow(h2("AXP - American Express")),
  fluidRow( valueBoxOutput("mean_axp", width = 4), 
            valueBoxOutput("var_axp", width = 4),
            valueBoxOutput("sd_axp", width = 4)
  ),
  box(title = "Descriptive Analytics" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(h3("Returns"), HTML("<hr>")),
      fluidRow( class = "my_row1",
                column(8,  dygraphOutput("cc_return_axp") ), 
                column(4, plotOutput("hist_axp", click = "plot_click" ))
      ), 
      fluidRow( class = "my_row2",
                column(8, tabBox(
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", width = "100%", height = "100%",
                  tabPanel("Boxplot",  plotOutput("boxplot_axp"), width="100%"),
                  tabPanel("Qqplot",  plotOutput("qqplot_axp")),
                  tabPanel("Quartile", plotOutput("quartile_axp")),
                  tabPanel("Beta", dygraphOutput("beta_axp"), print("* Beta is computed respect SP500 index"))
                ) ),
                column(4,
                       fluidRow(  column(12, infoBoxOutput("sk_axp")) ),
                       fluidRow( column(12, infoBoxOutput("ku_axp")) )
                )
      )
  ),
  # Forecasting box
  box(title = "Forecasting" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      column(12,  plotOutput("forecast_axp") )
  ),
  
  #News box
  box(title = "News" , collapsible = TRUE, width = "100%", solidHeader = TRUE,  status = "primary",
      fluidRow(infoBoxOutput("news1_axp")),
      fluidRow(infoBoxOutput("news2_axp")),
      fluidRow(infoBoxOutput("news3_axp")),
      fluidRow(infoBoxOutput("news4_axp")),
      fluidRow(infoBoxOutput("news5_axp"))
  )
  
)

