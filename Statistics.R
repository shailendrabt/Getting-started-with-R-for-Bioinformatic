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
chisq.test(lady.mat)
lady.chi <- chisq.test(lady.mat)
names(lady.chi)

                                         #########two sample t-test 
###load data
getwd()
ozone <- read.csv("ozone.csv")
glimpse(ozone)
###two sample test in one effort
ggplot(ozone, aes(x = Ozone)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ Garden.location, ncol = 1) +
  theme_bw()
t.test(Ozone ~ Garden.location, data = ozone)
 var.test(Ozone ~ Garden.location, data = ozone)

                                 ####getting and plotting the data 
plant_gr <- read.csv("plant.growth.rate.csv")
glimpse(plant_gr)
####making a simple linear regression 
ggplot(plant_gr, 
       aes(x= soil.moisture.content, y = plant.growth.rate)) +
           geom_point() +
  ylab("Plant Growth Rate mm/week)") +
  theme_bw()
getwd()
model_pgr <- lm(plant.growth.rate ~ soil.moisture.content, data = plant_gr)
library(ggfortify)
install.packages("ggfortify")
autoplot(model_pgr, smooth.colour = NA)
anova(model_pgr)
summary(model_pgr)

ggplot(plant_gr, aes(x = soil.moisture.content,
                     y = plant.growth.rate)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ylab("Plant Growth Rate (mm/week)")


####analysis of variance: the one way ANOVA 
 daphnia <- read.csv("Daphniagrowth.csv")
glimpse(daphnia) 
ggplot(daphnia, aes(x = parasite, y = growth.rate)) +
  geom_boxplot() +
  theme_bw()
####visualize categorical data
ggplot(daphnia, aes(x = parasite, y = growth.rate)) +
  geom_boxplot() +
  theme_bw()
coord_flip()
### construct the ANOVA
model_grow <- lm(growth.rate ~ parasite, data = daphnia)
####check the assumption
 autoplot(model_grow, smooth.colour = NA)
anova(model_grow)
summary.aov(model_grow)


####get  the mean growth rate
sumDat <- daphnia %>%
group_by(parasite) %>%
  summarise(meanGR = mean(growth.rate))
sumDat

