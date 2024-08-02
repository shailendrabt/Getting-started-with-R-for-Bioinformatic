####Chi square contigency analysis
library(dplyr)
library(ggplot2)
###import the data
getwd()
setwd("Downloads/datasets-master/")
lady <- read.csv("ladybirds_morph_colour.csv")
glimpse(lady)
total <- lady %>%
  group_by(Habitat, morph_colour) %>%
  summarise(total.number = sum(number))
#####organizing the data for plotting and analysis
ggplot(total, aes(x = Habitat , y = total.number,
      fill = morph_colour)) +
  geom_bar(stat = "identity", position = "dodge")

####fixing the colour
ggplot(total, aes(x = Habitat, y = total.number,
                  fill = morph_colour)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = c(black = "yellow", red = "red"))

###if you have used excel 
lady.mat <- xtabs(number ~ Habitat + morph_colour,
                  data = lady)
lady.mat
