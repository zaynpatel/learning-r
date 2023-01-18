rm(list = ls())
install.packages("Hmisc")
library(Hmisc)

data <- read.csv("~/Downloads/archive (2)/COVID19_line_list_data.csv")
describe(data)

# clean death column
data$death_dummy <- as.integer(data$death != 0)
# write unique(data$death_dummy) in console to remove duplicate values

# death rate
sum(data$death_dummy) / nrow(data)

# age
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
#subtract = diff(test_a - test_b)
#subtract

# is this statistically significant?
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.95)
