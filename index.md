# Making a COVID-19 Map in R

Have you ever womdered how COVID-19 maps are made? You have quite a few options to make one from using Geographic Information Systems (GIS) software like QGIS or ArcGIS to coding in R or Python.

In this tutorial, you will learn how to make a COVID-19 dealth toll map in R using NYT publicly available data. This tutorial assumes that you know the basics of R and the structyre of geo-spatial data. 

Let's get started! 

### Before you start coding... 

I would suggest you to create an R project (R Studio -> File -> New Project) to keep things organized. 

### Now you are ready with your R project and script files... Make sure you have all the package you need!
```r
library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse) #read_csv 
library(lubridate)
library(usmap)
library(viridis)

#if you don't have the listed packages installed, please do by calling the function "install.packages("put the name of the package")"
``` 

### set and check your working directly 
```r
#check your working directory
getwd()

#set your working directory 
setwd(/YOUR FILE PATH HERE/)
```


