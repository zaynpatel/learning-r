source('~/Downloads/Data/BabsonAnalytics.R')
library(ggplot2)

df <- read.csv('~/Downloads/Data/BostonHousing.csv')
# remove all non-numeric inputs because KNN is distance based/doesn't work with integer values
df$CHAS = NULL
df$RAD = NULL

df$ISHIGHVAL = as.factor(df$ISHIGHVAL)
# have to remove because it can clutter the final value
df$MEDV = NULL

N = nrow(df)
trainingSize = round(N * 0.8)
trainingCases = sample(N, trainingSize)
training = df[trainingCases, ]
test = df[-trainingCases, ]

# build model + make predictions
predictions = kNN(ISHIGHVAL ~., training, test, k=3)
