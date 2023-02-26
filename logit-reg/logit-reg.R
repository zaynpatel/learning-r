rm(BostonHousing, df, test)

# load data
df <- read.csv('~/Downloads/Data/BostonHousing.csv')

# manage data
# target is ISHIGHVAL - target needs to be a logical value for logistic regression to work
df$ISHIGHVAL <- as.logical(df$ISHIGHVAL)
df$MEDV <- NULL
df$CHAS <- as.logical(df$CHAS)
df$RAD <- as.factor(df$RAD)

# partitian data
N <- nrow(df)
trainingSize <- round(N * 0.6)
trainingCases <- sample(N, trainingSize)
training = df[trainingCases, ]
testing = df[-trainingCases, ]

# build model
model = glm(ISHIGHVAL ~ ., data=training, family=binomial)
# ?glm - wanted to know properties of general linear model
model = step(model)
summary(model)

# predict
predictions = predict(model, testing, type="response")
# create a true false representation predictions where the 'cutoff' is whether the value is greater than 5 or not
predictionsTF = predictions > 0.5
observations = testing$ISHIGHVAL

table(predictionsTF, observations)

# measure performance
source('~/Downloads/Data/BabsonAnalytics.R')
error_rate = sum(predictionsTF != observations)/nrow(testing)
error_bench = benchmarkErrorRate(training$ISHIGHVAL, testing$ISHIGHVAL)
summary(predictionsTF)
sensitivity = sum(predictionsTF == TRUE & observations == TRUE)/sum(observations == TRUE)
specificity = sum(predictionsTF == FALSE & observations == FALSE)/sum(observations == FALSE)

ROCChart(observations, predictions)
