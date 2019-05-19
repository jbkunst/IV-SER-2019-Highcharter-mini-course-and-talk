# Pacotes -----------------------------------------------------------------
library(highcharter)
library(ggplot2)
library(dplyr)


# ggplot2 -----------------------------------------------------------------
#  
# Contexto:
# 
data(economics_long, package = "ggplot2")

ggplot(economics_long) +
  geom_line(aes(x = date, y = value01, color = variable))

# GEOM / capa

# aestetics 

# see: 


# highcharter -------------------------------------------------------------
# 
# Version I
# 
hchart(economics_long, "line", hcaes(x = date, y = value01, group = variable))

# 
# Version II
# 
highchart() %>% 
  hc_add_series(economics_long, "line", hcaes(x = date, y = value01, group = variable)) %>% 
  hc_xAxis(type = "datetime")
