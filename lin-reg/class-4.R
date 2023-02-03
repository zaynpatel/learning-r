df <- read.csv('~/Downloads/Data/bike_share.csv')
summary(df)
df$season <- as.factor(df$season)
# create levels out of season
levels(df$season) <- c('Winter', 'Spring', 'Summer', 'Fall')
?ggplot2
df_stacked <- reshape(df, direction='long', 
                      idvar = 'hoursSinceStart',
                      timevar = 'segment',
                      v.names = 'total',
                      varying = c('registered', 'casual'),
                      times = c('registered', 'casual'))

ggplot(df_stacked, aes(y=weekday)) + geom_boxplot(aes(x=df_stacked$total))
