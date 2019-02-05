library(tseries)
library(zoo)
library(forecast)

#Prices
KO.z <- get.hist.quote(instrument="KO", start="2009-01-01", quote="AdjClose", 
                        provider="yahoo", end = "2019-01-01", compression="month")
index(KO.z) <- as.yearmon(index(KO.z))

colnames(KO.z) <- "KO"
KO.z <- aggregate(KO.z, index(KO.z), tail, 1) # to manage duplicate index
index(KO.z) <- as.yearmon(index(KO.z))

# CC Returns
returns <- diff( log(KO.z[,1]) )
plot(returns,xlab="Dates", 
     ylab="CC Return", type="l",
     main="CC Return for KO Stock")

#Seasonal Decomposition
fitRet <- stl(returns[,1], s.window="period")
plot(fitRet, main=paste("Seasonal Decomposition of KO CC Returns Time Series"))

period <- returns[1:110]
returns_train <- period[1:90]
returns_test <- period[91:110]
benchmark <- returns[111:120]

source("./data/forecasting/arima_model.R")
best_model <- arima_model(returns_train, returns_test)

# Arima on train set
data <- arima(returns_train, order = best_model)
arima.predictions <- predict(data, n.ahead = 30)

# creo plot 
upper <- arima.predictions$pred + arima.predictions$se 
lower <- arima.predictions$pred - arima.predictions$se
new_data <- rbind(returns_train, arima.predictions$pred)
plot(new_data, xlab="Year", ylab="CC Return", main="Predictions of CC Return KO using ARIMA model")


polygon(c(index(upper), rev(index(upper))), 
        c(upper, rev(lower)), col="lightblue", border=NA) 
lines(lower, col='green')
lines(upper, col='green')
lines(arima.predictions$pred,col='red')
lines(returns_test)

# forecast 
data <- arima(period, order = best_model)
arima.forecast_ko <- forecast(data, h = 24,level = c(95,80))
plot(arima.forecast_ko, main = "ARIMA forecasts for KO returns")

