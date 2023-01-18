(x1 <- 1:4)
(y <- 1:12)

(combine <- cbind.data.frame(x1, y))
combine

# as factor
(x2 <- as.factor(c(1:3)))
(df2 <- cbind.data.frame(x2, y))
typeof(df2$x2)
# str = structure, not string
str(df2)

# define existing variable as factor
x3 <- c(1:3)
df3 <- cbind.data.frame(x3, y)
(df3$x3 <- factor(df3$x3, 
            levels = c(1, 2, 3)))

x4 <- c(1:3)
df4 <- cbind.data.frame(x4, y)
df4$x4 <- factor(df4$x4, 
          levels = c(1, 2, 3), 
          labels = c("macOS", "Windows", "Linux"))
df4

# entering data

# scan is similar to input() in .py
s6 <- scan()

# rep for repetition
x7 <- rep(TRUE, 5) # repeat TRUE five times
x7

x8 <- rep(c(TRUE, FALSE), 5)
x8

# non-collated, shows param1 then param2
x9 <- rep(c(TRUE, FALSE), each = 5)
x9
