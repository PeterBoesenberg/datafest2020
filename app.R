library(data.table)
library(plotly)

source("chart.R")

dt <- fread("data/Europe_2018-2020_May16.csv",dec = ",")
ukraine <- dt[COUNTRY=="Ukraine"][, count:=.(.N), by = .(LOCATION)]

get_actors <- function(ukraine) {
  first_actors <- ukraine[, c(ACTOR1, count=.(.N)), by = .(ACTOR1)][order(-count)]
  second_actors <- ukraine[, c(ACTOR2, count=.(.N)), by = .(ACTOR2)][order(-count)]
  
  setkey(first_actors,ACTOR1)
  setkey(second_actors,ACTOR2)
  
  
  actors <- first_actors[second_actors, ':='(actor=ACTOR1,count=count+i.count)][order(-count)]
  actors
}
#   
# 
# get_armed_conflicts_chart(ukraine)
# get_battles_chart(ukraine)
# get_actors(ukraine)
get_top_actors_chart(get_actors(ukraine))



