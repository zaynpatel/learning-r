df <- read_csv('~/Downloads/Data/bike_share.csv')
View(df)

# data management (messy code!)
df$month <- as.factor(df$month)
df$weekday <- as.factor(df$weekday)
df$season <- as.factor(df$season)
df$holiday <- as.factor(df$holiday)
df$workingday <- as.factor(df$workingday)
df$weather <- as.factor(df$weather)

# plotting the data
library(ggplot2)

### Comparison

# line chart (compare across time)
ggplot(df, aes(x=hoursSinceStart, y=total)) + geom_line() + xlim(0, 500) + ylim(0, 250)

# bar by count (compare across category)
ggplot(df, aes(x=season)) + geom_bar()

#bar by total
ggplot(df, aes(x=season, y=total)) + geom_bar(stat='identity')

### Distribution (Distributed across a range)

#histogram
ggplot(df, aes(x=total)) + geom_histogram(bins=20)

#boxplot
ggplot(df, aes(x=total)) + geom_boxplot()

# heat maps
ggplot(df, aes(x=weekday, y=month, fill=casual)) + geom_tile(stat='sum')
ggplot(df, aes(x=weekday, y=month, fill=registered)) + geom_tile(stat='sum')

### Relationship (relationship between two numeric vars)

# scatterplot
ggplot(df, aes(x=atemp, y=total)) + geom_point()

# add a trend line (lm for linear model)
ggplot(df, aes(x=atemp, y=total)) + geom_point() + geom_smooth(method='lm')

### Composition (breakdown by category)

# stacked bar charts
ggplot(df, aes(x=month, y=registered, fill=workingday)) + geom_bar(stat='identity')
ggplot(df, aes(x=month, y=casual, fill=workingday)) + geom_bar(stat='identity')
