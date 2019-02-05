library(tseries)
library(zoo)
library(forecast)

#Prices
PSX.z <- get.hist.quote(instrument="PSX", start="2014-01-01", quote="AdjClose", 
                       provider="yahoo", end = "2019-01-01", compression="month")
index(PSX.z) <- as.yearmon(index(PSX.z))

colnames(PSX.z) <- "PSX"
PSX.z <- aggregate(PSX.z, index(PSX.z), tail, 1) # to manage duplicate index
index(PSX.z) <- as.yearmon(index(PSX.z))

# CC Returns
returns <- diff( log(PSX.z[,1]) )
plot(returns,xlab="Dates", 
     ylab="CC Return", type="l",
     main="CC Return for PSX Stock")

#Seasonal Decomposition
fitRet <- stl(returns[,1], s.window="period")
plot(fitRet, main=paste("Seasonal Decomposition of PSX CC Returns Time Series"))


period <- returns[1:40]
returns_train <- period[1:20]
returns_test <- period[21:40]
benchmark <- returns[40:50]

source("./data/forecasting/arima_model.R")
best_model <- arima_model(returns_train, returns_test)

# Arima on train set
data <- arima(returns_train, order = best_model)
arima.predictions <- predict(data, n.ahead = 30)

# creo plot 
upper <- arima.predictions$pred + arima.predictions$se 
lower <- arima.predictions$pred - arima.predictions$se
new_data <- rbind(returns_train, arima.predictions$pred)
plot(returns, xlab="Year", ylab="CC Return", main="Predictions of CC Return PSX using ARIMA model")


polygon(c(index(upper), rev(index(upper))), 
        c(upper, rev(lower)), col="lightblue", border=NA) 
lines(lower, col='green')
lines(upper, col='green')
lines(arima.predictions$pred,col='red')
lines(returns)

# forecast 

data <- arima(period, order = best_model)
arima.forecast <- forecast(data, h = 24,level = c(95,80))
plot(arima.forecast, main = "ARIMA forecasts for PSX returns")


