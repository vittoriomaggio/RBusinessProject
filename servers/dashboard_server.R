

output$cc_returns <- renderDygraph({ dygraph(stocks_cc_rtn)%>%
    dyRangeSelector()  })

output$scatter_plot <- renderPlot({
  pairs(scatter_plot, pch=18, col="blue", main="scatter plot")
        })

output$box_plot <- renderPlot({
  chart.Boxplot(stocks_cc_rtn, voutlier.symbol = "O", main = "Stocks CC Return")
})
