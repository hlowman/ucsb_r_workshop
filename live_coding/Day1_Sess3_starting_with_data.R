### UCSB R workshop
### April 1st, 2021
### Day 1, Session 3: Starting with Data
### Tatum Katz and Caroline Owens

# This is the script for the UCSB Introduction to R workshop
# Session 3, Day 1. 

# Load external data into R

# start with a csv file from the internet
download.file(url = "https://ndownloader.figshare.com/files/2292169", 
              destfile="data_raw/portal_data_joined.csv")

# csv - "comma separated values"

# get the data into R
library(tidyverse)
surveys <- read_csv("data_raw/portal_data_joined.csv")

# look at the whole dataset
view(surveys)

# check out first 6 rows
head(surveys)

# check out bottom 6 rows
tail(surveys)

# dimensions of the dataset
dim(surveys) #prints [#rows, #cols]

# print entire dataset to console
print(surveys)

# get summary statistics
summary(surveys)

# challenge: what is the class of our dataframe?
class(surveys)
str(surveys)

# structure of the datset:
str(surveys)

# look at a single column by itself
surveys$species

# what unique values are in that column?
unique(surveys$species)

# look at a single row by itself, by row position
surveys[1,] #first row, all columns
surveys[1,6] #first row, sixth column

str(surveys)

#################
# Factor Data #
#################

# look at plot type
str(surveys$plot_type)
unique(surveys$plot_type)

#change plot_type to factors for data analysis -> coerce char to factor
surveys$plot_type <- factor(surveys$plot_type)
str(surveys$plot_type)

# make a dummy vector that is a factor
series <- factor(c("one", "two", "three", "two"))
str(series) #check that it is in fact a factor

# tells you the levels, ie the categories, or treatments 
levels(series)

# how many levels are there?
nlevels(series)

# lets make an ordered factor
series.ordered <- factor(series, levels=c("one", "two", "three"))
levels(series.ordered) #check your work
levels(series)

# challenge: using the columns taxa, genus in the surveys data set, 
# make them factors

surveys$taxa <- factor(surveys$taxa)
surveys$genus <- factor(surveys$genus)
#check that it worked
str(surveys$taxa) 
str(surveyse$genus)

# challenge pt 2: how many rabbits were observed?

summary(surveys$taxa) #tells you how many observations are in that level
summary(surveys$genus)

# challenge pt 3: how many different genera are in the genus column?

nlevels(surveys$genus)

# converting factors

# change a factor back to characters
series.char <- as.character(series)
series.char

# another dummy vector to play with - make it a factor
year.fct <- factor(c(1990, 1983, 1977, 1998, 1990))
year.fct

# change a factor to a numeric
year.num <- as.numeric(year.fct) #wrong!
year.num <- as.character(year.fct) #first make it as a character
year.num <- as.numeric(year.num) #then make it a numeric

year.num <- as.numeric(as.character(year.fct)) #nesting doll style


# plotting factor data
plot(surveys$plot_type)

# boxplot of weight by plot type
boxplot(weight ~ plot_type, data=surveys)
# y ~ x, data=dataset







