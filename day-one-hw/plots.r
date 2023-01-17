library(datasets)
head(iris)

# test to see documentation
?plot

plot(iris$Species)
plot(iris$Petal.Length)
plot(iris$Species, iris$Petal.Width)
plot(iris$Petal.Length, iris$Petal.Width)

# matrix plot for all data
plot(iris)

# plot with options 
plot(iris$Petal.Length, iris$Petal.Width, 
     col = "#cc0000", 
     pch = 19, 
     main = "Iris: Petal Length vs. Petal Width", 
     xlab = "Petal Length", 
     ylab = "Petal Width")

plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)

plot(dnorm, -3, +3, 
     col = "#cc0000", 
     lwd = 5, 
     main = "Standard Normal Distribution",
     xlab = "z-scores", 
     ylab = "density")
