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

library(dplyr)
library(ggplot2)
rm(list = ls())
getwd()
setwd("datasets-master/")
compensation <- read.csv("compensation.csv")
glimpse(compensation)
ggplot(compensation, aes(x= Root, y = Fruit)) + 
  geom_point()
library(ggplot2)
theme_bw()
getwd()
ggplot(compensation, aes(x= Root, y = Fruit)) + 
  geom_point(size = 5) +
  theme_bw()
ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing)) +
  geom_point(size = 5) +
  xlab("Root Biomass") +
  ylab("Fruit Production") +
  theme_bw()

compensation <- read.csv("compensation.csv")
glimpse(compensation)
ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing)) +
  geom_point(size = 5) +
  xlab("Root Biomass") +
  ylab("Fruit Production") +
  theme_bw()
library(ggplot2)

ggplot(compensation, aes(x = Fruit))+
  geom_histogram(bins = 30)
ggplot(compensation, aes(x = Fruit))+
  geom_histogram(binwidth = 15)

ggplot(compensation, aes(x = Grazing, y = Fruit)) +
  geom_boxplot() +
  geom_point(size = 4, colour = "blue", alpha = 0.5) +
  xlab("Grazing treatment") +
  ylab("Fruit Production") +
  theme_bw()
ggplot(compensation, aes(x = Fruit)) +
  geom_histogram()

ggplot(compensation, aes(x = Fruit)) +
  geom_histogram(bins = 10)

ggplot(compensation, aes( x = Fruit)) +
  geom_histogram(binwidth = 15)

ggplot(compensation, aes( x = Fruit)) +
  geom_histogram(binwidth = 15)
facet_wrap(~Grazing)
