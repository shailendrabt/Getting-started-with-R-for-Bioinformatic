####ploting basics with ggplot
library(dplyr)
library(ggplot2)
rm(list = ls())
getwd()
compensation <- read.csv("compensation.csv")
ggplot(compensation, aes(x= Root, y = Fruit)) + 
  geom_point()

theme_bw()
