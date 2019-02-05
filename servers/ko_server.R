output$mean_ko <- renderValueBox({
  valueBox( value = percent(mean_ko), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_ko <- renderValueBox({
  valueBox( value = percent(var_ko), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_ko <- renderValueBox({
  valueBox( value = percent(sd_ko), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$cc_return_ko <- renderDygraph({ dygraph(stocks_cc_rtn$KO )%>%
    dyRangeSelector()  })

output$hist_ko <- renderPlot({ 
  hist(stocks_cc_rtn$KO, freq = FALSE, main="Distribution of CC Return about KO stock",  breaks = 15)
  points(KO_density, type="l", col="blue")
})

output$boxplot_ko<- renderPlot({ 
  chart.Boxplot(stocks_cc_rtn$KO, voutlier.symbol = "O", main = "KO CC Return")
})

output$qqplot_ko <- renderPlot({ 
  qqnorm(stocks_cc_rtn$KO, main="KO", col="blue")
  qqline(stocks_cc_rtn$KO)
})

output$quartile_ko <- renderPlot({ 
  hist(stocks_cc_rtn$KO, breaks =30, probability = TRUE, main = "Quartili KO", xlab = "Returns")
  q = quantile(stocks_cc_rtn$KO)
  abline(v=q[1], col="red", lwd=2) # 0% (min)
  abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
  abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
  abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
  abline(v=q[5], col="red", lwd=2) # 100% (max)
})

output$beta_ko <- renderDygraph({ dygraph(KO_betas.xts)%>%
    dyRangeSelector()  })

#Skewness, Kutorisis InfoBox
output$sk_ko  <- renderInfoBox({
  infoBox( value = round(sk_ko, digits = 3), title = "Skewness", icon = icon("chart-area"), color = "blue", fill=TRUE )   
})

output$ku_ko  <- renderInfoBox({
  infoBox( value = round(ku_ko, digits = 3), title = "Kurtosis", icon = icon("chart-bar"), color = "blue", fill=TRUE)   
})

#News InfoBox
output$news1_ko<-  renderInfoBox({ 
  infoBox(value = news_ko_title[1], title = news_ko_date[1], news_ko_link[1],  icon = icon("newspaper"), color = "red") 
})
output$news2_ko<-  renderInfoBox({ 
  infoBox(value = news_ko_title[2], title = news_ko_date[2], news_ko_link[2],  icon = icon("newspaper"), color = "red") 
})
output$news3_ko<-  renderInfoBox({ 
  infoBox(value = news_ko_title[3], title = news_ko_date[3], news_ko_link[3],  icon = icon("newspaper"), color = "red") 
})
output$news4_ko<-  renderInfoBox({ 
  infoBox(value = news_ko_title[4], title = news_ko_date[4], news_ko_link[4],  icon = icon("newspaper"), color = "red") 
})
output$news5_ko<-  renderInfoBox({ 
  infoBox(value = news_ko_title[5], title = news_ko_date[5], news_ko_link[5],  icon = icon("newspaper"), color = "red") 
})

#Forecasting plot
output$forecast_ko <- renderPlot({ plot(arima.forecast_ko, main = "ARIMA forecasts for KO returns") })
