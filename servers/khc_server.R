output$mean_khc <- renderValueBox({
  valueBox( value = percent(mean_khc), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_khc <- renderValueBox({
  valueBox( value = percent(var_khc), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_khc <- renderValueBox({
  valueBox( value = percent(sd_khc), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$cc_return_khc <- renderDygraph({ dygraph(stocks_cc_rtn$KHC )%>%
    dyRangeSelector()  })

output$hist_khc <- renderPlot({ 
  hist(stocks_cc_rtn$KHC, freq = FALSE, main="Distribution of CC Return about KHC stock",  breaks = 15)
  points(KHC_density, type="l", col="blue")
})

output$boxplot_khc<- renderPlot({ 
  chart.Boxplot(stocks_cc_rtn$KHC, voutlier.symbol = "O", main = "KHC CC Return")
})

output$qqplot_khc <- renderPlot({ 
  qqnorm(stocks_cc_rtn$KHC, main="KHC", col="blue")
  qqline(stocks_cc_rtn$KHC)
})

output$quartile_khc <- renderPlot({ 
  hist(stocks_cc_rtn$KHC, breaks =30, probability = TRUE, main = "Quartili KHC", xlab = "Returns")
  q = quantile(stocks_cc_rtn$KHC)
  abline(v=q[1], col="red", lwd=2) # 0% (min)
  abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
  abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
  abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
  abline(v=q[5], col="red", lwd=2) # 100% (max)
})

output$beta_khc <- renderDygraph({ dygraph(KHC_betas.xts)%>%
    dyRangeSelector()  })

#Skewness, Kutorisis InfoBox
output$sk_khc  <- renderInfoBox({
  infoBox( value = round(sk_khc, digits = 3), title = "Skewness", icon = icon("chart-area"), color = "blue", fill=TRUE )   
})

output$ku_khc  <- renderInfoBox({
  infoBox( value = round(ku_khc, digits = 3), title = "Kurtosis", icon = icon("chart-bar"), color = "blue", fill=TRUE)   
})

#News InfoBox
output$news1_khc<-  renderInfoBox({ 
  infoBox(value = news_khc_title[1], title = news_khc_date[1], news_khc_link[1],  icon = icon("newspaper"), color = "red") 
})
output$news2_khc<-  renderInfoBox({ 
  infoBox(value = news_khc_title[2], title = news_khc_date[2], news_khc_link[2],  icon = icon("newspaper"), color = "red") 
})
output$news3_khc<-  renderInfoBox({ 
  infoBox(value = news_khc_title[3], title = news_khc_date[3], news_khc_link[3],  icon = icon("newspaper"), color = "red") 
})
output$news4_khc<-  renderInfoBox({ 
  infoBox(value = news_khc_title[4], title = news_khc_date[4], news_khc_link[4],  icon = icon("newspaper"), color = "red") 
})
output$news5_khc<-  renderInfoBox({ 
  infoBox(value = news_khc_title[5], title = news_khc_date[5], news_khc_link[5],  icon = icon("newspaper"), color = "red") 
})

#Forecasting plot
output$forecast_khc <- renderPlot({ plot(arima.forecast_khc, main = "ARIMA forecasts for KHC returns") })
