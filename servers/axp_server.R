output$mean_axp <- renderValueBox({
  valueBox( value = percent(mean_axp), subtitle = "Mean", icon = icon("chart-line"), color = "blue")   
})
output$var_axp <- renderValueBox({
  valueBox( value = percent(var_axp), subtitle = "Variance", icon = icon("chart-area"), color = "blue")   
})
output$sd_axp <- renderValueBox({
  valueBox( value = percent(sd_axp), subtitle = "Standard Devation", icon = icon("chart-bar"), color = "blue")   
})

output$cc_return_axp <- renderDygraph({ dygraph(stocks_cc_rtn$AXP )%>%
    dyRangeSelector()  })

output$hist_axp <- renderPlot({ 
  hist(stocks_cc_rtn$AXP, freq = FALSE, main="Distribution of CC Return about AXP stock",  breaks = 15)
  points(AXP_density, type="l", col="blue")
})

output$boxplot_axp<- renderPlot({ 
  chart.Boxplot(stocks_cc_rtn$AXP, voutlier.symbol = "O", main = "AXP CC Return")
})

output$qqplot_axp <- renderPlot({ 
  qqnorm(stocks_cc_rtn$AXP, main="AXP", col="blue")
  qqline(stocks_cc_rtn$AXP)
})

output$quartile_axp <- renderPlot({ 
  hist(stocks_cc_rtn$AXP, breaks =30, probability = TRUE, main = "Quartili AXP", xlab = "Returns")
  q = quantile(stocks_cc_rtn$AXP)
  abline(v=q[1], col="red", lwd=2) # 0% (min)
  abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
  abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
  abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
  abline(v=q[5], col="red", lwd=2) # 100% (max)
})

output$beta_axp <- renderDygraph({ dygraph(AXP_betas.xts)%>%
    dyRangeSelector()  })

#Skewness, Kutorisis InfoBox
output$sk_axp  <- renderInfoBox({
  infoBox( value = round(sk_axp, digits = 3), title = "Skewness", icon = icon("chart-area"), color = "blue", fill=TRUE )   
})

output$ku_axp  <- renderInfoBox({
  infoBox( value = round(ku_axp, digits = 3), title = "Kurtosis", icon = icon("chart-bar"), color = "blue", fill=TRUE)   
})

#News InfoBox
output$news1_axp<-  renderInfoBox({ 
  infoBox(value = news_axp_title[1], title = news_axp_date[1], news_axp_link[1],  icon = icon("newspaper"), color = "red") 
})
output$news2_axp<-  renderInfoBox({ 
  infoBox(value = news_axp_title[2], title = news_axp_date[2], news_axp_link[2],  icon = icon("newspaper"), color = "red") 
})
output$news3_axp<-  renderInfoBox({ 
  infoBox(value = news_axp_title[3], title = news_axp_date[3], news_axp_link[3],  icon = icon("newspaper"), color = "red") 
})
output$news4_axp<-  renderInfoBox({ 
  infoBox(value = news_axp_title[4], title = news_axp_date[4], news_axp_link[4],  icon = icon("newspaper"), color = "red") 
})
output$news5_axp<-  renderInfoBox({ 
  infoBox(value = news_axp_title[5], title = news_axp_date[5], news_axp_link[5],  icon = icon("newspaper"), color = "red") 
})

#Forecasting plot
output$forecast_axp <- renderPlot({ plot(arima.forecast_axp, main = "ARIMA forecasts for AXP returns") })
