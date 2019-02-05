library(quantmod)
library(dygraphs)
library(scales)   #for percentage
tickers <- c("PSX", "AXP", "KO","KHC", "WFC", "USB", "IBM")
start_stream <- '2016-01-01'
end_stream <- '2019-01-01'
getSymbols(tickers, src = 'yahoo', from = start_stream, to=end_stream)
stocks <- merge(PSX$PSX.Adjusted, AXP$AXP.Adjusted, KO$KO.Adjusted, KHC$KHC.Adjusted,  WFC$WFC.Adjusted, USB$USB.Adjusted, IBM$IBM.Adjusted)
colnames(stocks) <- c("PSX", "AXP", "KO", "KHC",  "WFC", "USB", "IBM" )
dygraph(stocks)

# Monthly prices
PSX_monthly <- to.monthly(PSX, drop.time=FALSE) 
AXP_monthly <- to.monthly(AXP, drop.time=FALSE)
KO_monthly <- to.monthly(KO, drop.time=FALSE)
KHC_monthly <- to.monthly(KHC , drop.time=FALSE)
WFC_monthly <- to.monthly(WFC , drop.time=FALSE)
USB_monthly <- to.monthly(USB , drop.time=FALSE)
IBM_monthly <- to.monthly(IBM, drop.time=FALSE)

stock_monthly <- merge(PSX_monthly$PSX.Adjusted, AXP_monthly$AXP.Adjusted, KO_monthly$KO.Adjusted, KHC_monthly$KHC.Adjusted, WFC_monthly$WFC.Adjusted, USB_monthly$USB.Adjusted, IBM_monthly$IBM.Adjusted )

# -- Returns
library(PerformanceAnalytics)
stocks_simple_rtn <- CalculateReturns(stock_monthly, method = "simple") 
stocks_cc_rtn <- CalculateReturns(stock_monthly, method = "compound") 

dygraph(stocks_simple_rtn, main="Gross Return ")
dygraph(stocks_cc_rtn , main="CC Return ")


# -- Histograms and smoothed density --
stocks_cc_rtn <- na.omit(stocks_cc_rtn)
colnames(stocks_cc_rtn) <- c("PSX", "AXP", "KO", "KHC",  "WFC", "USB", "IBM" )
# PSX -- Diagnostic plots of histogram 
hist(stocks_cc_rtn$PSX, freq = FALSE, main="Distribution of CC Return about PSX stock",  breaks = 15)
PSX_density <- density(stocks_cc_rtn$PSX)
points(PSX_density, type="l", col="blue")


# AXP -- Diagnostic plots of histogram 
hist(stocks_cc_rtn$AXP, freq = FALSE, main="Distribution of CC Return about AXP stock",  breaks = 15)
AXP_density <- density(stocks_cc_rtn$AXP)
points(AXP_density, type="l", col="blue")

# KO -- Diagnostic plots of histogram 
hist(stocks_cc_rtn$KO, freq = FALSE, main="Distribution of CC Return about KO stock",  breaks = 15)
KO_density <- density(stocks_cc_rtn$KO)
points(KO_density, type="l", col="blue")

# KHC -- Diagnostic plots of histogram 
hist(stocks_cc_rtn$KHC, freq = FALSE, main="Distribution of CC Return about KHC stock",  breaks = 15)
KHC_density <- density(stocks_cc_rtn$KHC)
points(KHC_density, type="l", col="blue")

# WFC -- Diagnostic plots of histogram 
hist(stocks_cc_rtn$WFC, freq = FALSE, main="Distribution of CC Return about WFC stock",  breaks = 15)
WFC_density <- density(stocks_cc_rtn$WFC)
points(WFC_density, type="l", col="blue")

# USB -- Diagnostic plots of histogram 
hist(stocks_cc_rtn$USB, freq = FALSE, main="Distribution of CC Return about USB stock",  breaks = 15)
USB_density <- density(stocks_cc_rtn$USB)
points(USB_density, type="l", col="blue")

# IBM -- Diagnostic plots of histogram 
hist(stocks_cc_rtn$IBM, freq = FALSE, main="Distribution of CC Return about PSX stock",  breaks = 15)
IBM_density <- density(stocks_cc_rtn$IBM)
points(IBM_density, type="l", col="blue")

# -- Boxplots --
# PSX -- Boxplots
chart.Boxplot(stocks_cc_rtn$PSX, voutlier.symbol = "O", main = "PSX CC Return")

# AXP -- Boxplots
chart.Boxplot(stocks_cc_rtn$AXP, voutlier.symbol = "O", main = "AXP CC Return")

# KO -- Boxplots
chart.Boxplot(stocks_cc_rtn$KO, voutlier.symbol = "O", main = "KO CC Return")

# KHC -- Boxplots
chart.Boxplot(stocks_cc_rtn$KHC, voutlier.symbol = "O", main = "KHC CC Return")

# WFC -- Boxplots
chart.Boxplot(stocks_cc_rtn$WFC, voutlier.symbol = "O", main = "WFC CC Return")

# USB -- Boxplots
chart.Boxplot(stocks_cc_rtn$USB, voutlier.symbol = "O", main = "USB CC Return")

# IBM -- Boxplots
chart.Boxplot(stocks_cc_rtn$IBM, voutlier.symbol = "O", main = "IBM CC Return")

# All stocks -- Boxplots
chart.Boxplot(stocks_cc_rtn, voutlier.symbol = "O", main = "Stocks CC Return")

# -- Qqplots --
# PSX -- qqplot
qqnorm(stocks_cc_rtn$PSX, main="PSX", col="blue")
qqline(stocks_cc_rtn$PSX)

# AXP -- qqplot
qqnorm(stocks_cc_rtn$AXP, main="AXP", col="blue")
qqline(stocks_cc_rtn$AXP)

# KO -- qqplot
qqnorm(stocks_cc_rtn$KO, main="KO", col="blue")
qqline(stocks_cc_rtn$KO)

# KHC -- qqplot
qqnorm(stocks_cc_rtn$KHC, main="KHC", col="blue")
qqline(stocks_cc_rtn$KHC)

# WFC -- qqplot
qqnorm(stocks_cc_rtn$WFC, main="WFC", col="blue")
qqline(stocks_cc_rtn$WFC)

# USB -- qqplot
qqnorm(stocks_cc_rtn$USB, main="USB", col="blue")
qqline(stocks_cc_rtn$USB)

# IBM -- qqplot
qqnorm(stocks_cc_rtn$IBM, main="IBM", col="blue")
qqline(stocks_cc_rtn$IBM)

#  Univariate descriptive statistics  PSX 
mean_psx  <- mean(stocks_cc_rtn$PSX) # aritmethic mean of data collection
var_psx <- var(stocks_cc_rtn$PSX)[1]  # variance of data collection 
sd_psx <- sd(stocks_cc_rtn$PSX) # standard deviation of data collection 
sk_psx <- skewness(stocks_cc_rtn$PSX)
ku_psx <- kurtosis(stocks_cc_rtn$PSX)
hist(stocks_cc_rtn$PSX, breaks =30, probability = TRUE)
q = quantile(stocks_cc_rtn$PSX)
abline(v=q[1], col="red", lwd=2) # 0% (min)
abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
abline(v=q[5], col="red", lwd=2) # 100% (max)

#  Univariate descriptive statistics  AXP 
mean_axp <-
  mean(stocks_cc_rtn$AXP) # aritmethic mean of data collection
var_axp <- var(stocks_cc_rtn$AXP)[1]  # variance of data collection 
sd_axp <- sd(stocks_cc_rtn$AXP) # standard deviation of data collection 
sk_axp <- skewness(stocks_cc_rtn$AXP)
ku_axp <- kurtosis(stocks_cc_rtn$AXP)
hist(stocks_cc_rtn$AXP, breaks =30, probability = TRUE)
q = quantile(stocks_cc_rtn$AXP)
abline(v=q[1], col="red", lwd=2) # 0% (min)
abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
abline(v=q[5], col="red", lwd=2) # 100% (max)

#  Univariate descriptive statistics  KO 
mean_ko <- mean(stocks_cc_rtn$KO) # aritmethic mean of data collection
var_ko <- var(stocks_cc_rtn$KO)[1]  # variance of data collection 
sd_ko <- sd(stocks_cc_rtn$KO) # standard deviation of data collection
sk_ko <- skewness(stocks_cc_rtn$KO)
ku_ko <- kurtosis(stocks_cc_rtn$KO)
hist(stocks_cc_rtn$KO, breaks =30, probability = TRUE)
q = quantile(stocks_cc_rtn$KO)
abline(v=q[1], col="red", lwd=2) # 0% (min)
abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
abline(v=q[5], col="red", lwd=2) # 100% (max)

#  Univariate descriptive statistics  KHC 
mean_khc <- mean(stocks_cc_rtn$KHC) # aritmethic mean of data collection
var_khc <- var(stocks_cc_rtn$KHC)[1]  # variance of data collection 
sd_khc <- sd(stocks_cc_rtn$KHC) # standard deviation of data collection
sk_khc <- skewness(stocks_cc_rtn$KHC)
ku_khc <- kurtosis(stocks_cc_rtn$KHC)
hist(stocks_cc_rtn$KHC, breaks =30, probability = TRUE)
q = quantile(stocks_cc_rtn$KHC)
abline(v=q[1], col="red", lwd=2) # 0% (min)
abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
abline(v=q[5], col="red", lwd=2) # 100% (max)

#  Univariate descriptive statistics  WFC 
mean_wfc <- mean(stocks_cc_rtn$WFC) # aritmethic mean of data collection
var_wfc <- var(stocks_cc_rtn$WFC)[1]  # variance of data collection
sd_wfc <- sd(stocks_cc_rtn$WFC) # standard deviation of data collection
sk_wfc <- skewness(stocks_cc_rtn$WFC)
ku_wfc <- kurtosis(stocks_cc_rtn$WFC)
hist(stocks_cc_rtn$WFC, breaks =30, probability = TRUE)
q = quantile(stocks_cc_rtn$WFC)
abline(v=q[1], col="red", lwd=2) # 0% (min)
abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
abline(v=q[5], col="red", lwd=2) # 100% (max)

#  Univariate descriptive statistics  USB 
mean_usb <- mean(stocks_cc_rtn$USB) # aritmethic mean of data collection
var_usb <- var(stocks_cc_rtn$USB)[1]  # variance of data collection
sd_usb <- sd(stocks_cc_rtn$USB) # standard deviation of data collection
sk_usb <- skewness(stocks_cc_rtn$USB)
ku_usb <- kurtosis(stocks_cc_rtn$USB)
hist(stocks_cc_rtn$USB, breaks =30, probability = TRUE)
q = quantile(stocks_cc_rtn$USB)
abline(v=q[1], col="red", lwd=2) # 0% (min)
abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
abline(v=q[5], col="red", lwd=2) # 100% (max)

#  Univariate descriptive statistics  IBM 
mean_ibm <- mean(stocks_cc_rtn$IBM) # aritmethic mean of data collection
var_ibm <- var(stocks_cc_rtn$IBM)[1]  # variance of data collection
sd_ibm <- sd(stocks_cc_rtn$IBM) # standard deviation of data collection 
sk_ibm <- skewness(stocks_cc_rtn$IBM)
ku_ibm <- kurtosis(stocks_cc_rtn$IBM)
hist(stocks_cc_rtn$IBM, breaks =30, probability = TRUE)
q = quantile(stocks_cc_rtn$PSX)
abline(v=q[1], col="red", lwd=2) # 0% (min)
abline(v=q[2], col="blue", lwd=2) # 1st quartile 25%
abline(v=q[3], col="green", lwd=2.5) # Median value distribution 50%
abline(v=q[4], col="blue", lwd=2) # 3rd quartile 75%
abline(v=q[5], col="red", lwd=2) # 100% (max)


# Covariance
cov(cbind(stocks_cc_rtn))
# Correlation
cor(cbind(stocks_cc_rtn))

# scatter plot
PSX.mat <- as.numeric(stocks_cc_rtn$PSX)
AXP.mat <- as.numeric(stocks_cc_rtn$AXP)
KO.mat <- as.numeric(stocks_cc_rtn$KO)
KHC.mat <- as.numeric(stocks_cc_rtn$KHC)
WFC.mat <- as.numeric(stocks_cc_rtn$WFC)
USB.mat <- as.numeric(stocks_cc_rtn$USB)
IBM.mat <- as.numeric(stocks_cc_rtn$IBM)
# pairwise scatter plot
scatter_plot <- cbind(PSX.mat, AXP.mat, KO.mat, KHC.mat, WFC.mat, USB.mat, IBM.mat)
pairs(scatter_plot, pch=18, col="blue", main="scatter plot")



