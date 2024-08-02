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
> t.test(Ozone ~ Garden.location, data = ozone)
output #[] Welch Two Sample t-test

data:  Ozone by Garden.location
t = 4.2363, df = 17.656, p-value = 0.0005159
alternative hypothesis: true difference in means between group East and group West is not equal to 0
95 percent confidence interval:
  8.094171 24.065829
sample estimates:
mean in group East mean in group West 
             77.34              61.26 


> var.test(Ozone ~ Garden.location, data = ozone)

output (##	F test to compare two variances

data:  Ozone by Garden.location
F = 0.75503, num df = 9, denom df = 9, p-value = 0.6823
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 0.1875386 3.0397437
sample estimates:
ratio of variances 
         0.7550293 )

