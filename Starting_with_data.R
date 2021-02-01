#########################
#Starting with data
#April 1, 2021
#Author
#########################

# What this script does ---------------------------------------------------

##This script will lead us through the following learning goals:
##1. Load external data from a .csv file into a data frame.
##2. Describe what a data frame is.
##3. Summarize the contents of a data frame.
##4. Use indexing to subset specific portions of data frames.
##5. Describe what a factor is.
##6. Convert between strings and factors.
##7. Reorder and rename factors.
##8. Change how character strings are handled in a data frame.
##9. Format dates.

# Loading the survey data -------------------------------------------------

## Downloads the data as a "promise" but it isn't an object yet
#download.file(url = "https://ndownloader.figshare.com/files/2292169",
#              destfile = "data_raw/portal_data_joined.csv")

## Load package for read_csv() function
#library(tidyverse)

## Save the data as an object called "surveys"
#surveys <- read_csv("data_raw/portal_data_joined.csv")

## Look at what this dataset looks like
#head(surveys)

## Other ways to explore the dataset
#print()
#tail()

## View the dataset in the RStudio viewer
#view(surveys)

# What are dataframes? ----------------------------------------------------

## Structure of surveys
#str(surveys)

## Other ways to explore surveys
#Size:
#dim(surveys) - returns a vector with the number of rows in the first element, and the number of columns as the second element (the dimensions of the object)
#nrow(surveys) - returns the number of rows
#ncol(surveys) - returns the number of columns
#Content:
#head(surveys) - shows the first 6 rows
#tail(surveys) - shows the last 6 rows
#Names:
#names(surveys) - returns the column names (synonym of colnames() for data.frame objects)
#rownames(surveys) - returns the row names
#Summary:
#str(surveys) - structure of the object and information about the class, length and content of each column
#summary(surveys) - summary statistics for each column

## Challenge

#Based on the output of str(surveys), can you answer the following questions?
  
#1. What is the class of the object surveys?
#2. How many rows and how many columns are in this object?

# Indexing and subsetting dataframes --------------------------------------

## Subsetting dataframes in different ways using indices
# first element in the first column of the data frame (as a vector)
#surveys[1, 1]   
# first element in the 6th column (as a vector)
#surveys[1, 6]   
# first column of the data frame (as a vector)
#surveys[, 1]    
# first column of the data frame (as a data.frame)
#surveys[1]      
# first three rows of the 6th column (as a vector)
#surveys[1:3, 6] 
# the 3rd row of the data frame (as a data.frame)
#surveys[3, ]    
# equivalent to head_surveys <- head(surveys)
#head_surveys <- surveys[1:6, ] 

## Exclude elements with "-"
#surveys[, -1]          # The whole data frame, except the first column
#surveys[-(7:34786), ] # Equivalent to head(surveys)

## Subsetting by calling column names instead of indices
#surveys["species_id"]       # Result is a data.frame
#surveys[, "species_id"]     # Result is a vector
#surveys[["species_id"]]     # Result is a vector
#surveys$species_id          # Result is a vector

## Challenge

#Create a data.frame (surveys_200) containing only the data in row
#200 of the surveys dataset.

#Notice how nrow() gave you the number of rows in a data.frame?
  
#Use that number to pull out just that last row in the data frame.
#Compare that with what you see as the last row using tail() to 
#make sure it's meeting expectations.
#Pull out that last row using nrow() instead of the row number.
#Create a new data frame (surveys_last) from that last row.
#Use nrow() to extract the row that is in the middle of the data frame. 
#Store the content of this row in an object named surveys_middle.

#Combine nrow() with the - notation above to reproduce the behavior 
#of head(surveys), keeping just the first through 6th rows of the surveys dataset.

# Factors -----------------------------------------------------------------

## Factors for categorical data
#surveys$sex <- factor(surveys$sex)
#summary(surveys$sex) #check it worked 

## How does R sort factors
#sex <- factor(c("male", "female", "female", "male"))
#levels(sex) #alphabetical sorting is default
#nlevels(sex) #how many levels it has

## Change factor order
#sex # current order
#sex <- factor(sex, levels = c("male", "female")) #re-define with levels argument
#sex # after re-ordering

## Challenge
#Change the columns taxa and genus in the surveys data frame into a factor.

#Using the functions you learned before, can you find out...

#How many rabbits were observed?
#How many different genera are in the genus column?

## Converting factors
#as.character(sex) #make variable a character as opposed to factor

## Using levels() function to factor a numeric variable
#year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
#as.numeric(year_fct)               # Wrong! And there is no warning...
#as.numeric(as.character(year_fct)) # Works...
#as.numeric(levels(year_fct))[year_fct]    # The recommended way.

## Renaming factors

# bar plot of the number of females and males captured during the experiment:
#plot(surveys$sex) #hides those undetermined

#sex <- surveys$sex #create a variable to manipulate of sex
#levels(sex) #get the levels of this factor

#sex <- addNA(sex) #add the NA values to this factor to get those unassigned values
#levels(sex) #what did this add?

#levels(sex)[3] <- "undetermined" #create a third level of the 'sex' factor
#levels(sex) #check it worked

#look at the sex vector
#head(sex)

#plot(sex) #see how this changed the barpolot

## Challenge

#Rename "F" and "M" to "female" and "male" respectively.

#Now that we have renamed the factor level to "undetermined", 
#can you recreate the barplot such that "undetermined" is first (before "female")?

## Challenge
#We have seen how data frames are created when using read_csv(), 
#but they can also be created by hand with the data.frame() function. 
#There are a few mistakes in this hand-crafted data.frame. 
#Can you spot and fix them? Don't hesitate to experiment!

#animal_data <- data.frame(
#          animal = c(dog, cat, sea cucumber, sea urchin),
#          feel = c("furry", "squishy", "spiny"),
#          weight = c(45, 8 1.1, 0.8)
#          )

#Can you predict the class for each of the columns in the following example? 
#Check your guesses using str(country_climate):
#Are they what you expected? Why? Why not?
#What would you need to change to ensure that each column had the accurate data type?

#country_climate <- data.frame(
#       country = c("Canada", "Panama", "South Africa", "Australia"),
#       climate = c("cold", "hot", "temperate", "hot/temperate"),
#       temperature = c(10, 30, 18, "15"),
#       northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
#       has_kangaroo = c(FALSE, FALSE, FALSE, 1)
#       )

# Formatting dates --------------------------------------------------------

##looking at surveys to see how dates are recorded in it
#str(surveys) #each part in a separate columns

## amazing package for dates
#library(lubridate)

## Create a date object with the ymd() function from lubridate
#my_date <- ymd("2015-01-01")
#str(my_date)

## Call date object in a different way
# sep indicates the character to use to separate each component
#my_date <- ymd(paste("2015", "1", "1", sep = "-")) 
#str(my_date)

## Apply this idea to the dataframe
#paste(surveys$year, surveys$month, surveys$day, sep = "-") #create a variable of all three columns together

##And use that paste() function inside the ymd() function
#ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

## Now create a column in the dataframe to 
#surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

## Did that column get added?
#str(surveys) # notice the new column, with 'date' as the class

## Look at this new column
#summary(surveys$date)

## Why did some data not parse?
#missing_dates <- surveys[is.na(surveys$date), c("year", "month", "day")]

#head(missing_dates)

## Why didn't they parse? And what would you do??







