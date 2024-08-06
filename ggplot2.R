
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
 geom_point() +
  scale_color_manual(values = c(Grazed = "brown", Ungrazed = 
                                  "green"))
eg_box + 
  scale_y_continuous(breaks = seq(from = 10, to = 150, by = 20),
                     trans = "log10")
####the theme
eg_scatter +
  theme(
    panel.background = element_rect(fill = NA, colour = "red"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(colour = "black")
  )
####some theme() syntax about axis title and tick marks
eg_box +
  theme(
    axis.title.x = element_text(colour = "cornflowerblue",
    size = rel(2)),
    axis.text.x = element_text(angle = 45, size = 13, vjust = 0.5)
  )
eg_box + scale_x_discrete(limits = c("Ungrazed", "Grazed"),
                          labels(c("Control", "Grazed"))
ggplot(compensation, aes(x = Root, y = Fruit, colours(Grazing)) +
         geom_point() +
         theme(legand.key = element_rect(fill = NA))
       
ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing)) +
  geom_point() +
  theme(legand.position = "none")
