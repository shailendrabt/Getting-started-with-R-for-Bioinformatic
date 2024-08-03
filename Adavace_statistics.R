##########     #################                  ADVANCED STATISTICS              ###########         ###############
###load library
library(ggplot2)
growth.moo <- read.csv("growth.csv")
glimpse(growth.moo)

#### Step-1 dplyr summary data
sumMoo <- growth.moo %>%
  group_by(diet, supplement) %>%
  summarise(meanGrow = mean(gain))
sumMoo
###Step-2 ggplot2() interaction plot
ggplot(sumMoo, aes(x= supplement, y = meanGrow)) +
  geom_point() +
  theme_bw()

### specifying both colour
ggplot(sumMoo, aes(x= supplement, y = meanGrow, 
                   colour = diet, group = diet)) +
  geom_point() +
  geom_line() +
  theme_bw()
###specifying this trick formula and the data frame
model_cow <- lm(gain ~diet * supplement, data = growth.moo)
###so lets build those four plots
