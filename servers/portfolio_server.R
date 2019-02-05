output$mean_portfolio <- renderValueBox({
  valueBox( value = percent(mean_portfolio), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_portfolio <- renderValueBox({
  valueBox( value = percent(var_portfolio), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_portfolio <- renderValueBox({
  valueBox( value = percent(sd_portfolio), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$porfolio_returns<- renderDygraph({ dygraph(return_portfolio)%>%
    dyRangeSelector()  })

output$effFrontier<- renderPlot({ plot(effFrontier,c(1,2,3,4)) })

output$mvpweights <- renderPlot({ 
  barplot(mvpweights, main="Minimum Variance Portfolio Weights", xlab="Assset", ylab="Weight In Portfolio (%)", col=cm.colors(ncol(frontierWeights)+2), legend=colnames(weights))
  
        })
