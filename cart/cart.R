source('/Users/zaynpatel/Downloads/Data/BabsonAnalytics.R')
install.packages('rpart')
install.packages('rpart.plot')
library(rpart)
library(rpart.plot)

df = read.csv('~/Downloads//Data/eBayAuctions.csv')
View(df) # console command

# change df$Competitive to a factor
df$Competitive = as.factor(df$Competitive)

# concatenate factor in this format because of R alphabetical rules
# 'Yes', 'No' changes what's a zero versus a one
levels(df$Competitive) = c('No', 'Yes')

# goal is to predict close price so we can't have it in our training set b/c we'll already know if it was competitive
df$ClosePrice = NULL

N = nrow(df)
trainingSize = round(N * 0.6)
trainingCases = sample(N, trainingSize)
training = df[trainingCases, ]
testing = df[-trainingCases, ]

# load model and decide what we're predicting as a function of what
model = rpart(Competitive ~ ., data=training)
# read the plot from top down to figure out what the model thinks is most important
# example: the top node description (in this case: OpenPrice >= 1.2) is what the model thinks is the most important criterion
rpart.plot(model)

# "class" returns factor levels of our test variable (which is binary - is the competitiveness 1 or 0)
predictions = predict(model, test, type="class")
