# Homework 6 Script
# Maddy Degelsmith
# March 10, 2021
# ---------------------------------

##############################
# Question 1


# single integer between 3 and 10
n_dims <- sample(3:10, 1, replace=TRUE) 
n_dims

# vector of consecutive integers from 1 to n_dims
myVec <- c(1:n_dims^2) 
myVec

# Use the sample function to randomly reshuffle these values.
myNewVec <- sample(myVec)
print(myNewVec)

# create a square matrix with these elements.
myMatrix<- matrix(data=myNewVec, ncol=n_dims, byrow=TRUE )
print(myMatrix)

# find a function in r to transpose the matrix.
tMatrix <- t(myMatrix)
print(tMatrix)

# calculate the sum and the mean of the elements in the first row and the last row.
colSums(tMatrix)
colMeans(tMatrix)

# read about the eigen() function and use it on your matrix
new <- eigen(tMatrix, only.values=FALSE, EISPACK=FALSE)
print(new)

# look carefully at the elements of $values and $vectors. What kind of numbers are these?
new$values
new$vectors

# dig in with the typeof() function to figure out their type.
typeof(new$values) # they are both "complex"
typeof(new$vectors) 

#############################
# Question 2

# my_matrix, which is a 4 x 4 matrix filled with random uniform values
my_matrix <- matrix(runif(16), ncol = 4)
print(my_matrix)

# my_logical which is a 100-element vector of TRUE or FALSE values. Do this efficiently by setting up a vector of random values and then applying an inequality to it.
newVec <- runif(1:100)
my_logical <- c(newVec>0.5)

# my_letters, which is a 26-element vector of all the lower-case letters in random order.
my_letters <- c(sample(letters))
my_letters

# create a new list, which has the element[2,2] from the matrix, the second element of the logical vector, and the second element of the letters vector.
myList <- list(my_matrix[2,2], my_logical[2], my_letters[2])
myList

# use the typeof() function to confirm the underlying data types of each component in this list
typeof(myList[[1]]) # double
typeof(myList[[2]])# logical
typeof(myList[[3]]) # character

# combine the underlying elements from the new list into a single atomic vector with the c() function.
singleAVec <- c(myList[[1]],myList[[2]],myList[[3]])
typeof(singleAVec) # it is a character!

###############################
# Question 3
 
# call the first variable my_unis and fill it with 26 random uniform values from 0 to 10
my_unis <- runif(26, min=0, max =10)

# call the second variable my_letters and fill it with 26 capital letters in random order
my_letters <- sample(LETTERS)

# Create a data frame with two variables (= columns) and 26 cases (= rows).
df <- data.frame(my_unis, my_letters)  
print(df)

# for the first variable, use a single line of code in R to select 4 random rows and replace the numerical values in those rows with NA. 
df[sample(nrow(df),4), 1] <-NA
df

# for the first variable, write a single line of R code to identify which rows have the missing values.
which(is.na(df))

# for the second variable, sort it in alphabetical order
newdf <- df[order(df$my_letters),]
newdf

# calculate the column mean for the first variable.
mean(df$my_unis, na.rm=TRUE)
