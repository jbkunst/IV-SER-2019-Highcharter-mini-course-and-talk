# Pacotes -----------------------------------------------------------------
library(highcharter)


# Contexto ----------------------------------------------------------------
# 
# plot is a generic (magical) funcion.
# 
# What it means "generic"? A generic function will do 
# an action depending of the "argument" (objetc class)
# 
# For example:
# 

# Densidades
d <- density(rnorm(1000))
plot(d)

# Survival models
library(survival)
data(lung)

fit <- survfit(Surv(time, status) ~ ifelse(sex == 1, "Male", "Female"), data = lung) 

plot(fit)

# Time series
data(AirPassengers)

plot(AirPassengers)

# Forecast
library(forecast)

fit2 <- forecast(AirPassengers)

plot(fit2)


# hchart ------------------------------------------------------------------
# 
# hchart is a generic function too! :)
# 

# Densidades
d <- density(rnorm(1000))
hchart(d)

# Survival models
hchart(fit)

# time series
hchart(AirPassengers)

# forecast
hchart(fit2)

# Nunerics
x <- rgamma(3000, 2, 4)
hchart(x)

# Character
data(mpg, package = "ggplot2")

hchart(mpg$manufacturer)

# Factor
data(diamonds, package = "ggplot2")

hchart(diamonds$cut)

# Matrix & correlations
data(volcano)

hchart(volcano)

hchart(cor(mtcars))
