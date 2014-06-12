###############################################
#                                             #
#          Developing Data Products           #        
#                                             #
#               Course Project                #
#                                             #
#                 Dave Padgitt                #
#                                             #
#                  Generates                  #
#       US choropleth Maps by county          #
#        in conjunction with ui.R and         #
#                  server.R                   #
#                                             #
# Dataset: derived from (NOAA) storm database #
#                                             #
#   Files: statedat.rds in "data" subdir      #
#          server.R in "proj" dir             #
#          ui.R in "proj" dir                 #
#                                             #
#   Usage: runApp("proj") from above proj dir #
#                                             #
###############################################
#
# Portions inspired from http://shiny.rstudio.com/tutorial/lesson5/
#
# server.R
library(maps)
library(mapproj)
statedat <- readRDS("./data/statedat.rds")
source("helpers.R")
#
shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      args <- switch(input$var,
         "Number of Fatalities" = list(statedat$FATALITIES, "black", "Number of Fatalities"),
         "Number of Injuries" = list(statedat$INJURIES, "blue", "Number of Injuries"),
         "Property Damage" = list(statedat$propdam, "green", "Property Damage"),
         "Crop Damage" = list(statedat$cropdam, "yellow", "Crop Damage"))
      do.call(magnitude_map, args)
    })
#    output$table <- renderDataTable({
#      data <- statedat
#    })
  }
)
