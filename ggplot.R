####ploting basics with ggplot
library(dplyr)
library(ggplot2)
rm(list = ls())
getwd()
compensation <- read.csv("compensation.csv")
ggplot(compensation, aes(x= Root, y = Fruit)) + 
  geom_point() +
  theme_bw()

ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing)) +
  geom_point(size = 5) +
  xlab("Root Biomass") +
  ylab("Fruit Production") +
  theme_bw()
