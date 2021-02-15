# UCSB EEMB R Workshop
# Day 1, Module 3
# Starting with data

# This script introduces how to get external data into R

# Lesson Plan ---------------------------------------------------

# In this lesson, we're going to import our first external dataset into R and
# RStudio and start exploring those data in the R environment.

#Specifically we will: 

# - Load external data from a .csv file into R
# - See how R interprets these data in the R environment as a dataframe
# - Examine the data in the form of a dataframe in R
# - Create and change the types of data in a dataframe, including factors and strings
# - Reorder and rename factors
# - try plotting some data!
# - Format dates

# Again, please ask questions in the chat or by raising your hand. Our helpers
# are ready to help you at any point during the lesson!

# We will be doing challenges during this lesson, which you can find on the webpage for
# this lesson. I will take a break and let you know when we're working through challenges
# and also put the challenge up on my screenshare

#https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html

# Before we get going on this next lesson, let's create a new R script to
# keep track of what we're doing in this lesson. There are different opinions
# about script management, but I like to keep my scripts short and 
# with a single analysis or data step each. So let's go back up to the 
# white page icon with the plus on the top left of the screen or go to
# File -> New File -> R Script. Let's save our script, and name it 
# 'starting_with_data'. Now let's begin!

# Loading the survey data -------------------------------------------------

# In this lesson, we're going to be using a dataset in a .csv format that
# we will download from the internet. It contains survey data of animal 
# diversity from different survey sites. 

# I'm not actually sure how common it will be for you to download data from
# the internet for your work, but like many things in R there are several
# ways to accomplish downloading this file. You can do what you might do to 
# download anything from the internet and just download the file at the link 
# here (which I will put in the chat):

# https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html#Indexing_and_subsetting_data_frames

# Just make sure to put this in the appropriate folder, which should be 
# the data_raw folder in your directory for this workshop. 

# If you want to download from the internet using R, you can use the
# download.file function, which needs two arguments, the 'url' where
# the file lives on the internet, and the 'destfile' where you can 
# find the downloaded file on your computer. 

# This function does not import the data into R, rather, it just
# downloads it from the internet to where you specify for it to go:

## Downloads the data as a "promise" but it isn't an object yet
download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

## PAUSE FOR indication that its imported##

# Now that the file lives on your computer, we can import it into RStudio.
# We will be using a function that is part of the tidyverse 
# package you installed this morning with Heili. 
# To tell R that you want to start using the functions in that
# package, you'll again use the library() function to tell R to put it in your library

# If you didn't get the package installed yet, you can type 
# install.packages("tidyverse") into the console to install it. No need to type
# this function in the script since you will only need to install it this one
# time and won't need to call that line of code every tiem you run your code

library(tidyverse)

# Now we're going to be using the function 'read_csv()' from the tidyverse 
# package to import our data into R

# Again, we will assign this csv a name so that R will store it as an object in our 
# environment. We can give it the name 'surveys'.

# the read_csv() function needs an argument that is the local file path to find the 
# csv file we downlaoded. In this case, that path is in the data_raw folder

surveys <- read_csv("data_raw/portal_data_joined.csv")

# Now if we look in the upper right box in our RStudio environment, we can see 
# an object called surveys and some information about that object, including
# how many observations and variables are part of it. Let's explore what that means
# in more detail. 

# R imports data from spreadsheets such as csvs in the form of a 'dataframe'. 
# This data object type looks really similar to what you might see if you opened
# a CSV in Excel or another program uesd to work with spreadsheets, where the data
# have rows corresponding to different observations of something and columns 
# that represent different variables collected in association with each of those
# observations.

# There are a set of functions that make it very easy to explore dataframes in R

# For example, to look at just the first few entries of every column of surveys, we
# could use head() 

head(surveys)

# head() tells us that surveys is a "tibble", which is a type of dataframe created 
# by the tidyverse package. And then head also gives us the first few rows and columns
# of surveys so we can look at the data. 

# We could also print the whole dataframe, which you can see gets cut off
# by RStudio anyway, by calling the print() function

print(surveys)

# Or we could look at the last few rows, instead of the first few rows, with the tail() funciton

tail(surveys)

# We could also use the RStudio viewer to view the surveys dataframe in a way that 
# might seem more familiar if you are used to working with spreadsheet programs like Excel
# You can view a dataframe with the view() function or by clicking the little spreadhseet
# icon next to surveys in the Environment pane on the top right corner of the screen. 
## View the dataset in the RStudio viewer

view(surveys)

## PAUSE ##

# What are dataframes? ----------------------------------------------------

# As we have been already talking about, dataframes (and tibbles) are the default
# way that R understands files like csv files. If we look at the output of the view
# function for surveys, again, we can see how these data are set up 

view(surveys)

# Specifically, a horizontal row in this dataframe represents an observation in this 
# dataframe, in this one, an observation of a specific animal
# A vertical column represents some attribute of those data, including the date
# of the observation, the species and size of the animal, and the type of plot they were 
# observed in in our experiment. 

# We could examine these variables using the str() function, which is the "structure" function

str(surveys)

# We can see from this structure() call how many observations we have: 34,786
# how many variables we have collected from each observation: 13
# what the first few values for each of these variables are 
#and also what kind of variable they are: eg numeric vs. character

# There are lots of functions for getting information about dataframes, 
# including how big a dataframe is, what is in a dataframe, what the 
# names of variables are in a dataframe, and a summary of the data in a dataframe

# You can reference the website for this lesson for a list. 

#https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html#Inspecting_data_frames

## PAUSE ## 

# Challenge ---------------------------------------------------------------

#https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html#Challenge

# Factors -----------------------------------------------------------------

# Guess what? There are even MORE kinds of data in R to learn about!
# So far, we've covered data types like numerical and character, but another 
# type of data that you all may encounter at some point during your careers 
# is factored data. 

# Even if this sounds like something scary - you probalby already think 
# about data in terms of factors. For example, if you have an experiment that
# has a treatment group for one soil additive, another soil additive, and 
# a control to compare to those additives - you have factored data! 

# Factored data means that a column in your dataframe that might have 
# numeric or character values may actually have a "hidden meaning" in which those
# numbers or characters actually represent groups or categories
# of data

# For example, let's look back at the surveys dataset and see if we can come up with a 
# variable that might be a factor

str(surveys)

# In this dataset, the column for "genus" indicates that it is a "character" vector,
# however, genus is actually a grouping variable that indicates a taxonomic 
# grouping for individuals or species. So, for example, the genus "Neotoma" could include
# multiple species within that genus.

# others that might be factors could be species_id, sex, taxa, and plot_type...

# Let's tell R that one of these variables is a factor that it is currently thinking 
# is a character variable. Let's work with one that might really matter for our 
# subsequent data analyses - the variable of plot_type.

# Plot type has five different values, and we can factor them using the factor() function

# This next call also uses another new R trick - the '$' operator, which is a useful operator
# for working with dataframes. What it does is lets you specify a single column within a dataframe
# with the dataframe first (surveys) and the column of interest second (plot_type)

# Just like we did with single variables or vectors, we can now treat this surveys$plot_type as a 
# vector. We can then re-specify that this vector should be a factor by re-assigning it using 
# the factor() function

surveys$plot_type <- factor(surveys$plot_type)

# We can see what this function did by using the summary() function.

summary(surveys$plot_type)

# The summary function shows us how many observations are in each level of the factor 'plot_type'

# By default, R sorts factors alphabetically. For example, if we created a factored vector with
# three different levels for an "series" factor. 

series <- factor(c("one", "two", "three", "two"))

# To find out the order of the factors in the series vector, we can call the levels function

levels(series)

# We see that R sorts these in the wrong order if we want to go 'one', 'two', 'three'.

# We can also see how many levels series has with the nlevels() function

nlevels(series)

# There are three. 

# In some instances - the order of the factors might not matter - say, if you have three threatment
# groups of just different soil additives. However, in this series vector, we might want to have
# the order 'one', 'two', 'three' for both analyses and graphing. 

#To see the current levels of something, you can print it by calling the factored object

series

# We can change the order of this factor by using the factor() function and using an additional
# argument, the "levels" argument

series <- factor(series, levels = c("one", "two", "three"))

# Now we can call the same functions or just call series again to see hwo this changed our vector

levels(series)

series

## PAUSE ##

# Challenge ---------------------------------------------------------------

#https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html#Challenge14


# Converting factors ------------------------------------------------------

# You can also convert factors back to characters or numeric values 

# To make a factor a character, you can use the as.character() function

as.character(series)

# Converting a factor to a numeric vector is a little more tricky

# For example, if we create a factored vector of years

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))

# If we uuse the as.numeric() function on its own, it returns just 
# the level of the factor each number corresponds to, not the years
# in numeric form. 
as.numeric(year_fct)   

# To fix this, we can first make the numbers a character and then
# convert that to a numeric varaible by nesting the as.character() function
# inside the as.numeric function

as.numeric(as.character(year_fct))

# Or, we can use the levels() function, where we make the levels of year_fct
# numeric, and then use that to apply to the year_fct vector. 

as.numeric(levels(year_fct))[year_fct]    

# Plotting based on factors --------------------------------------------------------

# When you have factored data, you can plot your data based on those factors to see,
# for example, a count of the number of observations in each plot type

plot(surveys$plot_type)

# The plot() function makes a graph! If you look at the bottom right of your 
# screen you can see that calling this function shows a plot in the plot
# tab. You can look closer at this plot by clicking the Zoom icon on the
# Plot screen. 

# Maybe we might want to know if animals are bigger in one of the treatment groups

boxplot(weight ~ plot_type, data = surveys)

## PAUSE ##

# Formatting dates --------------------------------------------------------

# Dates are a particular case of data that pose challenges for R users

# In our dataframe, we can see that there is a separate column for month, day, and year,
# and that these columns have numeric values for these parts of the date

str(surveys)

# This is a useful way to import data into a dataframe, but it poses challenges for working 
# with date data in R. For example, if we wanted to plot or analyze data and how it 
# changes throughout the year, these data are not currently in a state that R would know, 
# for example, that March 17 was before August 16 and to treat the date data accordingly.

# To demonstrate this, if we use the plot data to see if there are different weight animals
# tracked throughout the year, what we see is that the x axis (day) just extends from 1-30 
# as opposed to  the 365 days in a year. 

plot(weight ~ day, data = surveys)

# There is a whole package in R that helps make date data useful in R, and it's called
# lubridate. You can load this package using the library() function, like you did before

library(lubridate)

# The function in this package we are going to be using is called ymd(). This function
# takes a string variable or vector and converts it into a new kind of data that R 
# recognizes, the "Date" data type, which recognizes a year, month, and day. It's a 
# fairly flexible function in terms of what you put into the arguments, but it is best
# practice to enter a date in the format YYYY-MM-DD

# Let's try it by creating a date object with the ymd() function

my_date <- ymd("2015-01-01")

# When we examine this object, we see that R recognizes that this is a Date object

str(my_date)

# Building off of this, we can also call the year, month, and date as separate objects and 
# the ymd() function will recognize that this is also a date. So, I can use the the paste() 
# function inside the ymd() function to create a date out of three separate values separated
# by a "-". 

# sep indicates the character to use to separate each component
my_date <- ymd(paste("2015", "1", "1", sep = "-")) 

# And still get a date from the ymd() function

str(my_date)

# This second appraoch looks similar to the data we have in our dataframe for the date,
# so we can extend that appraoch to create a string for each observation that looks 
# like we just put into the paste function.

# The paste function asks for a set of characters separated by commas as arguments, and the 
# 'sep' argument specifies what separates these characters from each other. It could be a 
# '.', '_', or, in this case to keep consistent with date best practice a '-'.

paste(surveys$year, surveys$month, surveys$day, sep = "-")

# What we see is that the paste function takes each of the variables for each part of the
# date and creates a character string of them. However, this is still not in date format 
# because we haven't used the ymd() function AND we haven't applied this to our dataframe yet

# let's appraoch that in a piece-wise manner, first by seeing how to turn these into dates
# with the ymd() function

ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

# We get a warning message that says some of these failed to parse. This warning could 
# mean that either there are missing data recorded for a day, month, or year, or that the 
# day, month, or year is somehow an invalid day, maybe due to typos if someone typed in, for
# example, a "13" for month. 

# Let's ignore those for now and we'll have a bonus on-your-own section at the end of the
# day if you want to explore this. This is not trivial - it is likely that you may also 
# come up with issues like this when entering your own data, either because data were not
# entered or entered wrong. Having a way to troubleshoot those challenges will be really
# important!

# Moving on, now we can create a new 'date' variable in our dataframe and make it this new
# date variable we just created

# Again, we will use the $ operator to indicate a column within a dataframe, which
# we are assigning the value with the assignment operator of the result of the 
# ymd function combining the columnds of year, month, and day into a column with date format

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

# We can look at our dataframe to see what this did

str(surveys)

# Now we have a date column in our dataframe that R knows corresponds to the passing of time
# over the months within a year and across years. 

# We can plot our data now to explore how weights of animals change across the timeframe of 
# our sampling

plot(weight ~ date, data = surveys)

# Bonus: Failed to Parse Error --------------------------------------------

# Let's look back at that "failed to parse" warning we got when we ran the ymd() function
# on our dataset. We can use the summary() function to remind ourselves that there 
# were 129 dates that did not parse

summary(surveys$date)

# We can then use a function to subset just the cases where an NA value exists (if we 
# didn't get to Intro to R section on this, this is new). This is the is.na() function

surveys[is.na(surveys$date), c("year", "month", "day")]

## Why didn't they parse? And what would you do??
