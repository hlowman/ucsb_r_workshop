#################
# Day 1, Session 2: Introduction to R
# April 1, 2021
# Ana Miller-ter Kuile 
#################

# This script is from Day 1, Session 2 of the Introduction to R for 
# Ecologists workshop

3 + 5 #math

weight_kg <- 55 #assigning an object a value
weight_kg #printing that object to see the value

2.2 * weight_kg #math with an assigned object

# creating a new object with another assigned object
weight_lb <- 2.2 * weight_kg

# re-assigning an object
weight_kg <- 100


# Commenting code ---------------------------------------------------------


#Now I need to comment my code

#A varaible of the weight of a moose
weight_kg <- 57.5 #this was a small one


# Functions and arguments -------------------------------------------------

# We need to transform our data using a function
weight_kg <- sqrt(10) #sqrt() function takes the square root

# using a function on a named variable
sqrt(weight_lb)

# round a number with default arguments
round(3.15466)

# see the arguments in the function
args(round)

# specify arguments
round(3.15466, digits = 2)

# calling a function without pre-defined argument names
round(3.15466, 2) #R will interpret these in the order they
# are called by the function, so 'x' = 3.15466 and 'digits' = 2

#round function with arguments specified
round(digits = 2, x= 3.15466)

# Vectors and data types --------------------------------------------------

# make a vector of weights with the concatenate function, c()
weight_g <- c(50, 60, 65, 82)

# print the weights of mice
weight_g

# make a vector of animals with the c() function
animals <- c("mouse", "rat", "dog") #names of things need '' or ""!

# print animal vector
animals

# how many weights did we measure
length(weight_g) #the length (number of objects) in this vector

#how many animals did we document
length(animals)

# what kind of data are in the weight_g
class(weight_g) #the data class of these data

# what kind of data are in animals
class(animals) # the data class of these data

# what is the structure of weight_g
str(weight_g) #class, number of elements, etc

# what is the structure of animals
str(animals)

# add a new value to the end of a vector
weight_g <- c(weight_g, 90) #add a new weight

# print new vector
weight_g

# add a new value to the beginning of a vector
weight_g <- c(30, weight_g)

# print new vector again
weight_g

# Missing Data ------------------------------------------------------------

# Heights of seedlings vector with c() function
heights <- c(2, 4, 4, NA, 6) #one value is missing

# what is the mean height
mean(heights) #neither of these work because of default arguments
max(heights)

# the default for the 'na.rm' (remove NA) argument is FALSE or F
# so these functions don't know what to do

# Ignore missing data with the na.rm argument
mean(heights, na.rm = TRUE) # set na.rm = TRUE or T to remove NA
max(heights, na.rm = TRUE)

# Extract elements that are not missing in heights
# using the is.na function and ! operator
# is.na() looks for NA values, the '!' operator means "not"
# square brackets [] tell R to look within a dataset for that function
# the following tells R "look within heights and find data where
# the values is not NA. 
heights[!is.na(heights)] 

# na.omit function for removing missing data
na.omit(heights)

# complete.cases function to exclude missing data
heights[complete.cases(heights)]
