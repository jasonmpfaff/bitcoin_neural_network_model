install.packages("forecast")
install.packages("rlang")
library(rlang)
library(forecast)
install.packages("ggplot2")
library(ggplot2)




bit_Model<-scan("bit.csv")
Price_of_bit<-ts(bit_Model, start=c(4/13/2013), frequency=365)
bit_Price_forecast<-HoltWinters(Price_of_Oil)
bit_Price_forecast
bit_coeffs<-coefficients(bit_Price_forecast)
plot(decompose(Price_of_bit), xlab="Revenue")
plot(forecast(bit_Price_forecast,12), main="Revenue", xaxt="n", col="red", ylab="price")
points(Price_of_bit, col="blue", bg="red", pch=23)
final<-forecast(bit_Price_forecast, h=365)
plot(final)
autoplot(final, shadecols=c("red", "orange"))
final

model<-scan("bit.csv")
fit<-nnetar(model)
finalfit<-forecast(fit, h=365)
finalfit
plot(finalfit)
plot(forecast(finalfit))