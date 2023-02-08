df <- read.csv('~/Downloads/Data/BostonHousing.csv')

# data management
df$ISHIGHVAL = NULL
typeof(df$CHAS) # can look at global envir instead
df$CHAS <- as.factor(df$CHAS)
levels(df$CHAS) <- c('Tract does not bound river', 'Tract does bound river')
# index of accessibility to highways, 9 levels
df$RAD <- as.factor(df$RAD)
set.seed(1234)

# partitian the data
N = nrow(df)
trainingSize = round(N*0.6)
trainingCases = sample(N, trainingSize)
training = df[trainingCases, ]
test = df[-trainingCases, ]
full = nrow(training) + nrow(test)
nrow(training)
nrow(test)

# build the model
model <- lm(MEDV ~ ., data=training)
coefs <- coef(model) # extract coefficients of the model
coefs # printed all coefficients

RM <- coefs['RM'] # print the RM coeff only
RM # 4.627926 is value

# performs stepwise regression: Building a linear model by adding/removing one predictor at a time, optimizing for a var. In this case, we're optimizing for lowest AIC. 
# AIC is a measure of goodness-of-fit for a model. The score accounts for the number of parameters and how well those parameters explain the data. AIC is calculated by 2*k-2*log(L) where k is the number of params. 
model <- step(model)

predictions = predict(model, test)
observations = test$MEDV
# what you got versus what you predicted
errors = observations - predictions
errors
errors[1] # print first error vector

# evaluate performance
rmse = sqrt(mean(errors^2))
rmse # 4.83
mape = mean(abs(errors/observations))
mape # 16%

prediction_bench <- mean(training$MEDV)
errors_bench <- observations - prediction_bench # same observation (final values subtracted by the "best guess" or mean.)
rmse = sqrt(mean(errors_bench^2))
rmse # 8.94. Diff between predicted and actual values was 4.11 higher w/out model.
mape = mean(abs(errors_bench/observations))
mape # 31%. Diff between predicted and actual values was 15% higher w/out model.