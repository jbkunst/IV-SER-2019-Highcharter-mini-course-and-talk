library(highcharter)
library(shiny)
library(tidyverse)
library(htmlwidgets)

knitr::opts_chunk$set(message = FALSE, warning = FALSE, echo = TRUE)
options(highcharter.theme = hc_theme_smpl(chart = list(backgroundColor = "transparent")))

# helpers -----------------------------------------------------------------
ico <- function(x = "tv", color = NULL, ...) {
  # color <- "red"
  as.character(tags$span(icon(x, ...), style = sprintf("color:%s", color)))
}

R <- function() {
  as.character(tags$span("R", style = "color:#2066B9;font-weight:500"))
}

sw <- function(w, f) {
  saveWidget(widget = w, file = f, libdir = "index_files/", selfcontained = FALSE, background = "transparent")
}



# highcharter -------------------------------------------------------------
library(highcharter)

fntfmly <- '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"' 

options(
  highcharter.theme =
    hc_theme_smpl(
      chart = list(
        style = list(
          fontFamily = fntfmly
        )
      ),
      xAxis = list(labels = list(style = list(fontSize = 15))),
      yAxis = list(labels = list(style = list(fontSize = 15))),
      title = list(style = list(fontFamily = fntfmly)),
      subtitle = list(style = list(fontFamily = fntfmly)),
      credits = list(style = list(fontFamily = fntfmly))
    )
)

hc_opts <- getOption("highcharter.chart")
hc_opts$chart <- list(style = list(fontFamily = fntfmly))