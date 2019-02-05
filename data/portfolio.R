library(fPortfolio)
library(quantmod)
library(PerformanceAnalytics)
library(timeSeries)
library(dygraphs)
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

portfolioReturns <- as.timeSeries(merge(PSX, AXP, KO, KHC, WFC, USB, IBM))

effFrontier <- portfolioFrontier(portfolioReturns, constraints = "LongOnly")
plot(effFrontier,c(1,2,3,4))


#Plot Frontier Weights (Can Adjust Number of Points)
frontierWeights <- getWeights(effFrontier) # get allocations for each instrument for each point on the efficient frontier
colnames(frontierWeights) <- c('PSX', 'AXP', 'KO', 'KHC', 'WFC', 'USB', 'IBM')

mvp <- minvariancePortfolio(portfolioReturns, spec=portfolioSpec(), constraints="LongOnly")
mvp
tangencyPort <- tangencyPortfolio(portfolioReturns, spec=portfolioSpec(), constraints="LongOnly")
tangencyPort

mvpweights <- getWeights(mvp)
tangencyweights <- getWeights(tangencyPort)

#Extract value at risk
covRisk(portfolioReturns, mvpweights)
varRisk(portfolioReturns, mvpweights, alpha = 0.05)
cvarRisk(portfolioReturns, mvpweights, alpha = 0.05)

#Plot MVP Weights: Basic Graphs
barplot(mvpweights, main="Minimum Variance Portfolio Weights", xlab="Assset", ylab="Weight In Portfolio (%)", col=cm.colors(ncol(frontierWeights)+2), legend=colnames(weights))
pie(mvpweights, col=cm.colors(ncol(frontierWeights)+2))

portfolioReturns <- merge(PSX, AXP, KO, KHC, WFC, USB, IBM)
return_portfolio <- Return.portfolio(portfolioReturns, weights = mvpweights)
dygraph(return_portfolio)

mean_portfolio <- mean(return_portfolio)
var_portfolio <- var(return_portfolio)
sd_portfolio <- sd(return_portfolio)
