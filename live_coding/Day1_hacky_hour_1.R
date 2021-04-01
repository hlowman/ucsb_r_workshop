# Hacky Hour Afternoon Day 1
# Heili Lowman
# April 1, 2021

# This code will walk through the hacky hour on Day 1 of the R Workshop.

# Load packages.
library(tidyverse)
library(palmerpenguins)

# Load data.
penguin_data <- palmerpenguins::penguins

# Take a look at the data.
View(penguin_data)

# Find mean/average bill length (mm).
mean_bill <- mean(penguin_data$bill_length_mm, na.rm = TRUE)

# Look at new variable.
mean_bill

# Common functions: mean(), max(), min(), sd()

# We want to replace NAs with mean_bill (43.92193) in the bill length column only.
penguin_data <- replace_na(data = penguin_data, 
                           list(bill_length_mm = mean_bill))

# Count NAs in bill_depth_mm column only.
sum(is.na(penguin_data$bill_depth_mm))
# is.na() - True or False statement
# sum() - adds everything together

# Find NAs in bill_depth_mm column only.
# When you change a dataset in some way, it's good practice to make a new dataset entirely.
penguin_na <- filter(penguin_data, is.na(bill_depth_mm) == TRUE)

# Look at new dataset.
View(penguin_na)

# Take out one full row of the dataset (all other columns too).
# "!" means "not"
# "!=" mean "does not equal"
# "&" means "and", "|" means "or"
penguin_rm <- filter(penguin_data, flipper_length_mm != 231 & body_mass_g != 6300)

# Look at new dataset.
View(penguin_rm)

# Sort the bill length column from smallest to largest (ascending).
penguin_order <- arrange(penguin_data, bill_length_mm)
# Sort by descending - arrange(penguin_data, desc(bill_length_mm))

# Look at new dataset.
View(penguin_order)

# End of script.
