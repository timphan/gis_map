turf<- gs_title("FL Turfing Doc Protected (08/09)")


    leaflet(data = p2_shp) %>% addProviderTiles("CartoDB.Positron") %>%
        addPolygons(stroke = FALSE, 
                smoothFactor = 0.2, 
                fillOpacity = 1,
                color = ~factpal(County), group="County") %>%
        addPolygons(stroke = FALSE, 
                smoothFactor = 0.2, 
                fillOpacity = 1,
                color = ~factpal2(Precinct_ID), group="Precinct_ID") %>%
        addLayersControl(overlayGroups=c("County","Precinct_ID"))