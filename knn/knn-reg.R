# clear global environment
remove('BostonHousing', 'df', 'test')

df = read.csv('/Users/zaynpatel/Downloads/Data/BostonHousing.csv')
df

# remove non-numeric variables
df$CHAS = NULL
df$RAD = NULL
df$ISHIGHVAL = NULL

# standardize and normalize (data management steps)
processor = preProcess(df[, 1:10], c('center', 'scale'))
df = predict(processor, df)

N = nrow(df)
# build training set
trainingSize = round(N * 0.8)
# random sample the training set with total rows and trainingSize requested
trainingCases = sample(N, trainingSize)
training = df[trainingCases, ]
test = df[-trainingCases, ]
nrow(test) # 101 (like to print and see how many there are)

# build model
install.packages('caret')
library(caret)
#knnCrossVal(MEDV ~. , data=training)

model = knnreg(MEDV ~. , data=training, k=3)

# predictions (model = what you've built with predictor variable, test = the dataset you want to use the model on)
predictions = predict(model, test)

# evaluate (observations = hasn't gone through the model, these are the data points we're pulling from the test variable)
observations = test$MEDV
errors = observations - predictions
errors
#math = observations[1] - predictions[1]

#notes:
##Normalization typically scales each feature to have a range between 0 and 1, while standardization scales each feature to have a mean of 0 and a standard deviation of 1.
