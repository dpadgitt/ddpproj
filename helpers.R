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
magnitude_map <- function(var, color, legend.title) {
# generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(100)
  colors <- shades[as.integer((var/max(var))*100)]
# plot choropleth map
  map("county",fill=TRUE,col=colors,lty=0,projection = "polyconic") 
  map("state",col="black",fill=FALSE,add=TRUE,projection="polyconic") 
  min <- min(var); max<-max(var)
  inc <- (max(var)-min(var))/4
  legend.text <- c(paste0(min),
    paste0("< ",(min+inc)),paste0("< ",(min+2*inc)),
    paste0("< ",(min+3*inc)),paste0((max)," or more"))
  legend("bottomleft", 
    legend = legend.text, fill=shades[c(1, 25, 50, 75, 100)], 
    title = legend.title)
}

