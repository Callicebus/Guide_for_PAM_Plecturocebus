#Load in packages
library(dplyr)
library(tidyverse)
library(lubridate)
library(ggplot2)

#Load in data
Data <- read_csv('C:/Users/Silvy/Desktop/Duets_Avistajes_Pre2015.csv')
head(Data)

#Converting time data into hours
Data$TimeEnc <- strptime(Data$TimeEnc, format="%H:%M:%S")
Data$hours <-  as.numeric(format(Data$TimeEnc, format="%H"))

#Creating Histogram
ggplot(Data, aes(x = hours)) + geom_histogram(position = "dodge", binwidth = 1, color = "black", fill = "grey") +
  ggtitle("Histograms of Duet Start Times") +
  labs(x = "Hour", y = "Frequency") +
  theme_classic()

#Export a .png of histogram
ggsave(
  'Histogram_of_Duet_Times',
  plot = last_plot(),#This saves last plot displayed in your 'Plots' window
  device = png,
  path = 'C:/Users/Silvy/Desktop',
  scale = 1,
  width = NA,
  height = NA,
  units = c("px"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL)
