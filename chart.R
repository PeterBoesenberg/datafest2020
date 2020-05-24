g <- list(
  projection = list(scale=5),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  countrywidth = 1,
  countrycolor = toRGB("white"),
  scope="europe",
  center=list(lon= 32.254, lat=48.515) #Kropy
)


footnote <- "Armed Conflict Location & Event Data Project (ACLED); acleddata.com"
annotation <- list(x = 1, y = 0, text = footnote, 
                   showarrow = F, xref='paper', yref='paper', 
                   xanchor='right', yanchor='auto', xshift=0, yshift=0,
                   font=list(size=10))

get_armed_conflicts_chart <- function(ukraine) {
  
  fig <- plot_geo(ukraine, sizes = c(1, 450))
  fig <- fig %>% add_markers(
    x = ~LONGITUDE, y = ~LATITUDE, size = ~count, color=~count,  hoverinfo = "text", showlegend=T,
    text = ~paste(ukraine$LOCATION, "<br />", ukraine$count, " conflicts")
  )
  
  fig <- fig %>% layout(title = '2018-2020 armed conflicts in Ukraine', geo = g, 
                        annotations = annotation)
  
  
  fig
}
get_battles_chart <- function(ukraine) {
  ukrainian_battles <- dt[COUNTRY=="Ukraine"][EVENT_TYPE=="Battles"][, count:=.(.N), by = .(LOCATION)]
  fig2 <- plot_geo(ukrainian_battles, sizes = c(1, 450))
  fig2 <- fig2 %>% add_markers(
    x = ~LONGITUDE, y = ~LATITUDE, size = ~count, color=~count, hoverinfo = "text",
    text = ~paste(ukrainian_battles$LOCATION, "<br />", ukrainian_battles$count, " battles")
  )
  
  fig2 <- fig2 %>% layout(title = '2018-2020 battles in Ukraine', geo = g, annotations = annotation)
  
  fig2
}

get_top_actors_chart <- function(dt) {
  y_axis <- list(title="Participant")
  x_axis <- list(title="Count of conflicts")

  fig <- plot_ly(dt[1:10],y=~reorder(actor, count), x=~count, type = "bar", orientation="h")
  fig <- fig %>% layout(title="Top 10 participants in armed conflicts in the Ukraine 2018-2020",
                        yaxis=y_axis,
                        xaxis=x_axis,
                        annotations = annotation)
  fig
}

get_battles_by_date_chart <- function(dt) {
  
  y_axis <- list(title="Count of battles", rangemode="tozero")
  x_axis <- list(title="Month of battles")
  fig <- plot_ly(dt,y=~N, x=~reorder(date,order_date), type="scatter", mode="line")
  fig <- fig %>% layout(title="Battles in the Ukraine 2018-2020 by month",
                        yaxis=y_axis,
                        xaxis=x_axis,
                        annotations = annotation)
  fig
}
