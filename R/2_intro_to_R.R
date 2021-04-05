# UCSB EEMB R Workshop
# Day 1, Module 2
# Introduction to R

# The following script will introduce the terminology of R through coding
# practice in the console and scripts 

# Lesson Plan -------------------------------------------------------------

# In this lesson, we're going to start to learn the terminology of R and RStudio
# and how to create the foundational building blocks of coding in R

# Specifically, we will learn how to 
# - write code in the console
# - assign names to objects in R to save them in  the memory of R
# - save code in scripts so we can come back to them later
# - comment script to remember what we did
# - learn how to use R functions to manipulate data in R
# - learn about different kinds of data in R
# - deal with data where some parts are missing

# This is A LOT, so please feel free to ask questions in the chat or
#raise your hand and one of the helpers can work with you

# We will be doing challenges during this lesson, which you can find 
# on the webpage for this lesson. I will take a break and let you 
# know when we're working through challenges and also put the 
# challenge up on my screenshare

# https://datacarpentry.org/R-ecology-lesson/01-intro-to-r.html

# We may not reach the end of this lesson in the time allotted, 
# so you can look at this website and work through the remainder 
# of the lesson later during the hack-y hour and beyond

# Creating objects in R ---------------------------------------------------

# Review the layout of the RStudio environment with a newly-opened window.

# At its core, R is a calculator, and I even use it as one sometimes. Heili
# already did this just a little in the first lesson, but let's try typing
# in some math operations to the console (on the left-hand side of the screen)

3 + 5

12 / 7

# Being able to use R as a calculator is great, but what if I wanted to remember
# the value of one of these - like, maybe I have a flower I 
# measured in two parts that that weighed 3grams and 5grams and I wanted to save 
# the total for later

# We can give an object, maybe the result of '3 + 5' a name by "assigning" it in R

# To assign something, we use the assignment operator that
# is the combination of the '<' (less than) and '-' (dash) keys to 
# give something a name

# To do this in R, we first type in the name, say, 'weight_kg'
# followed by the assignment operator '<-'
# followed by the value we want to assign to it, let's say '55'

# You can use keyboard shortcuts for the assignment operator, which are
#Mac 'Option' + '-'
#PC 'Alt' + '-'

# When you run this assignment - do you notice that it doesn't print anything 
# in the console after you typed it in? Where did it go. If you go to the top
# right of your screen to the environment tag, maybe you notice that now you 
# have something stored in R's environment that is called "weight_kg" and has
# a value of "55". 

# if you also wanted to print the value of 'weight_kg' after you typed it in,
# you have a few options. 

# First is to put parentheses around the entire line of code you just entered

(weight_kg <- 55)

# The other option is to re-type 'weight_kg' in your console and this will print
# the value of this named object

weight_kg

## PAUSE ##

# Once we have named an object in R, we can also perform math on the named object

# So maybe I wanted to convert my 'weight_kg' to weight in pounds (2.2 lbs/kg)? I could do math
# with 'weight_kg' as one of the parts of the math equation instead of a raw number

2.2 * weight_kg

# Now, what if I accidentally mis-measured the weight and the actual weight is 57.5 instead 
# of 55? I can re-assign the object 'weight_kg' in R to a new value

weight_kg <- 57.5

# Now if we print this, or look at the object in our R environment pane in the upper right
# weight_kg is now 57.5. 

# We could even do math on this weight to convert to lbs!

2.2 * weight_kg

# Which gives us a new value because we are now multiplying 57.5 by 2.2 rather than 55 by 2.2

# Ok, what if I wanted to save the weight in lbs as a new variable in my R environment?
# This looks very similar to what we have already done, except now we are going to assign
# an object based on another object we already assigned.

weight_lb <- 2.2 * weight_kg

# Now we have a new object in our R environment in the upper right corresponding to weight
# in lbs. (which you could print as you have already learned)

# I could then re-assign either of these objects new values, as I have done before, so let's 
# go ahead and do that

weight_kg <- 100

# What do you think that the current value of weight_lb is? 

## PAUSE ##

# Saving scripts and commenting -------------------------------------------

# Ok, so up until now we have been writing code in the console, but this means I 
# can't go back to some previous line and change it really easily, and also, when I close
# RSTudio, all my work will be lost! You can save your work and come back to it later in
# RStudio using R scripts, which are files on your computer, like a word document or excel
# file that can be opened and edited in RStudio at a different date. 

# Let's open the script you started with Heili last section and reorient ourselves 
# to what it is. 

# This opens up a new window in R Studio that lives directly above your console on the upper
# left. Now, any code you write in this script can be saved, re-opened, and re-run in R
# as many times as you want.

# Let's type our weight_kg object into this R script and run it

weight_kg <- 57.5

# Just typing our object into the script and pressing enter no longer automatically runs our
# code. But we can run this code either by clicking the 'Run' button at the top right
# of the script window or with another keyboard shortcut.

# Mac: Command + Enter or Ctrl + Enter
# PC: Ctrl + Enter

# Are you overwhelmed by the keyboard shortcuts yet? You can find a list of them 
# under the Tools -> Keyboard Shortcuts Help. And remember, there are usually
# more than one way to do things. I really only use keyboard shortcuts for the tasks
# I end up doing repeatedly, like assigning objects and running lines of code

# The last thing I'm going to cover before I take a little break from
# talking for a while is commenting code. Commenting is exactly like it sounds,
# it's a way to make notes about the tasks the code you are running are performing
# so that if you walk away from your code for a while and come back, you'll remember
# what you did, and also in a reproducible data world, it's a way for other people
# to use your code to re-perform the tasks you've created.

# Comments are created by using the '#' symbol in your script. Anything that follows
# a '#' will not run in your R Console when you run a line of code 
# You can put comments above or beside your lines of code, and either way, that 
# Line will not be evaluated by R. 

# Let's end by going back and commenting our weight_kg object

# Comment above the line: this is the weight of a dog
weight_kg <- 57.5 #this particular dog was a large breed

# You can take a break now, or you can try the first challenge on the page for this lesson,
# Which I'm going to pull up on my screen and also put the link in the chat to find. 

## PAUSE ##

# Challenge 1 -------------------------------------------------------------

# https://datacarpentry.org/R-ecology-lesson/01-intro-to-r.html#Challenge

# Functions and arguments -------------------------------------------------

# Up until now we've been working with objects that we have created in R, but R 
# and the packages you load into R (like the ones you installed this morning) 
# also have built in scripts that perform what are called "functions" in R 
# These functions perform a pre-defined set of changes to your data, which
# could include, for example, taking the mean of a set of numbers, or graphing the 
# patterns of body size in a datset of animals

# For example, let's say that I measured the weight of the animal from the previous 
# section in raw kg but want to be able to take the square root of that number for
# some reason, rather than writing lines of script to get the square root of something
# I can use the sqrt() function to get the square root of that animals' weight

# Functions in R usually comprise some "name" of that function (in this case, 'sqrt'),
# followed by (). What goes into the () following a function are what are called 
# function 'arguments'. For the sqrt() function, the only argument we will need is the number
# which we want to take the square root of, say 10. So, we can type

weight_kg <- sqrt(10)

# Now the object weight_kg is assigned a value of the square root of 10, which is 3.16...

# arguments can be anything, not just numbers, but they could also be named objects in our
# R environment. For example, we could find the square root of weight_lb

sqrt(weight_lb)

# The sqrt() function only has one argument, but some functions can take
# multiple arguments. For example, let's look at the round() function, which
# rounds numbers to different decimal places.

round(3.15466)

# The default for this function is to round 3.1... to 3. But let's see if we can
# change this default, for example, if we wanted to round to two decimal places

# To find out the arguments for the round() function, we could type:

args(round)

# This shows us that round has two arguments, one which is 'x' is the number we are
# trying to round, and then the 'digits = ' argument, which tells R how many digits
# to round a number to. You can see from this args() function that the default 
# digits for the 'digits =' argument is 0, hence why 3.15466 rounded to 3
#Let's try to round our previous number to two digits by changing the number for this argument

round(3.15466, digits = 2)

# This gives us the number of digits to round to, which is two.

# If you provide the arguments in the same order as the function asks for them, you
# don't have to define them, like I have above for 'digits'.

round(3.15466, 2)

#However, if you call arguments out of the order for the function, you can define them
# all and the function will still work. Recall from when we 
# looked at the args() for round, we have an argument of 'x' and 
# an argument of 'digits'

round(digits = 2, x = 3.15466)

## PAUSE ##

# Vectors and data types --------------------------------------------------

# Up until this point, we have been working with data objects that make up just
# one value, in this case, different weights that represent just one weight

# But what if we had, say, the weights of a few things we had weighed and wanted
# to write code in R to manipulate these, say to perform a summary statistic 
# like the mean weight of dog in our neighborhood or to knwo how many dogs vs. cats
# are in our neighborhood. 

# You can use a data type called a vector in R to work with data that includes
# more than one value. We can create a vector in R using the c() function. So
# let's make a vector of the weights in grams of a some mice we weighed in the field

weight_g <- c(50, 60, 65, 82)

# What does this vector look like if we print it like we did weight_kg

weight_g

# Instead of one number, we get a set of numbers that include all the weights we measured

# A vector can also be a set of non-numeric values. Say a set of names, or "characters" 
# representing the types of animals we weighed. We specify that these names are characters
# by calling them in the c() function with "" around them. 

animals <- c("mouse", "rat", "dog")

# What does this vector look like?

animals

# The "" are very important for a character vector. Otherwise, R will think that you have created
# three objects called mouse, rat, and dog, and will spit out an error message because
# it can't find those objects. 

# There are a lot of functions in R that let you explore vectors, let's play with a few

# Maybe I want to know how many animals I weighed or observed, which I can find out with
# the length() function

length(weight_g) #how many numbers in this vector
length(animals) #how many animals in this vector

# Or, maybe I want to know whether my vector contains numbers (numeric) or words (characters)

class(weight_g) #what kind of data are these vectors?
class(animals)

# A really useful function for many different kinds of data in R, especially more complex
#ones, is the str() function, which let's you look at the structure of the data

str(weight_g) #what is the structure of this vector?
str(animals)

# In this case, str() gives us the class, the number of elements, and then lists those 
# elements. We'll see later today how the str() function can do even more and it's one
# of my most-used functions in ecological data analysis!

## COULD END HERE

# Let's say I forgot to add the weight of one of the dogs to my weight vector. 
# I can add to that vector, again, using the c() function

weight_g <- c(weight_g, 90) # add to the end of the vector

# This replaces the weight_g vector with the weight_g vector + a new value, that of 90
# I could then add a new element to the beginning of the vector too

weight_g <- c(30, weight_g) # add to the beginning of the vector

#What does the vector look like now?

weight_g #see what the vector looks like now!

## PAUSE ##

# Challenge ---------------------------------------------------------------

# https://datacarpentry.org/R-ecology-lesson/01-intro-to-r.html#Challenge9

# END HERE? ------------------------------------------------------

# Missing data ------------------------------------------------------------

# As biologists, we may have all encountered scenarios where we are missing data.

# Maybe it was raining on a day where you were continuously collecting bugs every 
# day, and so one day of bug counts is missing. Or maybe one of your experiments
# got dropped on the floor and so you have no value for that experiment for the days
# following that mishap.

# R recognizes missing data in datasets (unlike some other programming languages), and 
# designates them to NA values.

# The Functions in R really don't like to play with NA values and so you often have to
# let R know when there is missing data and what to do about it. Let me show you what I 
# mean with an example. Let's say I have the heights of a bunch of different trees in a plot
# but one tree that I measured last year is missing this year, and so for this year's data
# that tree has an NA height

heights <- c(2, 4, 4, NA, 6)

# Maybe I want to know what the mean and max of heights in my plot is, which I would do with the 
# mean function in R

mean(heights)
max(heights)

# Well that's weird! I know I have heights measured, but R is giving me an NA value...

# What is happening is that R is seeing the missing value in your dataset and evaluating 
# the mean including that NA value, which, of course, is not a real number, and so R 
# spits out an NA. Remember that mean() is a function, which means it has arguments like 
# other functions. one of these arguments tells the function how to deal with missing, or NA
# values. this argument is called 'na.rm', and is common across most of the summarising 
# functions like mean() in R. 'na.rm' stands for "NA ReMove", and is a logical TRUE/FALSE argument. 
# And you guessed it, the default is FALSE, so R is NOT removing NA values from its evaluation

# let's try to specify it to TRUE, so R knows to remove NA values when evaluating the mean

mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

# Now we get a value for the mean and max of our tree heights! 

# R has built in functions for dealing with NA values, including
# is.na()
# na.omit()
# complete.cases()

# These can be used to subset your data to remove missing values.

# So, I could use the conditional subsetting I did above for the height vector 
# to remove NA values using the is.na() function and the '!' operator, which
# translates to "do not include", or "exclude"

## Extract those elements which are not missing values.

heights[!is.na(heights)]

# Or, I could omit the NA values from heights with na.omit()

na.omit(heights)

# Or, I could ask to just get the complete cases for heights

heights[complete.cases(heights)]

# All three of these functions do the same thing, which is to remove the missing data
# from the dataset. They just do it in slightly different ways. 

# Challenge ---------------------------------------------------------------

# https://datacarpentry.org/R-ecology-lesson/01-intro-to-r.html#Challenge19

# End of script.

