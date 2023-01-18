# automatic origin. data goes to least restrictive data type. 
# parenthesis around something saves it and shows response. ex: line 76
# numeric

n1 <- 15
n1
typeof(n1)

n2 <- 1.5
n2
typeof(n2)

# character
c1 <- "c"
c1
typeof(c1)

c2 <- "a string of text"
c2
typeof(c2)

l1 <- TRUE
l1
typeof(l1)

l2 <- F

v1 <- c(1, 2, 3, 4, 5)
v1
# is it a vector?
is.vector(v1)

v2 <- c("a", "b", "c")
v2
is.vector(v2)

v3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
v3 # prints out the representation of this variable
is.vector(v3)

# matrix
m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
m1

m2 <- matrix(c("a", "b", 
             "c", "d"), 
              nrow = 2, 
              byrow = T)
m2

# array (rows, columns, tables)
a1 <- array(c(1:24), c(4, 3, 2))
a1

# dataframe - can combine vectors of the same length

vNumeric <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical <- c(T, F, T)

#cbind = combines vectors into one dataframe
dfa <- cbind(vNumeric, vCharacter, vLogical)
dfa

# as.data.frame maintains type integrity
df <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df

o1 <- c(1, 2, 3)
o2 <- c("a", "b", "c", "d")
o3 <- c(T, F, T, T, F)

list1 <- list(o1, o2, o3)

list2 <- list(o1, o2, o3, list1)
(coerce1 <- c(1, "b", TRUE))
typeof(coerce1)

# coerce into a type
(coerce2 <- 5)
typeof(coerce2)

(coerce3 <- as.integer(5))
typeof(coerce3)

(coerce6 <- matrix(1:9, nrow = 3))
is.matrix(coerce6)

# does not change function but does change operations you can do on it
(coerce7 <- as.data.frame(matrix(1:9, nrow = 3)))
is.data.frame(coerce7)
