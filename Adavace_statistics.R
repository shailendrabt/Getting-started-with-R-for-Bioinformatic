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
autoplot(model_cow, smooth.colour = NA)


library(ggfortify)
####model output and more biology
anova(model_cow)
####for summary table
summary(model_cow)


####STATS BACK TO GRAPHICS
###calculate mean and sd of gain for all 12 combinations
sumMoo <- growth.moo  %>%
  group_by(diet, supplement) %>%
  summarise(
    meanGrow = mean(gain),
    seGrow = sd(gain) / sqrt(n())
  )
ggplot(sumMoo, aes(x = supplement, y = meanGrow,
                   color = diet, group = diet)) +
  geom_point() +
  geom_line() +
  geom_errorbar(aes(ymin = meanGrow - seGrow,
                    ymax=meanGrow + seGrow),width = 0.1) +
  theme_bw()
###Analysis of covariance(ANCOVA)
limp <- read.csv("limpet.csv")
glimpse(limp)
###plot window
ggplot(limp, aes(x = DENSITY, y= EGGS, colour = SEASON)) +
  geom_point() +
  scale_color_manual(values = c(spring = "green", summer = "red"))
####construct the ancova
limp.md <- lm(EGGS ~ DENSITY * SEASON, data = limp)
names(limp.md)
autoplot(limp.md, smooth.colour = NA)
anova(limp.md)
summary(limp.md)

predict(limp.md)
####make some new density values at which we request prediction
new.x <- expand.grid(DENSITY =
                       seq(from = 8, to = 45, length.out = 10))
###check it
head(new.x)
####make some new density values at which we request predictions
new.x <- expand.grid( 
  DENSITY = seq(from = 8, to = 45, length.out = 10),
  SEASON = levels(limp$SEASON)) 
###check it
head(new.x)

####generate fits and confidence interval at new.x values.
new.y <- predict(limp.md, newdata=new.x, 
                 interval = "confidence")

###the final picture using ggplot2

###raw data plot(you dont need to write this again)
ggplot(limp, aes(x = DENSITY, y = EGGS, colour = SEASON))+
###first add the point
  geom_point(size = 5) +
  ###now add the fits and CIs 
  ###note we dont need to specify DENSITY AND EGGS 
  ##the are inherited from above
  addThese <- read.csv("addThese")
  geom_smooth(data = addThese, 
              aes(ymin = lwr, ymax = upr,
                  fill = SEASON), stat = "identity")
