pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, plotly, rio, rmarkdown, shiny, stringr, tidyr)
library(datasets)

head(mtcars)

# select variables via this method
cars <- mtcars[, c(1:4, 6:7, 9:11)]
head(cars)

hc <- cars %>%
      dist %>%
      hclust
plot(hc)

rect.hclust(hc, k = 2, border = "gray")
rect.hclust(hc, k = 3, border = "blue")
rect.hclust(hc, k = 4, border = "green4")
rect.hclust(hc, k = 5, border = "darkred")
