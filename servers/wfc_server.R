output$mean_wfc <- renderValueBox({
  valueBox( value = percent(mean_wfc), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_wfc <- renderValueBox({
  valueBox( value = percent(var_wfc), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_wfc <- renderValueBox({
  valueBox( value = percent(sd_wfc), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$cc_return_wfc <- renderDygraph({ dygraph(stocks_cc_rtn$WFC )%>%
    dyRangeSelector()  })

output$hist_wfc <- renderPlot({ 
  hist(stocks_cc_rtn$WFC, freq = FALSE, main="Distribution of CC Return about WFC stock",  breaks = 15)
  points(WFC_density, type="l", col="blue")
})

output$boxplot_wfc<- renderPlot({ 
  chart.Boxplot(stocks_cc_rtn$WFC, voutlier.symbol = "O", main = "WFC CC Return")
})

output$qqplot_wfc <- renderPlot({ 
  qqnorm(stocks_cc_rtn$WFC, main="WFC", col="blue")
  qqline(stocks_cc_rtn$WFC)
})

output$quartile_wfc <- renderPlot({ 
  hist(stocks_cc_rtn$WFC, breaks =30, probability = TRUE, main = "Quartili WFC", xlab = "Returns")
  q = quantile(stocks_cc_rtn$WFC)
  abline(v=q[1], col="red", lwd=2) # 0% (min)
  abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
  abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
  abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
  abline(v=q[5], col="red", lwd=2) # 100% (max)
})

output$beta_wfc <- renderDygraph({ dygraph(WFC_betas.xts)%>%
    dyRangeSelector()  })

#Skewness, Kutorisis InfoBox
output$sk_wfc  <- renderInfoBox({
  infoBox( value = round(sk_wfc, digits = 3), title = "Skewness", icon = icon("chart-area"), color = "blue", fill=TRUE )   
})

output$ku_wfc  <- renderInfoBox({
  infoBox( value = round(ku_wfc, digits = 3), title = "Kurtosis", icon = icon("chart-bar"), color = "blue", fill=TRUE)   
})

#News InfoBox
output$news1_wfc<-  renderInfoBox({ 
  infoBox(value = news_wfc_title[1], title = news_wfc_date[1], news_wfc_link[1],  icon = icon("newspaper"), color = "red") 
})
output$news2_wfc<-  renderInfoBox({ 
  infoBox(value = news_wfc_title[2], title = news_wfc_date[2], news_wfc_link[2],  icon = icon("newspaper"), color = "red") 
})
output$news3_wfc<-  renderInfoBox({ 
  infoBox(value = news_wfc_title[3], title = news_wfc_date[3], news_wfc_link[3],  icon = icon("newspaper"), color = "red") 
})
output$news4_wfc<-  renderInfoBox({ 
  infoBox(value = news_wfc_title[4], title = news_wfc_date[4], news_wfc_link[4],  icon = icon("newspaper"), color = "red") 
})
output$news5_wfc<-  renderInfoBox({ 
  infoBox(value = news_wfc_title[5], title = news_wfc_date[5], news_wfc_link[5],  icon = icon("newspaper"), color = "red") 
})

#Forecasting plot
output$forecast_wfc <- renderPlot({ plot(arima.forecast_wfc, main = "ARIMA forecasts for WFC returns") })
