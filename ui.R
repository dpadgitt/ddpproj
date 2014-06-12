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
# ui.R
shinyUI(fluidPage(
  titlePanel("US Storm Impact by County"),
      verticalLayout(
        helpText("Create US choropleth maps with cumulative
        Impact of US Storm Events from 1950 Through 2011 from 
        U.S. National Oceanic and Atmospheric Administration's 
        NOAA storm database.  Interpretation: Fatalaties/Injuries data are 
        number of people, Property/Crop damage data are in US Dollars."),
      selectInput("var", 
        label = "Instructions: Choose a variable to display on the map
        using the selector below.",
        choices = c("Number of Fatalities", "Number of Injuries", "Property Damage","Crop Damage"),
        selected = "Number of Fatalities")
    ),
  mainPanel(plotOutput("map"))
 # ,
 # fluidRow(
 #   helpText("Once you've identified something interesting in the map,
 #   you can explore and search the raw data using 
 #   the standard data table below.  Because of the large dataset, this 
 #   may take some time, depending on server load and instantaneous
 #   bandwidth availability."),
 #   dataTableOutput(outputId="table")
 # )
)
)
