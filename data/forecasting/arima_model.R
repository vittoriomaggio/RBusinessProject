arima_model <- function(train_set, test_set) {
  optimum_params <- c(0,0,0)
  min_RMSE <- 1
 
  for (p in 0:5){
    for (d in 0:1){
      for(q in 0:5){
        fit <- arima(train_set, order = c(p, d, q), method = "ML")
        arma.predictions <- predict(fit, n.ahead = length(test_set))$pred
        RMSE <- accuracy(arma.predictions, test_set)[2]
        if (RMSE < min_RMSE) {
          min_RMSE <- RMSE
          optimum_params <- c(p, d, q)
        }
      }
    }
  }

  return(optimum_params)
}