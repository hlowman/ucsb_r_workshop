#########################
#Intro to R
#April 1, 2021
#Ana Miller-ter Kuile
#########################

# What this script does ---------------------------------------------------

##This script will lead us through the following learning goals:
##1. Define the following terms as they relate to R: object, assign, call, function, arguments, options.
##2. Create objects and assign values to them in R.
##3. Learn how to name objects.
##4. Save a script file for later use.
##5. Use comments to inform script.
##6. Solve simple arithmetic operations in R.
##7. Call functions and use arguments to change their default options.
##8. Inspect the content of vectors and manipulate their content.
##9. Subset and extract values from vectors.
##10. Analyze vectors with missing data.

# Creating objects in R ---------------------------------------------------


## R for basic math
# 3 + 5
# 12 / 7

## Assign an object
# weight_kg <- 55

## keyboard shortcuts for assignment 
#Mac 'Option' + '+'
#PC 'Alt' + '+'

## Assigning vs. printing
#weight_kg <- 55    # doesn't print anything
#(weight_kg <- 55)  # but putting parenthesis around the call prints the value of `weight_kg`
#weight_kg          # and so does typing the name of the object

## Math with created objects
#2.2 * weight_kg #weight from kg to lbs

## Re-assign an object
#weight_kg <- 57.5 #re-assign weight to new value
#2.2 * weight_kg #see how it changes the object arithmetic

## Assign based on another object
#weight_lb <- 2.2 * weight_kg

## Re-assign the original kg weight
#weight_kg <- 100

## Save your work!
#Ctrl + S

## Comments
#Ctrl + Shift + C

#comments help you and others understand what you are doing!

## Challenge
#What are the values after each statement in the following?
#mass <- 47.5            # mass?
#age  <- 122             # age?
#mass <- mass * 2.0      # mass?
#age  <- age - 20        # age?
#mass_index <- mass/age  # mass_index?

## Functions and their arguments
#weight_kg <- sqrt(10) #call function of sqrt()

#round(3.14159) #another function

#args(round) #finding out the arguments you can use in a function

#?round #finding out even more!

#round(3.14159, digits = 2) #add the 'digits' argument to the function

#round(digits = 2, x = 3.14159) #naming arguments means order doesn't matter

# Vectors and data types --------------------------------------------------

## Making a vector
#weight_g <- c(50, 60, 65, 82) #a set of weights in grams
#weight_g #see what ya get!

#animals <- c("mouse", "rat", "dog") #a set of animals we saw in a plot
#animals #prints out a set of our animals

## Functions for exploring vectors
#length(weight_g) #how many numbers in this vector
#length(animals) #how many animals in this vector

#class(weight_g) #what kind of data are these vectors?
#class(animals)

#str(weight_g) #what is the structure of this vector?
#str(animals)

## Adding to vectors
#weight_g <- c(weight_g, 90) # add to the end of the vector
#weight_g <- c(30, weight_g) # add to the beginning of the vector
#weight_g #see what the vector looks like now!

## Challenge
#We’ve seen that atomic vectors can be of type character, numeric (or double), 
#integer, and logical. But what happens if we try to mix these types in a 
#single vector?

#What will happen in each of these examples? 
#(hint: use class() to check the data type of your objects):
  
#num_char <- c(1, 2, 3, "a")
#num_logical <- c(1, 2, 3, TRUE)
#char_logical <- c("a", "b", "c", TRUE)
#tricky <- c(1, 2, 3, "4")

#Why do you think it happens?

#How many values in combined_logical are "TRUE" 
#(as a character) in the following example 
#(reusing the 2 ..._logicals from above):
#combined_logical <- c(num_logical, char_logical)

#You've probably noticed that objects of different types get converted 
#into a single, shared type within a vector. In R, we call converting 
#objects from one class into another class coercion. 
#These conversions happen according to a hierarchy, whereby some types 
#get preferentially coerced into other types. Can you draw a diagram that 
#represents the hierarchy of how these data types are coerced?

# Subsetting vectors ------------------------------------------------------

## Create and subset some vectors
#animals <- c("mouse", "rat", "dog", "cat")
#animals[2] #print the second element of animals

#animals[c(3, 2)] #take the third and then the second element

## Create new vector from elements of another one
#more_animals <- animals[c(1, 2, 3, 2, 1, 4)] 
#more_animals

## Conditional subsetting
#weight_g <- c(21, 34, 39, 54, 55)

#select based on TRUE/FALSE elements of a created vector
#weight_g[c(TRUE, FALSE, FALSE, TRUE, TRUE)]

#determine which weights are larger than 50
#weight_g > 50    # will return logicals with TRUE for the indices that meet the condition

## so we can use this to select only the values above 50
#weight_g[weight_g > 50] 

## Combining subsetting arguments with & or | operators
#weight_g[weight_g > 30 & weight_g < 50]

#weights less than or equal to 30 or equal to 55
#weight_g[weight_g <= 30 | weight_g == 55]

#weights greater than or equal to 30 and equal to 21
#weight_g[weight_g >= 30 & weight_g == 21]

## > : greater than
## < : less than
## <= : less than or equal to
## >= : greater than or equal to
## == : equal to

## Search for certain strings in a vector
#animals <- c("mouse", "rat", "dog", "cat", "cat")

# return both rat and cat
#animals[animals == "cat" | animals == "rat"] 

## %in% : finds the cases where those values are in a vector

# return a logical vector that is TRUE for the elements within animals
# that are found in the character vector and FALSE for those that are not
#animals %in% c("rat", "cat", "dog", "duck", "goat") 

# use the logical vector created by %in% to return elements from animals 
# that are found in the character vector
#animals[animals %in% c("rat", "cat", "dog", "duck", "goat")]

## Challenge

#Can you figure out why "four" > "five" returns TRUE?

# Missing data ------------------------------------------------------------

## functions do not like NA values, so use argument 'na.rm = TRUE'
#heights <- c(2, 4, 4, NA, 6)
#mean(heights)
#max(heights)
#mean(heights, na.rm = TRUE)
#max(heights, na.rm = TRUE)

## Functions for dealing with NA values

#is.na()
#na.omit()
#complete.cases()

## Extract those elements which are not missing values.
#heights[!is.na(heights)]

## Returns the object with incomplete cases removed. 
#The returned object is an atomic vector of type `"numeric"` (or #`"double"`).
#na.omit(heights)

## Extract those elements which are complete cases. 
#The returned object is an atomic vector of type `"numeric"` (or #`"double"`).
#heights[complete.cases(heights)]

## Challenge

#Using this vector of heights in inches, create a new vector, 
#heights_no_na, with the NAs removed.

#heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 
#             63, NA, 72, 65, 64, 70, 63, 65)

#Use the function median() to calculate the median of the heights vector.
#Use R to figure out how many people in the set are taller than 67 inches.

