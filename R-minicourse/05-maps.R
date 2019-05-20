# Pacotes -----------------------------------------------------------------
library(highcharter)
library(tidyverse)


# Documentação ------------------------------------------------------------
# 
# http://jkunst.com/highcharter/highmaps.html
# 
# https://code.highcharts.com/mapdata/
# 

# example 1 ---------------------------------------------------------------
hcmap("countries/br/br-all")

hcmap("countries/br/br-all", showInLegend = FALSE)


# example 2 ---------------------------------------------------------------
example_data <- get_data_from_map(download_map_data("countries/br/br-all"))

example_data 

example_data <- example_data %>% 
  select(`woe-name`, name) %>% 
  mutate(housing_index = round(100 * runif(n()), 2))

example_data

hcmap("countries/br/br-all", data = example_data, value = "housing_index", name = "Housing Index")


hcmap("countries/br/br-all",
      data = example_data,
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      value = "housing_index",
      name = "Housing Index"
      )

brmap <- hcmap("countries/br/br-all", data = example_data, value = "housing_index", name = "Housing Index")

brmap %>% 
  hc_colorAxis(minColor = "red", maxColor = "white")


# example 2.2
library(viridisLite)

n <- 4
stops <- data.frame(
  q = 0:n/n,
  c = substring(viridis(n + 1), 0, 7),
  stringsAsFactors = FALSE
  )
stops <- list_parse2(stops)


brmap <- brmap %>%
  hc_colorAxis(stops = stops)

brmap


# example 3 ---------------------------------------------------------------
# http://openflights.org/data.html
airports <- read_csv("https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat", col_names = FALSE)
airports <- airports %>%
  filter(X4 == "Brazil") %>% 
  select(nombre = X2, lon = X8, lat = X7)

airports

hcmap("countries/br/br-all", showInLegend = FALSE) %>% 
  hc_add_series(
    data = airports, 
    type = "mappoint",
    name = "Airports",
    tooltip = list(pointFormat = "{point.nombre}")
    ) 

brmap2 <- brmap %>% 
  hc_add_series(
    data = airports,
    type = "mappoint",
    color = "skyblue",
    name = "Airports",
    tooltip = list(pointFormat = "{point.nombre}")
  )

brmap2


# Zoom?
brmap2 %>% 
  hc_chart(zoomType = "xy")


# Exercícios --------------------------------------------------------------
# 
# RECAP!!!
# 
# Do messmo para America del Sur:
# 
# 1. See Ameria del Sur "demo" in https://code.highcharts.com/mapdata/ ("custom/south-america")
# 2. Agregue datos ficticios
# 3. Agregue titulo, subtitulo, legenda
# 4. Agregue nueva paleta de colores minColor, maxColor 
# 5. Add a "hc_theme_db" theme
# 