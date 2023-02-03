# load the data
df <- read.csv('~/Downloads/Data/ToyotaCorolla.csv')

# manage the data
df$Model = NULL # used to remove a value from df
df$Met_Color = as.logical(df$Met_Color)
df$Automatic = as.logical(df$Automatic)

# partitian the data - split into training and test
N = nrow(df)
trainingSize = round(N*0.6)
trainingCases = sample(N, trainingSize)
training = df[trainingCases, ]
# everything but the training cases
test = df[-trainingCases, ]
addition = nrow(training) + nrow(test)

# build the model
model <- lm(Price ~ ., data=training) # read this as: price as a function of all columns in the training dataset
model <- step(model) # process stops at <none> keyword, uses AIC to find the model that explains the most variation and penalizes models for excessive param numbers
summary(df) # prints summary statistics of the model so we know the coef significance via p-values

# make predictions
predictions = predict(model, test)
observations = test$Price
errors = observations - predictions

# evaluate performance
rmse = sqrt(mean(errors^2))
mape = mean(abs(errors/observations))

# benchmarking (checking to see if I need a model based on what I would've predicted without it)
prediction_bench <- mean(training$Price) # best guess is the mean
errors_bench <- observations - prediction_bench # test$Price - training$Price
rmse_bench <- sqrt(mean(errors_bench^2))
mape_bench <- mean(abs(errors_bench/observations)) # be 25% off w/out model, 9% off with model

# definitions
# underfitting: model is not complex enough to fully capture predictive power of data it's trained on. 
# overfitting: model fits exactly to its training data set. vulnerable when exposed to test data, high error rate.
# data leakage: when you are trying to find the best model and begin using data from the testing set to build the model. 
# forward selection: when building a model, to find the best one, you can begin with inputs that explain data the best, adding the second and third best over time. 
# backward selection: begin with all data and remove columns that don't explain the data well until you reach the best model fit. 