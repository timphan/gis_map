library(shiny)
library(leaflet)
library(RColorBrewer)
library(rgdal)
library(rgeos)
library(googlesheets)


ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("map", width = "100%", height = "100%")
)

server <- function(input, output, session) {



  output$map <- renderLeaflet({
    p2_shp<- readOGR("shp","pod2wAttr")
    p2_shp<-spTransform(p2_shp, CRS("+init=epsg:4326"))
    names(p2_shp)[3]<- "Precinct_ID"
    names(p2_shp)[4]<- "County"
    
    
    
    
    
    factpal <- colorFactor(topo.colors(11), p2_shp$County)
    leaflet(data = p2_shp) %>% addProviderTiles("CartoDB.Positron") %>%
       addPolygons(stroke = FALSE, 
                smoothFactor = 0.2, 
                fillOpacity = 1,
                color = ~factpal(County), group="Region") %>%
        addLayersControl(overlayGroups=c("Region"))
  })



  
}

shinyApp(ui, server)