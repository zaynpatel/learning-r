pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, plotly, rio, rmarkdown, shiny, stringr, tidyr)

# importing with rio, starting with csv
rio_csv <- import("~/Desktop/mbb.csv")
head(rio_csv)

# txt import
rio_txt <- import("~/Desktop/mbb.txt")
head(rio_txt)

#xlsx import
rio_xlsx <- import("~/Desktop/mbb.xlsx")
head(rio_xlsx)

?View
View(rio_csv)

# read table data
# error message because it's not specific enough
r_txt1 <- read.table("~/Desktop/mbb.txt", header = TRUE)

r_txt2 <- read.table("~/Desktop/mbb.txt", header = TRUE, sep = "\t")
head(r_txt2)
