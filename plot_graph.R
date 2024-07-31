###exercise 1
##plot a graph with x^2 on the y-axis and x on the x-axis
library(ggplot2)
x <- seq(-10,10,0.1)
y<-x^2
qplot(x,y, geom = "line")
