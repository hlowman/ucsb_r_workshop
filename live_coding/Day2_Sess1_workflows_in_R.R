# Workflows in RStudio
# Ana Miller-ter Kuile
# April 2, 2021

# find out our working directory
getwd()

# We explored how the results of this function change 
# depending on whether we are living in our RProject
# or not. RProjects save you time and heartache!!

# load tidyverse package
library(tidyverse)

# load the surveys dataset
surveys <- read_csv("data_raw/portal_data_joined.csv")


# here package intro ------------------------------------------------------

# load here package
library(here)

# the here function tells us where we are on our computer
here()

#load surveys with here function
surveys_here <- read_csv(here("data_raw", 
                              "portal_data_joined.csv"))

#the here function takes each folder and subfolder leading 
# up to our file of interest, encloses them in a set of 
# " " and then each is followed by a "," as opposed to
# "\" or "/". 
