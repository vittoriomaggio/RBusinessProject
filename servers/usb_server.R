output$mean_usb <- renderValueBox({
  valueBox( value = percent(mean_usb), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_usb <- renderValueBox({
  valueBox( value = percent(var_usb), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_usb <- renderValueBox({
  valueBox( value = percent(sd_usb), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$cc_return_usb <- renderDygraph({ dygraph(stocks_cc_rtn$USB )%>%
    dyRangeSelector()  })

output$hist_usb <- renderPlot({ 
  hist(stocks_cc_rtn$USB, freq = FALSE, main="Distribution of CC Return about USB stock",  breaks = 15)
  points(USB_density, type="l", col="blue")
})

output$boxplot_usb<- renderPlot({ 
  chart.Boxplot(stocks_cc_rtn$USB, voutlier.symbol = "O", main = "USB CC Return")
})

output$qqplot_usb <- renderPlot({ 
  qqnorm(stocks_cc_rtn$USB, main="USB", col="blue")
  qqline(stocks_cc_rtn$USB)
})

output$quartile_usb <- renderPlot({ 
  hist(stocks_cc_rtn$USB, breaks =30, probability = TRUE, main = "Quartili USB", xlab = "Returns")
  q = quantile(stocks_cc_rtn$USB)
  abline(v=q[1], col="red", lwd=2) # 0% (min)
  abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
  abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
  abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
  abline(v=q[5], col="red", lwd=2) # 100% (max)
})

output$beta_usb <- renderDygraph({ dygraph(USB_betas.xts)%>%
    dyRangeSelector()  })

#Skewness, Kutorisis InfoBox
output$sk_usb  <- renderInfoBox({
  infoBox( value = round(sk_usb, digits = 3), title = "Skewness", icon = icon("chart-area"), color = "blue", fill=TRUE )   
})

output$ku_usb  <- renderInfoBox({
  infoBox( value = round(ku_usb, digits = 3), title = "Kurtosis", icon = icon("chart-bar"), color = "blue", fill=TRUE)   
})

#News InfoBox
output$news1_usb<-  renderInfoBox({ 
  infoBox(value = news_usb_title[1], title = news_usb_date[1], news_usb_link[1],  icon = icon("newspaper"), color = "red") 
})
output$news2_usb<-  renderInfoBox({ 
  infoBox(value = news_usb_title[2], title = news_usb_date[2], news_usb_link[2],  icon = icon("newspaper"), color = "red") 
})
output$news3_usb<-  renderInfoBox({ 
  infoBox(value = news_usb_title[3], title = news_usb_date[3], news_usb_link[3],  icon = icon("newspaper"), color = "red") 
})
output$news4_usb<-  renderInfoBox({ 
  infoBox(value = news_usb_title[4], title = news_usb_date[4], news_usb_link[4],  icon = icon("newspaper"), color = "red") 
})
output$news5_usb<-  renderInfoBox({ 
  infoBox(value = news_usb_title[5], title = news_usb_date[5], news_usb_link[5],  icon = icon("newspaper"), color = "red") 
})

#Forecasting plot
output$forecast_usb <- renderPlot({ plot(arima.forecast_usb, main = "ARIMA forecasts for USB returns") })
