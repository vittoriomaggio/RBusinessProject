output$mean_ibm <- renderValueBox({
  valueBox( value = percent(mean_ibm), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_ibm <- renderValueBox({
  valueBox( value = percent(var_ibm), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_ibm <- renderValueBox({
  valueBox( value = percent(sd_ibm), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$cc_return_ibm <- renderDygraph({ dygraph(stocks_cc_rtn$IBM )%>%
    dyRangeSelector()  })

output$hist_ibm <- renderPlot({ 
  hist(stocks_cc_rtn$IBM, freq = FALSE, main="Distribution of CC Return about IBM stock",  breaks = 15)
  points(IBM_density, type="l", col="blue")
})

output$boxplot_ibm<- renderPlot({ 
  chart.Boxplot(stocks_cc_rtn$IBM, voutlier.symbol = "O", main = "IBM CC Return")
})

output$qqplot_ibm <- renderPlot({ 
  qqnorm(stocks_cc_rtn$IBM, main="IBM", col="blue")
  qqline(stocks_cc_rtn$IBM)
})

output$quartile_ibm <- renderPlot({ 
  hist(stocks_cc_rtn$IBM, breaks =30, probability = TRUE, main = "Quartili IBM", xlab = "Returns")
  q = quantile(stocks_cc_rtn$IBM)
  abline(v=q[1], col="red", lwd=2) # 0% (min)
  abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
  abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
  abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
  abline(v=q[5], col="red", lwd=2) # 100% (max)
})

output$beta_ibm <- renderDygraph({ dygraph(IBM_betas.xts)%>%
    dyRangeSelector()  })

#Skewness, Kutorisis InfoBox
output$sk_ibm  <- renderInfoBox({
  infoBox( value = round(sk_ibm, digits = 3), title = "Skewness", icon = icon("chart-area"), color = "blue", fill=TRUE )   
})

output$ku_ibm  <- renderInfoBox({
  infoBox( value = round(ku_ibm, digits = 3), title = "Kurtosis", icon = icon("chart-bar"), color = "blue", fill=TRUE)   
})

#News InfoBox
output$news1_ibm<-  renderInfoBox({ 
  infoBox(value = news_ibm_title[1], title = news_ibm_date[1], news_ibm_link[1],  icon = icon("newspaper"), color = "red") 
})
output$news2_ibm<-  renderInfoBox({ 
  infoBox(value = news_ibm_title[2], title = news_ibm_date[2], news_ibm_link[2],  icon = icon("newspaper"), color = "red") 
})
output$news3_ibm<-  renderInfoBox({ 
  infoBox(value = news_ibm_title[3], title = news_ibm_date[3], news_ibm_link[3],  icon = icon("newspaper"), color = "red") 
})
output$news4_ibm<-  renderInfoBox({ 
  infoBox(value = news_ibm_title[4], title = news_ibm_date[4], news_ibm_link[4],  icon = icon("newspaper"), color = "red") 
})
output$news5_ibm<-  renderInfoBox({ 
  infoBox(value = news_ibm_title[5], title = news_ibm_date[5], news_ibm_link[5],  icon = icon("newspaper"), color = "red") 
})

#Forecasting plot
output$forecast_ibm <- renderPlot({ plot(arima.forecast_ibm, main = "ARIMA forecasts for IBM returns") })
