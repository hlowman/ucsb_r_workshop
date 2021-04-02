#################
# Day 2, Session 2: Manipulating Data
# April 2, 2021
# Heili Lowman 
#################

# This script is from Day 2, Session 2 of the Introduction to R for 
# Ecologists workshop

# Load packages.
library(tidyverse)
library(palmerpenguins)

# Load in data.
penguins_raw <- palmerpenguins::penguins

# View the data.
View(penguins_raw)

# Look at the structure of the data.
str(penguins_raw)

# select() function - choose certain columns
penguin1 <- select(penguins_raw, species, island, sex, year)

# use "-" to remove selected columns
penguin2 <- select(penguins_raw, -bill_length_mm)

# Filter

# filter() function - filter by certain conditions
penguin3 <- filter(penguins_raw, sex == "male")
# filtering for only male records

penguin4 <- filter(penguins_raw, body_mass_g > 4000 & sex == "female")
# filtering for large, female penguins
# "&" stands for "and", "|" stands for "or"

# Mutate
# mutate() function - create new columns
penguin5 <- mutate(penguins_raw, bill_area_mm2 = bill_length_mm * bill_depth_mm)
# create new bill area column

penguin6 <- mutate(penguins_raw, size_category = 
                     case_when(body_mass_g < 3000 ~ "XS",
                               body_mass_g >= 3000 & body_mass_g < 4000 ~ "S",
                               body_mass_g >= 4000 & body_mass_g < 5000 ~ "M",
                               body_mass_g >= 5000 ~ "L"))
# creating new column with categories by body mass

# Challenge:
# Create a new dataset where only penguins found on Dream Island are included.
penguin_dream <- filter(penguins_raw, island == "Dream")
# "==" is for matching

# Create a new dataset where there's a new column called "penguin_index" which adds together flipper length and body mass.
penguin_new <- mutate(penguins_raw, penguin_index = flipper_length_mm + body_mass_g)

# Piping
# Pipes look like %>%
# Shortcuts: mac: command + shift + m
# pc: ctrl + shift + m

# Create our first pipe!
penguin_pipe <- penguins_raw %>% # Create a new dataset called "penguin_pipe". First, we start with raw data, and then...
  filter(body_mass_g > 3000) %>% # Filter by body mass, and then..
  select(species, island, bill_depth_mm) # Select only certain columns.

# Challenge: Using the pipe, create a new dataset with data collected before 2009 (filter()) and keep only the following columns - body mass, sex, and year (select()).
penguin_pipe2 <- penguins_raw %>% # raw data and then...
  filter(year < 2009) %>% # filter for year and then...
  select(body_mass_g, sex, year) # pull out 3 columns.

# Summary statistics
penguin_mean <- penguins_raw %>% # raw data
  group_by(sex) %>% # grouping by sex
  summarize(mean_mass = mean(body_mass_g, na.rm=TRUE)) %>% # creating a new column called "mean_mass" from the original body_mass_g column
  ungroup() # DON'T FORGET TO UNGROUP! (after using group_by)

# BONUS CONTENT:
# And you can group by multiple columns.
penguin_isl_sp <- penguins_raw %>%
  group_by(island,species) %>% 
  summarize(mean_mass = mean(body_mass_g, na.rm=TRUE)) %>% 
  ungroup()

# Base statistical functions in R:
# mean = mean()
# maximum = max()
# minimum = min()
# median = median()
# standard deviation = sd()

# Challenge : Create a new dataset that groups by species and sex and then calculates the statistic of your choice for flipper length.
penguin_sp_sx <- penguins_raw %>%
  group_by(species, sex) %>% 
  summarize(max_flipper = max(flipper_length_mm, na.rm=TRUE)) %>% 
  ungroup()

# Back to our regularly scheduled lesson:
# Long and wide formats
# Create a smaller penguin dataset.
penguins_count <- penguins_raw %>% # raw data
  group_by(year, island) %>% # group by year and island
  summarize(count = n()) %>% # count records
  ungroup() # always end with ungroup

# Examine data
View(penguins_count)

# pivot_wider()
# shortens dataset - increasing columns, decreasing rows
penguins_wide <- penguins_count %>% # tiny dataset
  pivot_wider(names_from = island, values_from = count)

# pivot_longer()
# lengthen dataset - increasing rows, decreasing columns
penguins_long <- penguins_wide %>% # wide dataset
  pivot_longer(Biscoe:Torgersen, names_to = "island", values_to = "count") # ":" allows us to select consecutive columns

# Export a dataset.
write_csv(penguins_long, "data/penguins_long.csv")
# Send to data folder, once dataset is manipulated.

# End of script.
