# remove variables and values from global environment
rm(BostonHousing, df, model, test, testing, training, N, trainingCases, trainingSize)

source('~/Downloads/Data/BabsonAnalytics.R')
library(rpart)
library(rpart.plot)
View(df)

# load the data
df = read.csv('~/Downloads/Data/ToyotaCorolla.csv')

#' Goal of our model is to predict target price and we're using decision trees to understand what the most important inputs are
#' Linear regression would give us a value for a numerical target but assumes the relationship between inputs of a car and value is linear, which it's not.

# data management
# remove df$Model because it's categorical and can lead to overfitting
df$Model = NULL
df$Fuel_Type = as.factor(df$Fuel_Type)
df$Automatic = as.factor(df$Automatic)
df$Met_Color = as.factor(df$Met_Color)
#df$Doors = as.factor(df$Doors)

# partition the data
set.seed(1234)
N = nrow(df)
trainingSize = round(N * 0.6)
trainingCases = sample(N, trainingSize)
training = df[trainingCases, ]
testing = df[-trainingCases, ]

# build the model
# a decision 
model = rpart(Price ~., data=training)
# predictions is the model's predictions of the cars
predictions = predict(model, testing, type="vector")
# observations is the actual price of cars
observations = testing$Price
errors = observations - predictions

# check error rate
mape = mean(abs(predictions - observations))
rmse = sqrt(mean(errors^2))
prediction_bench = mean(training$Price)
errors_bench = observations - prediction_bench
rmse_bench = sqrt(mean(errors_bench^2))
mape_bench = mean(abs(errors_bench/observations))

stopping_rules = rpart.control(minsplit = 20, minbucket = 10, cp=0)
model = rpart(Price ~., data=training, control=stopping_rules)
#rpart.plot(model)

# works b/c model is redefined based on stopping_rules
predictions_overfit = predict(model, testing, type="vector")
error_overfit = sum(predictions_overfit != observations)/nrow(testing)

model = easyPrune(model)
predictions_pruned = predict(model, testing, type="vector")
error_pruned = sum(predictions_pruned != observations)/nrow(testing)
mape_pruned = mean(abs(error_pruned/observations))

model = rpart(Price ~., data=training)
# Compute the statistical mode for Doors
door_mode <- names(sort(table(df$Doors), decreasing = TRUE))[1]

# Compute the statistical mode for Fuel_Type
fuel_mode <- names(sort(table(df$Fuel_Type), decreasing = TRUE))[1]

# Compute the statistical mode for Automatic
auto_mode <- names(sort(table(df$Automatic), decreasing = TRUE))[1]

# Compute the statistical mode for Met_Color
color_mode <- names(sort(table(df$Met_Color), decreasing = TRUE))[1]

# Construct the typical car data frame with median and mode values
typical_car <- data.frame(Age = median(df$Age),
                          KM = median(df$KM),
                          HP = median(df$HP),
                          cc = median(df$cc),
                          Doors = door_mode,
                          Fuel_Type = fuel_mode,
                          Automatic = auto_mode,
                          Met_Color = color_mode,
                          Weight = median(df$Weight))

# Create a new car with specified age and mileage
new_car <- data.frame(Age = 70,
                      KM = 100000,
                      HP = typical_car$HP,
                      cc = typical_car$cc,
                      Doors = typical_car$Doors,
                      Fuel_Type = typical_car$Fuel_Type,
                      Automatic = typical_car$Automatic,
                      Met_Color = typical_car$Met_Color,
                      Weight = typical_car$Weight)

# Predict the price of the new car using the decision tree model
price_estimate <- predict(model, newdata = new_car)
round(price_estimate)

View(new_car)
new_car$Age <- 70
new_car$KM < 100000
price_estimate <- predict(model, new_car, type = "vector")
price_estimate <- round(price_estimate)

typical_car <- data.frame(Age = median(df$Age),
                          KM = median(df$KM),
                          HP = median(df$HP),
                          cc = median(df$cc),
                          Doors = door_mode,
                          Fuel_Type = fuel_mode,
                          Automatic = auto_mode,
                          Met_Color = color_mode,
                          Weight = median(df$Weight))

newer_car <- data.frame(Age = 50,
                      KM = 90000,
                      HP = typical_car$HP,
                      cc = typical_car$cc,
                      Doors = typical_car$Doors,
                      Fuel_Type = typical_car$Fuel_Type,
                      Automatic = typical_car$Automatic,
                      Met_Color = typical_car$Met_Color,
                      Weight = typical_car$Weight)

newer_car$Age <- 50
newer_car$KM < 90000
price_estimate <- predict(model, newer_car, type = "vector")
price_estimate <- round(price_estimate)


# question 4
#' minsplit param in stopping rules represents where the tree is being split and putting a 0 means it's going to split everywhere (at each node) until it has one observation. this is overfitting.
#' minbucket means each node will contain one observation, which also means overfitting. 
#' cp controls tradeoff between accuracy of the model and the complexity of the tree. a low cp value means a more complex tree and a higher cp means simpler tree. 