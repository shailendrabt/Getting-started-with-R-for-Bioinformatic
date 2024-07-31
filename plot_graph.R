###exercise 1
##plot a graph with x^2 on the y-axis and x on the x-axis
library(ggplot2)
x <- seq(-10,10,0.1)
y<-x^2
qplot(x,y, geom = "line")

###exercise 2
##plot a graph with sine x on the y-axis and x on the x-axis
library(ggplot2)
x <- seq(0,8*pi,0.1)
y<-sin(x)
qplot(x,y, geom = "line")

###exercise 3
### plot a histogram of 1000 random normal deviates
library(ggplot2)
x <- rnorm(1000)
qplot(x)
