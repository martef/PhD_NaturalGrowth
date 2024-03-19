library(sf)
library(viridis)
library(sp)
library(tmap)
library(rgdal)

shp<-st_read(dsn="C:/Users/martef/OneDrive - NTNU/Documents/Jobb-pc/PhD prosjekter/WP1 Sphagnum/Kartdata", 
             layer="hostadmyra_myrmassiv")

norway <- st_read(dsn="C:/Users/martef/OneDrive - NTNU/Documents/Jobb-pc/PhD prosjekter/WP1 Sphagnum/Kartdata",
                layer="Norge_admin_f")

topo <- readOGR(dsn= "T:/vm/alle/GIS_data/Norge/WMS", layer="Topografisk norgeskart 4")



#Map of Norway

map_norway <- tmap_mode("plot") +
              tm_shape(bmap)+
              tm_borders(col="darkgrey") +
              tm_layout(inner.margins = c(0.05, 0.05, 0.05, 0.05), 
                legend.show = FALSE)

#Map of Høstadmyra
map_hostadmyra <- tmap_mode("plot") +
                  tm_shape(shp)+
                  tm_polygons(col="darkgreen", alpha= 0.5) +
                  tm_shape(shp) +
                  tm_borders(col="black", alpha=0.8) +
                  tm_compass(type="8star", position = c("left", "bottom"), size = 1) +
                  tm_scale_bar(position = c("right", "BOTTOM"), breaks=c(0,0.25,0.5), text.size=0.5) +
                  tm_layout(inner.margins = c(0.15, 0.05, 0.05, 0.05), 
                    legend.show = FALSE)


#Map of Høstadmyra with position in Norway displayed
map_hostadmyra
print(map_norway, vp = grid::viewport(0.8, 0.185, width = 0.2, height = 0.45))


