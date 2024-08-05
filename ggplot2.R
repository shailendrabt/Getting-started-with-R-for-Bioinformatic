
###Pimping your plots: scales and themes in ggplot2
###BASE scatter plot
compensation <- read.csv("compensation.csv")
glimpse(compensation)
eg_scatter <- 
  ggplot(data = compensation, aes(x = Root, y = Fruit)) +
  geom_point()
### Base box and whisker plot
eg_box <- 
  ggplot(data = compensation, aes(x = Grazing, y = Fruit)) +
  geom_boxplot()
eg_scatter+theme_bw()
grid.arrange(eg_scatter, eg_box, nrow = 1)
eg_scatter + xlab("Root Biomass") + ylab("Fruit Production")
eg_scatter + ggtitle("My SUPERB title")
eg_scatter+ labs(title = "My useless title",
                 x= "Root Biomass", y = "Fruit Production")
eg_scatter +xlim(9,15) + ylim(0,10)
eg_scatter +
  annotate("text", x = c(6,8), y = c(105,25),
           label = c("Text up here...",  "and  text down here")
eg_scatter + scale_alpha_continuous(limits = c(4, 11), breaks = 4:11)
ggplot(data = compensation, aes(x = Root, y = Fruit, colour = Grazing))          
