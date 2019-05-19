# Pacotes -----------------------------------------------------------------
library(highcharter)
library(ggplot2)
library(dplyr)


# Contexto ----------------------------------------------------------------
# 
# ggplot2
# 
# ggplot uses geom and aesthetics
# 
data(diamonds, package = "ggplot2")

set.seed(123)
diamonds2 <- sample_n(diamonds, 1000)

glimpse(diamonds2)

ggplot(diamonds2) +
  geom_point(aes(x = carat, y = price, color = cut))

# GEOM / capa

# aestetics 

# see: 


# highcharter -------------------------------------------------------------
# 
# Version I
# 
hchart(diamonds2, "point", hcaes(x = carat, y = price, group = cut))

# 
# Version II
# 
highchart() %>% 
  hc_add_series(diamonds2, "point", hcaes(x = carat, y = price, group = cut))
