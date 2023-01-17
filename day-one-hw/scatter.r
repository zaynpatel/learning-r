library(datasets)

# check univariate dist
hist(mtcars$wt)
hist(mtcars$mpg)

# basic x-y plot
plot(mtcars$wt, mtcars$mpg, 
     pch = 19, 
     cex = 1.5, 
     col = "#cc0000", 
     main = "MPG as a Function of Weight of Cars", 
     xlab = "Weight (in 1000 pounds)", 
     ylab = "MPG")
