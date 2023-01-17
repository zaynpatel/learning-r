# load package
library(datasets)

# explore data
?mtcars
head(mtcars)

# barplot(mtcars$cyl)

cylinders <- table(mtcars$cyl)
barplot(cylinders)
plot(cylinders)
