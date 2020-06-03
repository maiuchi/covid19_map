# Making a COVID-19 Map in R

Have you ever womdered how COVID-19 maps are made? You have quite a few options to make one from using Geographic Information Systems (GIS) software like QGIS or ArcGIS to coding in R or Python.

In this tutorial, you will learn how to make a COVID-19 dealth toll map in R using NYT publicly available data.

Let's get started! 

### Make sure you have all the package you need!
```r
library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse) #read_csv 
library(lubridate)
library(usmap)
library(viridis)
``` 
