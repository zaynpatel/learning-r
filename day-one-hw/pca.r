pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, plotly, rio, rmarkdown, shiny, stringr, tidyr)
library(datasets)

cars <- mtcars[, c(1:4, 6:7, 9:11)]
head(cars)

# compute pca
pc <- prcomp(cars, 
             center = TRUE, 
             scale = TRUE)
summary(pc)
plot(pc)
