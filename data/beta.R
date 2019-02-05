library(quantmod)
library(PerformanceAnalytics)
#Get returns
start_stream <- '2016-01-01'
end_stream = '2019-01-01'
PSX.xts <- getSymbols("PSX", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
PSX.xts <- to.monthly(PSX.xts)
PSX <- na.omit(diff(log(PSX.xts$PSX.xts.Adjusted)))
colnames(PSX) <- c("PSX")

AXP.xts <- getSymbols("AXP", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
AXP.xts <- to.monthly(AXP.xts)
AXP <- na.omit(diff(log(AXP.xts$AXP.xts.Adjusted)))
colnames(AXP) <- c("AXP")

KO.xts <- getSymbols("KO", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
KO.xts <- to.monthly(KO.xts)
KO <- na.omit(diff(log(KO.xts$KO.xts.Adjusted)))
colnames(KO) <- c("KO")

KHC.xts <- getSymbols("KHC", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
KHC.xts <- to.monthly(KHC.xts)
KHC <- na.omit(diff(log(KHC.xts$KHC.xts.Adjusted)))
colnames(KHC) <- c("KHC")

WFC.xts <- getSymbols("WFC", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
WFC.xts <- to.monthly(WFC.xts)
WFC <- na.omit(diff(log(WFC.xts$WFC.xts.Adjusted)))
colnames(WFC) <- c("WFC")

USB.xts <- getSymbols("USB", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
USB.xts <- to.monthly(USB.xts)
USB <- na.omit(diff(log(USB.xts$USB.xts.Adjusted)))
colnames(USB) <- c("USB")

IBM.xts <- getSymbols("IBM", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
IBM.xts <- to.monthly(IBM.xts)
IBM <- na.omit(diff(log(IBM.xts$IBM.xts.Adjusted)))
colnames(IBM) <- c("IBM")
# Market
SP500.xts <- getSymbols("^GSPC", from=start_stream, to=end_stream, src='yahoo', auto.assign = FALSE )
SP500.xts <- to.monthly(SP500.xts)
SP500 <- na.omit(diff(log(SP500.xts$SP500.xts.Adjusted)))
colnames(SP500) <- c("SP500")

# Time series to save beta's values
PSX_betas.xts <- NULL
AXP_betas.xts <- NULL
KO_betas.xts <- NULL
KHC_betas.xts <- NULL
WFC_betas.xts <- NULL
USB_betas.xts <- NULL
IBM_betas.xts <- NULL
delta_t <- 12 # move time windows for beta value
length_period = dim(PSX)[1] # length period for the time series

start <- delta_t+1 # first month after the 20 months to calculate the first value of beta

# Beta function to calculate beta value
beta_function <- function(stock, market_index){
  beta <- cov(stock, market_index)/var(market_index)
  return(beta)
}

#Betas calculation
for (i in start:(length_period + 1)){
 
  beta_val_PSX <- beta_function(PSX[(i-delta_t):(i-1)], SP500[(i-delta_t):(i-1)])
  beta_val_AXP <- beta_function(AXP[(i-delta_t):(i-1)], SP500[(i-delta_t):(i-1)])
  beta_val_KO <- beta_function(KO[(i-delta_t):(i-1)], SP500[(i-delta_t):(i-1)])
  beta_val_KHC <- beta_function(KHC[(i-delta_t):(i-1)], SP500[(i-delta_t):(i-1)])
  beta_val_WFC <- beta_function(WFC[(i-delta_t):(i-1)], SP500[(i-delta_t):(i-1)])
  beta_val_USB <- beta_function(USB[(i-delta_t):(i-1)], SP500[(i-delta_t):(i-1)])
  beta_val_IBM <- beta_function(IBM[(i-delta_t):(i-1)], SP500[(i-delta_t):(i-1)])
 
  beta_xts_PSX <- as.xts(beta_val_PSX, order.by = index(PSX[(i-1)]))
  beta_xts_AXP <- as.xts(beta_val_AXP, order.by = index(AXP[(i-1)]))
  beta_xts_KO <- as.xts(beta_val_KO, order.by = index(KO[(i-1)]))
  beta_xts_KHC <- as.xts(beta_val_KHC, order.by = index(KHC[(i-1)]))
  beta_xts_WFC <- as.xts(beta_val_WFC, order.by = index(WFC[(i-1)]))
  beta_xts_USB <- as.xts(beta_val_USB, order.by = index(USB[(i-1)]))
  beta_xts_IBM <- as.xts(beta_val_IBM, order.by = index(IBM[(i-1)]))

  
  # Create a time series of beta for each stock 
  if(is.null(PSX_betas.xts)){
    PSX_betas.xts <- beta_xts_PSX
    AXP_betas.xts <- beta_xts_AXP
    KO_betas.xts <- beta_xts_KO
    KHC_betas.xts <- beta_xts_KHC
    WFC_betas.xts <- beta_xts_WFC
    USB_betas.xts <- beta_xts_USB
    IBM_betas.xts <- beta_xts_IBM
  }else{
    PSX_betas.xts <- rbind(PSX_betas.xts,beta_xts_PSX)
    AXP_betas.xts <- rbind(AXP_betas.xts,beta_xts_AXP)
    KO_betas.xts <- rbind(KO_betas.xts,beta_xts_KO)
    KHC_betas.xts <- rbind(KHC_betas.xts,beta_xts_KHC)
    WFC_betas.xts <- rbind(WFC_betas.xts,beta_xts_WFC)
    USB_betas.xts <- rbind(USB_betas.xts,beta_xts_USB)
    IBM_betas.xts <- rbind(IBM_betas.xts,beta_xts_IBM)
  }
  # Print the time window considered for calculation of betas values
  print('------time windows-------')
  print(paste("Start time window:", index(PSX)[i-delta_t]))
  print(paste("End time window:  ", index(PSX)[i-1]))
  print('------date for beta------')
  print(paste("Time index beta: ", index(PSX)[i]))
  print(paste("PSX  beta:", beta_val_PSX))
  print(paste("AXP beta:", beta_val_AXP))
  print(paste("KO beta:", beta_val_KO))
  print(paste("KHC beta:", beta_val_KHC))
  print(paste("WFC beta:", beta_val_WFC))
  print(paste("USB beta:", beta_val_USB))
  print(paste("IBM beta:", beta_val_IBM))
}


plot(PSX_betas.xts)
plot(AXP_betas.xts)

colnames(PSX_betas.xts) = "PSX_Beta"
colnames(AXP_betas.xts) = "AXP_Beta"
colnames(KO_betas.xts) = "KO_Beta"
colnames(KHC_betas.xts) = "KHC_Beta"
colnames(WFC_betas.xts) = "WFC_Beta"
colnames(USB_betas.xts) = "USB_Beta"
colnames(IBM_betas.xts) = "IBM_Beta"

library(dygraphs)
#plot of Betas
dygraph(PSX_betas.xts)
dygraph(AXP_betas.xts)
dygraph(KO_betas.xts)
dygraph(KHC_betas.xts)
dygraph(WFC_betas.xts)
dygraph(USB_betas.xts)
dygraph(IBM_betas.xts)


