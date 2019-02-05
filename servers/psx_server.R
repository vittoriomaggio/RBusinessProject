
output$mean_psx <- renderValueBox({
  valueBox( value = percent(mean_psx), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_psx <- renderValueBox({
  valueBox( value = percent(var_psx), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_psx <- renderValueBox({
  valueBox( value = percent(sd_psx), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$cc_return_psx <- renderDygraph({ dygraph(stocks_cc_rtn$PSX )%>%
    dyRangeSelector()  })

output$hist_psx <- renderPlot({ 
  hist(stocks_cc_rtn$PSX, freq = FALSE, main="Distribution of CC Return about PSX stock",  breaks = 15)
  points(PSX_density, type="l", col="blue")
})

output$boxplot_psx<- renderPlot({ 
  chart.Boxplot(stocks_cc_rtn$PSX, voutlier.symbol = "O", main = "PSX CC Return")
})

output$qqplot_psx <- renderPlot({ 
  qqnorm(stocks_cc_rtn$PSX, main="PSX", col="blue")
  qqline(stocks_cc_rtn$PSX)
})

output$quartile_psx <- renderPlot({ 
  hist(stocks_cc_rtn$PSX, breaks =30, probability = TRUE, main = "Quartili PSX", xlab = "Returns")
  q = quantile(stocks_cc_rtn$PSX)
  abline(v=q[1], col="red", lwd=2) # 0% (min)
  abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
  abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
  abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
  abline(v=q[5], col="red", lwd=2) # 100% (max)
})

output$beta_psx <- renderDygraph({ dygraph(PSX_betas.xts)%>%
    dyRangeSelector()  })

#Skewness, Kutorisis InfoBox
output$sk_psx  <- renderInfoBox({
  infoBox( value = round(sk_psx, digits = 3), title = "Skewness", icon = icon("chart-area"), color = "blue", fill=TRUE )   
})

output$ku_psx  <- renderInfoBox({
  infoBox( value = round(ku_psx, digits = 3), title = "Kurtosis", icon = icon("chart-bar"), color = "blue", fill=TRUE)   
})

#News InfoBox
output$news1_psx<-  renderInfoBox({ 
  infoBox(value = news_psx_title[1], title = news_psx_date[1], news_psx_link[1],  icon = icon("newspaper"), color = "red") 
})
output$news2_psx<-  renderInfoBox({ 
  infoBox(value = news_psx_title[2], title = news_psx_date[2], news_psx_link[2],  icon = icon("newspaper"), color = "red") 
})
output$news3_psx<-  renderInfoBox({ 
  infoBox(value = news_psx_title[3], title = news_psx_date[3], news_psx_link[3],  icon = icon("newspaper"), color = "red") 
})
output$news4_psx<-  renderInfoBox({ 
  infoBox(value = news_psx_title[4], title = news_psx_date[4], news_psx_link[4],  icon = icon("newspaper"), color = "red") 
})
output$news5_psx<-  renderInfoBox({ 
  infoBox(value = news_psx_title[5], title = news_psx_date[5], news_psx_link[5],  icon = icon("newspaper"), color = "red") 
})

#Forecasting plot
output$forecast_psx <- renderPlot({ plot(arima.forecast, main = "ARIMA forecasts for PSX returns")})