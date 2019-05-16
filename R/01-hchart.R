# Pacotes -----------------------------------------------------------------
library(highcharter)


# Contexto ----------------------------------------------------------------
# plot is a generic (magical) funcion.

# densidades
d <- density(rnorm(1000))
plot(d)

# survival models
library(survival)

data(lung)
lung <- mutate(lung, sex = ifelse(sex == 1, "Male", "Female"))
fit <- survfit(Surv(time, status) ~ sex, data = lung) 

plot(fit)

# time series
data("AirPassengers")

plot(AirPassengers)

# forecast
library(forecast)
fit2 <- forecast(AirPassengers)

plot(fit2)

# Principal Components
plot(princomp(USArrests, cor = TRUE))
