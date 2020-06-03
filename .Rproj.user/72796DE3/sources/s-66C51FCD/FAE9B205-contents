#####COVID-19 Map#####
##########06-01-20####

library(dplyr)
library(ggplot2)
library(readxl)
library(shiny)
library(formattable)
library(arsenal)
library(DT)
library(tidyr)
library(stringr)
library(tidyverse) #read_csv 
library(lubridate)
library(tigris)
library(maps) 

#set and check your working directory
getwd()

#load the dataset
covid <- read_csv("covid19_us-counties.csv")

#load a base map
oldpar<-par() #reset the graphocal paramters back to defalut 
states <- map("state", res=0)
glimpse(states)
head(states$names)

#re-project with lon/lat, lines
library(maptools)

spstates <- map2SpatialLines(states, proj4string = CRS("+proj=longlat"))
str(spstates,max.level=2)

plot(spstates)

#projection correction
library(rgdal)
spstates.laea <- spTransform(spstates, CRS("+proj=laea +lat_0=43.0758 +lon_0=-89.3976"))
plot(spstates.laea)

#spatial referencing 
par(oldpar) #restore default graphic parameters 

map.states <- map("state", plot = T, fill = T, res=0)
str(map.states)

#split the name of the county by ":"
list.names.states <- strsplit(map.states$names,":")
head(list.names.states, n=63)
View(list.names.states)

#create values
map.IDs <- sapply(list.names.states, function(x) x[1])
head(map.IDs, n = 63)

#create states polygons 
polystates <- map2SpatialPolygons(map.states, IDs = map.IDs,proj4string = CRS("+proj=longlat"))

summary(polystates)
plot(polystates)

#reproject
states.laea <- spTransform(polystates, CRS("+proj=laea +lat_0=43.0758 +lon_0=-89.3976"))
plot(states.laea)

#COVID-19 data -- combine state and county
covid$state <- tolower(covid$state)

#filter the covid data
covid_sum <- covid %>% group_by(state) %>%
  summarize(death = sum(deaths),
            cases = sum(cases))

#joint by the spatial polygon ID
state.covid <- SpatialPolygonsDataFrame(polystates,covid_sum)

county.covid <- merge(polycounty, covid_sum, by.x = "ID", by.y = "state_county")


