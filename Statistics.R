library(dplyr)
library(ggplot2)
###import the data
lady <- read.csv("ladybirds_morph_colour.csv")
glimpse(lady)
total <- lady %>%
  group_by(Habitat, morph_colour) %>%
  summarise(total.number = sum(number))


