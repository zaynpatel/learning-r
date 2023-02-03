# central tendency imputation: You take the missing values and add them according to the central tendancy. Ex: add all missing values to mode. 
# bootstrapping imputation: Add missing values randomly. 
# predictive imputation: Build a model to predict each of the missing values based on surrounding. 

install.packages('mice')
library(mice)


# read csv
df <- read.csv('~/Downloads/Data/ExpectancyFertility.csv')
# not necessary

idx <- is.na(df$LifeExpectancy)
idx # prints all rows
df$LifeExpectancy[idx] # print the index of missing values

# mice = package (df = data, m=1 = how many imputations, method = what type of imputation method do you want to use?)
impute_mean = mice(df, m=1, method='mean')

?complete # completes a data frame with missing values. In other words, it takes the imputed value and inserts it in. b/c running impute var means you get a new data frame but doesn't mean values are filled.

df_mean <- complete(impute_mean) # complete on impute mean variable, which has data
df_mean$LifeExpectancy[idx]

input_sample <- mice(df, m=1, method='sample')
df_sample <- complete(input_sample)
df_sample$LifeExpectancy[idx]

impute_rf <- mice(df, m=1, method='rf') # using a random forest for predictive imputation
df_rf <- complete(impute_rf)
output_rf <- df_rf$LifeExpectancy[idx]

impute_cart <- mice(df, m=1, method='cart')
df_cart <- complete(impute_cart)
output_cart <- df_cart$LifeExpectancy[idx]

# how far off were errors from each other
ensemble_errors <- abs(output_rf - output_cart)
print(ensemble_errors)

### binning
binned = cut(df$LifeExpectancy, c(3, 4, 5)) # cut means how many bins
levels(binned) = c('Low', 'Medium', 'High')

### clustering
model = kmeans(df_cart, centers=3) # using df_cart b/c kmeans can't take data with missing values
View(model)
plot(df, col=model$cluster[1:20]) # these are cluster values
cluster = as.factor(model$cluster)