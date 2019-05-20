# Pacotes -----------------------------------------------------------------
library(highcharter)
library(tidyverse)
library(gapminder)

# Documentação ------------------------------------------------------------
# 
# https://api.highcharts.com/highcharts/tooltip
# 

# Exemplo motivacional ----------------------------------------------------
# 
# - http://jkunst.com/blog/posts/2017-03-03-giving-a-thematic-touch-to-your-interactive-chart/
# - http://jkunst.com/blog/posts/2016-03-08-pokemon-vizem-all/

# Dados -------------------------------------------------------------------
data(citytemp)

citytemp_long <- citytemp %>% 
  gather(city, temp, -month) %>% 
  mutate(month = factor(month, month.abb))

hc <- hchart(citytemp_long, "line", hcaes(month, temp, group = city)) %>% 
  hc_title(text = "Titulo") %>% 
  hc_subtitle(text = "interesante subtitulo")

hc


# Simple features ---------------------------------------------------------
hc %>% 
  hc_tooltip(
    crosshairs = TRUE,
    backgroundColor = "lightgray",
    shared = TRUE,
    borderWidth = 5
    )
