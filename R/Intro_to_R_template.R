
################# 
### Objective ###
#################

## Define the following terms as they relate to R: object, assign, call, function, arguments, options.
## Create objects and assign values to them in R.
## Learn how to name objects.
## Save a script file for later use.
## Use comments to inform script.
## Solve simple arithmetic operations in R.
## Call functions and use arguments to change their default options.
## Inspect the content of vectors and manipulate their content.
## Subset and extract values from vectors.
## Analyze vectors with missing data.


##########
# Objects
#########

# 3 + 5
# 12 / 7

## SS
# area_hectares <- 1.0
# area_hectares

# 2.47 * area_hectares

# area_hectares <- 2.5

# 2.47 * area_hectares

# area_acres <- 2.47 * area_hectares

# area_hectares <- 50


###################
### Challenge 1 ###
###################

## What do you think is the current content of the object area_acres? 
## 123.5 or 6.175?


## 

area_hectares <- 1.0			          # land area in hectares
area_acres <- area_hectares * 2.47	# convert to acres
area_acres				                  # print land area in acres.






#--------------------------------------

## ECOLOGY
# weight_kg <- 55
# weight_kg

# 2.2 * weight_kg

# weight_kg <- 57.5
# weight_lb <- 2.2 * weight_kg

# weight_kg <- 100

###################
### Challenge 1 ###
###################

## What are the values after each statement in the following?

mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?


###############################
# Functions and their arguments
###############################

# 1.1 Use the sqrt function to print the square root of 16

sqrt(16)

# 1.2 Round pi (3.14159) using the round function



# 1.3 Get information about the round function and it's arguments



# 1.4  Round pi to 2 digits using the digits argument



########################
# Vectors and data types
########################

# 2.1 Create a numeric vector with the c() function


# 2.2 Create a character vector with the c() function



# 2.3 Inspect the contents of your vectors using the length(), class(), and str() functions



# 2.4 Add more elements to your vector using the c() function



# 2.5 Create an integer vector with the colon



###################
### Challenge 2 ###
###################

## Atomic vectors can be of type character, numeric (or double), integer, and logical.

## 1. What happens if we try to mix these types in a single vector? 
##    HINT: Use class() to check the data type of your objects.
##    Why do you think this happens?

vec_num_char <- c(1, 2, 3, "a")
vec_num_logical <- c(1, 2, 3, TRUE)
vec_char_logical <- c("a", "b", "c", TRUE)
vec_tricky <- c(1, 2, 3, "4")

## 2. How many values in vec_combined_logical are "TRUE" (as a character) in the following example:

# vec_num_logical <- c(1, 2, 3, TRUE)
# vec_char_logical <- c("a", "b", "c", TRUE)

vec_combined_logical <- c(vec_num_logical, vec_char_logical)


####################
# Subsetting vectors
####################

# 3.1 Copy the character vector from 2.1 above or create one



# 3.2 Extract/Display a single value from the vector 



# 3.3 Extract/Display multiple values from the vector



# 3.4 Create a logical vector using a logical test on a vector



# 3.5 Use the logical test to select values from the vector



# 3.6 Use the %in% operator to check each element of a vector against another

## SS
animals %in% c("rat", "cat", "dog", "duck", "goat") 


###################
### Challenge 3 ###
###################

## Why does the following return TRUE?  

"four" > "five"


####################
# Missing data
####################

# 4.1 Create a vector that includes the NA value



# 4.2 Find the mean and max values of the vector



# 4.3 Use is.na() to extract elements that are not missing values 



# 4.4 Use na.omit() to return the object with incomplete cases removed



# 4.5 Use complete.cases() to extract those elements which are complete cases 



###################
### Challenge 4 ###
###################

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

## 1. Using the above vector of heights in inches, create a new vector, heights_no_na, with the NAs removed.



## 2. Use the function median() to calculate the median of the heights vector.



## 3. Use R to figure out how many people in the set are taller than 67 inches.


