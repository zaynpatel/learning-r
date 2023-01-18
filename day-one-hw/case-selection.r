library(datasets)

head(iris)

hist(iris$Petal.Length)
summary(iris$Petal.Length)

summary(iris$Species)

# select by category
hist(iris$Petal.Length[iris$Species == "versicolor"],
     main = "Petal Length: Versicolor")
#hist(iris$Petal.Length[iris$Species == "virginica"],
     #main = "Petal Length: Virginica")
#hist(iris$Petal.Length[iris$Species == "setosa"],
     #main = "Petal Length: Setosa")

# select by value
hist(iris$Petal.Length[iris$Petal.Length < 4], 
     main = "Petal Length < 2")
hist(iris$Petal.Length[iris$Species == "virginica" & iris$Petal.Length < 4.5],
     main = "Petal Length: Short Virginica")
summary(iris$Petal.Length)

# create subsample
i.setosa <- iris[iris$Species == "setosa",]
