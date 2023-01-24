### slicing data
df <- read.csv('~/Downloads/Data/BostonHousing.csv')

# look at the structure of the dataset
str(df)

# slice for row 1, column 3
df[1,3]

# slice column 1
df [ ,1]
# slice row 1
df[1, ]

# slice for columns one and two
df[1:2]

# slice for rows 1:10
df[1:10, ]

# now you can reference this subset by assignment
test <- subset(df[ , c("CRIM", "NOX", "TAX")])
test

### typecasting

# change $CHAS from dummy var to True/False
df$CHAS = as.logical(df$CHAS)
df$RAD = as.factor(df$RAD)
df$ISHIGHVAL = as.logical(df$ISHIGHVAL)
