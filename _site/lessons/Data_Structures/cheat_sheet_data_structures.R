
# we have a number of data types we will use in R 

#Here is a little cheat sheet you can use after on what they all do 

# Homogeneous     Heterogeneous
# 1d Vector         List
# 2d Matrix         Data Frame
# nd  Array


############# Vectors
# 4 main types : logical, integer, double, character
#if you make it with c() it is a vector

dbl_var <- c(1, 2.5, 4.5)
typeof(dbl_var)
# With the L suffix, you get an integer rather than a double
int_var <- c(1L, 6L, 10L)
typeof(int_var)
# Use TRUE and FALSE (or T and F) to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
typeof(log_var)
chr_var <- c("these are", "some strings")
typeof(chr_var)
#even if nested, they will be flat

nested_vec <-c(1, c(2, c(3, 4)))
nested_vec

regular_vec <-c(1, 2, 3, 4, NA)

typeof(regular_vec)


all.equal(nested_vec, regular_vec)

#NA in vector has a length value of 1 and the type it will be is the type the vector is composed of.
# NA_real_ (a double vector), NA_integer_ and NA_character_.

#typeof() checks what type of vector you have


#All vectors will be of the same type so combining an integer and a character will result in a character vector

test_var <- c("a", 1)
typeof(test_var)
test_var


###################LIST

#Like vectors but can be of any type mixed up. 
x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
x
str(x)
x[[4]][2]
#it can also be recursive
x <- list(list(list(list())))
str(x)
x


#Lists can be combined 
x <- list(list(1, 2), c(3, 4))
y <- c(list(1, 2), c(3, 4))
str(x)
x

y

######### Matrices and arrays a matrix is a 2d array

#add a dimension to a vector and it becomes an array
# Two scalar arguments to specify rows and columns
a <- matrix(1:6, ncol = 3, nrow = 2)
# One vector argument to describe all dimensions
b <- array(1:12, c(2, 3, 2))
b


a
#let us modify a vector
# You can also modify an object in place by setting dim()
c <- 1:6
c
dim(c) <- c(3, 2)

c

dim(c) <- c(2, 3)
c


#to find the lengths of the arrays use nrow() and ncol()

#length() and names() have high-dimensional generalisations:
#  
#  length() generalises to nrow() and ncol() for matrices, and dim() for arrays.
#
#names() generalises to rownames() and colnames() for matrices, and dimnames(), a list of character vectors, for arrays.


length(a)

nrow(a)

ncol(a)

#To give names use rownames() and colnames() and save it as a vector to give it names
a


rownames(a) <- c("A", "B")
colnames(a) <- c("a", "b", "c")
a

a[,"b"]
 
#dimnames() can also be used to rename the rows and columns, rows then columns
dimnames(a) <- list(c("one", "two"), c("a", "b","c"))


a
#martices and arrays can be 1 dimensional

str(matrix(1:3, ncol = 1)) # column vector

str(matrix(1:3, nrow = 1)) # row vector

str(array(1:3, 3))         # "array" vector

#lists can be turned into list arrays

l <- list(1:3, "a", TRUE, 1.0)
l
dim(l) <- c(2, 2)
l

##################Data Frames

#it is a list of euqual length vectors and it makes a 2d structure

df <- data.frame(
  x = 1:3,
  y = c("a", "b", "c"),
  stringsAsFactors = FALSE)
str(df)
df

df

#you can add rows and columns using cbind() and rbind()
#with cbins the number of rows must match to the data frame
cbind(df, data.frame(z = 3:1))

#with rbind the number and names of columns must match
rbind(df, data.frame(x = 10, y = "z"))
