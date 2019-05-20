# Pacotes -----------------------------------------------------------------
library(highcharter)
library(tidyverse)
  
# Modify a highcharter chart
# 
# 

# Documentação ------------------------------------------------------------
# 
# https://api.highcharts.com/highcharts/
# 
# https://dantonnoriega.github.io/ultinomics.org/post/2017-04-05-highcharter-explainer.html
# 
# 

# One chart ---------------------------------------------------------------
# 
data(citytemp)

citytemp_long <- citytemp %>% 
  gather(city, temp, -month) %>% 
  mutate(month = factor(month, month.abb))

hc <- hchart(citytemp_long, "line", hcaes(month, temp, group = city))

hc


# titulo, subtitulo, créditos ---------------------------------------------

hc_title(hc, text = "Hello!")

hc_subtitle(hc, text = "Bye bye")

# 
# 
# 
hc %>% 
  hc_title(text = "Hello!") %>% 
  hc_subtitle(text = "Bye bye") %>% 
  hc_credits(enabled = TRUE, text = "a important text link")

hc <- hc %>% 
  hc_title(text = "Hello!") %>% 
  hc_subtitle(text = "Bye bye") %>% 
  hc_credits(enabled = TRUE, text = "a important text link")

hc

hc %>% 
  hc_title(text = "Nuevo titulo")

