####GENERALIZED LINEAR MODEL(GLM)
###COUNTS AND PROPORTIONS AND GLM 
setwd() ###set path
soay <- read.csv("SoaySheepFitness.csv")
glimpse(soay)
###create plot
ggplot(soay, aes(x = body.size, y = fitness)) +
  geom_point()+
  geom_smooth(method = "lm", se = FALSE) +
  geom_smooth(span = 1, colour = "green", se = FALSE) +
  xlab("body mass(kg)") + ylab("Lifetime fitness")
soay.glm <- glm(fitness ~ body.size, data = soay,
                family = poisson)
soay.glm <- glm(fitness ~ body.size, data = soay,
                family = poisson(link = log))
autoplot(soay.glm, smooth.colour = NA)
anova(soay.glm)
anova(soay.glm, test = "Chisq")
summary(soay.glm)
###note our of the $ to get the body.size column\
min.size <- min(soay$body.size)
max.size <- max(soay$body.size)
new.x <- expand.grid(body.size = 
                       seq(min.size, max.size, length = 1000))
####generate fit and standard error at new.x values
new.y = predict(soay.glm, newdata = new.x, se.fit = TRUE)
new.y = data.frame(new.y)
###check it 
head(new.y)
###housekeeping to bring new.x and new.y together
addThese <- data.frame(new.x, new.y)
addThese <- rename(addThese, fitness = fit)
###check it
head(addThese)

addThese <- mutate(addThese,
                   lwr = fitness - 1.96 * se.fit,
                   upr = fitness + 1.96 * se.fit)
####now the plot on the correct scale
ggplot(soay, aes(x = body.size, y = fitness)) + 
  ###show the row data
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(data = addThese,
              aes(ymin = lwr, ymax = upr), stat = "identity") +
  theme_bw()
summary(soay.glm)

