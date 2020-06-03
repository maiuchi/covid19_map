#####COVID-19 Map#####
##########06-02-20####

library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse) #read_csv 
library(lubridate)
library(usmap)
library(viridis)


#set and check your working directory
getwd()

#load the dataset
covid <- read_csv("covid19_us-counties.csv")


#filter the covid data
covid_sum <- covid %>% 
  filter(date == as.Date("2020-05-31")) %>% 
  group_by(state) %>%
  summarise(death_sum = sum(deaths))

us_map <- usmap::us_map(region = "states")

#the look with the default theme 
usmap::plot_usmap(data = covid_sum, values = "death_sum") +
  scale_fill_continuous() +
  theme_grey()

#let's clean up a bit
usmap::plot_usmap(data = covid_sum, values = "death_sum", color = "grey40") +
  scale_fill_continuous(type='viridis', label = scales:: comma) +
  labs(title = "COVID-19 - total number of deaths",
       subtitle = "as of may 31, 2020",
       caption = "data: NYT, author: mai uchida", 
       fill = "deaths (n)") + 
  theme_classic()+
  theme(panel.background=element_blank(),
        panel.border=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        legend.position = "right",
        axis.line = element_blank(), 
        axis.ticks = element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())

