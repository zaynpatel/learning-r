df <- read.csv('~/Downloads/Data/ToyotaCorolla.csv')

# view in full csv format
View (df)

# type casting = reassign primitive data type to another
# type checking = print out current type

#typeof('Fuel_Type')
### mistake 1- if you write command class('Model') default will return character b/c Model is inputted as string. run df$[] b/c that's part of dataframe.
#class('Fuel_Type')
#class('Model')
#class('HP')

# convert df$HP to integer
as.integer(df$HP)
class(df$HP)

class(df$Model) # character
class(df$Fuel_Type) # character (should be factor)
class(df$Met_Color) # integer

# convert to factor
df$Fuel_Type <- as.factor(df$Fuel_Type)
class(df$Fuel_Type)

df$Automatic <- as.logical(df$Automatic)
class(df$Automatic)

# slice to find 1000th value of HP
df$HP[1000]

# slice to find value in 4th column, 123rd row
df[123, 4]

# most appropriate description: slice for rows 1:10, no restriction on columns (empty space)
df[1:10, ]