These are some notes I have after the first three days of R practice. 

Included:

- How to install packages
- Syntax and logic with code examples including how to plot, statistics commands, data types, and more.
- Videos in RStudio explaining the plot types and layout.

This code is on GitHub and if you’d like to see R in a project-setting, I tested my knowledge with a COVID dataset yesterday. 

### ****************packages****************

R, like many programming languages, has two types of packages. There are base packages (pre-installed) and contributed packages (packages other developers have created for use in r that require an `install.packages("test")` command). 

There are two steps to use a package in R:

```r
# step 1:
install.packages("test")

# step 2:
library(packages) # won't print anything to console
require(packages)
```

`install.packages()` is similar to `pip install` in python. When you type in "pip install" followed by a package name, **the computer uses the pip command to install the specified package from the Python Package Index (PyPI) to your system**. Pip is a package management system for Python that allows you to install and manage software packages written in Python. The package name that you specify after "pip install" tells pip which package to download and install. Once the package is installed, it can be imported and used in your Python code. 

`library(packages) & require(packages)` in R are similar commands to `import pandas as pd` in Python. The programmers goal is to load these packages into their environment so they can make calls to those libraries. When either of these commands are run, the packages file in the bottom right of RStudio will check off the package. 

Another way to think about this is, install in R makes the package available on the computer’s hard drive but loaded makes it accessible to current routines. 

If a programmer wants to remove a package from the session/script they’re using, they should use the detach function. `detach()` ”unloads” a package and when this function is run on a package (ex: `detach("package:dplyr", unload=TRUE)`) it will no longer be available. The only way for it to reenter the session is if the programmer completes the steps in the code block above, again. 

While installing packages, the console will be giving the programmer progress updates on which packages are installed and the average time for upcoming package to be complete. `cat("\014")` is the command to clear the console. 

In R, the command `pacman`, is an abbreviation for package manager. This command can be used to install many of the common base/contributed packages in R. 

For example:

```r
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, plotly, rio, rmarkdown, shiny, stringr, tidyr)
```

In R, the double colon (::) operator is used to access a specific function or data from a package, without loading the entire package. This is also known as "namespace" or "scope" operator.

For example, suppose you want to use the function "filter()" from the "dplyr" package, but you don't want to load the entire package. Instead of loading the package with the library() or require() function, you can use the double colon operator to directly access the function:

`dplyr::filter(data, condition)`

This tells R to look for the "filter()" function within the "dplyr" package and use it on the data and condition provided. This can be useful when you only need to use a few specific functions from a package, rather than loading the entire package and all of its functions, data, and documentation.

The double colon operator can also be used to access the data within a package. For example, to access the "mtcars" data set from the "datasets" package, you can use :

`datasets::mtcars`

This command will give you the mtcars data set without loading the entire "datasets" package.

### ************syntax & logic************

**To explore data:**

`?mtcars`: In this example, I’m using the mtcars (motor trend cars) dataset, but the question mark (?) before any dataset will open the help screen at the bottom right of RStudio so programmers can access documentation without needing to leave the platform. 

`head(mtcars)`: No different than pandas, this command shows the first 6 columns of data. 

**********************************************Variables:**********************************************

In R, the `<-` operator is used to assign values to variables. It is also known as the "assignment operator."

When you use the `<-` operator, the value on the right side of the operator is assigned to the variable on the left side. For example, the following code assigns the value 10 to the variable "x":

`x <- 10`

This is equivalent to the following code using the `=` operator:

`x = 10`

You can also use the `<-` operator to assign values to multiple variables at once, like this:

`x <- y <- z <- 10`

This code assigns the value 10 to x, y, and z all at once, in that order.

You can also use the `<-` operator to assign the results of an expression or function to a variable. For example, the following code assigns the result of the mean() function applied to the mtcars dataset to the variable "average":

`average <- mean(mtcars)`

This will give you the average of the mtcars data set.

It's important to note that the `<-` operator is direction sensitive, meaning that the value will be assigned to the variable on the left side of the operator.

********************Plotting:******************** 

To create a summary table:

`cylinders <- table(mtcars$cyl)` use the `table` keyword. Without this keyword, a barplot will plot every datapoint in the cylinder row messily and unreadably. Summary tables are necessary based on the type of plot you plan to use. 

The `$` in front of `cyl` specifies the row you’d like to create a summary table of. `$ is to R as . is to Python.`

To create plots: 

*(Syntax)*

`barplot(cylinders)`

`plot(cylinders)` The plot keyword doesn’t have a specific plot, R will serve the plot that explains the data, visually, the best. 

`hist(cylinders)` for histograms. Below is a code example.

```r
# in line 1, I'm using a list index to specify what category from the Petal.Width row I'd like to plot.
hist(iris$Petal.Width [iris$Species == "setosa"], 
		# the c stands for concatenate, similar to ^ in OCaml or + in Python.
		# x lim limits the x-axis to 4 spots
     xlim = c(0, 3), 
		# breaks is the number of histogram bars I'd like in the chart. R doesn't usually obey this. 
     breaks = 9, 
     main = "Petal Width for Setosa", 
     xlab = "", 
		# col is an abbreviation for color
     col = "red")
```

```r
# select by value
hist(iris$Petal.Length[iris$Petal.Length < 4], 
     main = "Petal Length < 2")
hist(iris$Petal.Length[iris$Species == "virginica" & iris$Petal.Length < 4.5],
     main = "Petal Length: Short Virginica")
summary(iris$Petal.Length)

# create subsample
i.setosa <- iris[iris$Species == "setosa",]
```

*(Explanations)*

Video on Barplots

[Video on Histograms](https://www.loom.com/share/4848fcf0edeb4a12880183ba10620327)

[Video on Plots](https://www.loom.com/share/574b46dcea9b459bb4f961d04b59d569)

[Video on overlapping plots](https://www.loom.com/share/a50712d895d64eabb856f049b92ae136)

[Video on hierarchial clustering](https://www.loom.com/share/3474242c19da4548928b7f914f838dac)

[Video on principal component analysis](https://www.loom.com/share/bce95b219f2242419e933e736fba6354)

****************************************Statistics commands:****************************************

`describe()` is used for descriptive statistics. Below is an example console output for the `iris` dataset after this command was run.

![Screen Shot 2023-01-19 at 3.15.53 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9b5bf79d-c0d9-4cb4-a479-ff7fe3460b69/Screen_Shot_2023-01-19_at_3.15.53_PM.png)

`summary()` is used to display summary statistics. Below is a console output for the `iris` dataset after this command was run.

![Screen Shot 2023-01-19 at 3.17.17 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6efe083e-3f02-43b5-a5c2-64d4ecd41858/Screen_Shot_2023-01-19_at_3.17.17_PM.png)

`factor()` or `as.factor()` are a data type used to store categorical variables. Categorical variables are variables that can take on a limited number of values, such as "male" or "female" for a variable representing gender. Factors are used to store these variables in a way that allows them to be used in statistical analyses in R. Factors are also used to store ordinal variables, which are variables that have an inherent order, such as "low", "medium", and "high". Factors are stored as integers and a mapping between the integers and the actual categorical values is stored as levels (ex: `levels()` in the factor). 

```r
df4 <- cbind.data.frame(x4, y)
df4$x4 <- factor(df4$x4, 
					# 3 quant labels defined that map to categorical labels
          levels = c(1, 2, 3), 
          labels = c("macOS", "Windows", "Linux"))
df4
```

`scan()` is similar to `input()` in python. They both take user input from the console. 

`rep()` is for repetition. 

```r
x7 <- rep(TRUE, 5) # repeat TRUE five times
```

************************Data types:************************ 

`is.vector()` outputs a bool to tell a programmer if a variable is a vector or not. In R, a vector is a 1D array. 

`is.matrix()` is similar to `is.vector()` in its output. In R, a matrix is a 2D array. 

`cbind` is similar to the `c` keyword. They both concatenate. `cbind` is used for variables whereas `c` is used for numbers. 

`as.data.frame` will convert vectors of the same length into a dataframe. 

`list` will create a list out of 3 variables that are lists too. 

`coerce` outputs the least restrictive data type so the function works. For example:

```r
(coerce2 <- 5)
typeof(coerce2)

# output = int
```

****************************Importing data****************************

R has a package called `rio` which can be imported with `pacman`. 

To import a csv, txt, or xlsx file:

```r
# importing with rio, starting with csv
rio_csv <- import("~/Desktop/mbb.csv")

# txt import
rio_txt <- import("~/Desktop/mbb.txt")

#xlsx import
rio_xlsx <- import("~/Desktop/mbb.xlsx")
```

To read table data, the programmer needs to specify a separator so the computer knows how to create the table. For example:
# error message because it's not specific enough
r_txt1 <- read.table("~/Desktop/mbb.txt", header = TRUE)

# correct because sep = "\t" is included
r_txt2 <- read.table("~/Desktop/mbb.txt", header = TRUE, sep = "\t")
