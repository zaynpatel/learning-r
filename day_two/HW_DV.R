df <- read.csv('~/Downloads/Data/bike_share.csv')
View(df)

library(ggplot2)

# syntax [ggplot(df, aes=(x=[], y=[])) + geom_insert()]

ggplot(df, aes(x=hoursSinceStart, y=registered)) + geom_line() + xlim(0, 500) + ylim(0, 250)

ggplot(df, aes(x=registered)) + geom_histogram(bins=20)
ggplot(df, aes(x=casual, y=weather)) + geom_line()
class(df$weather)
levels(df$weather) # 4 levels, data dictionary shows you what they mean

ggplot(df, aes(x=hoursSinceStart, y=casual)) + geom_line() + xlim(1450, 3450) + ylim(0, 300)