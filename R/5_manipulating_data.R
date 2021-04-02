# UCSB EEMB R Workshop
# Day 2, Module 2
# Lesson - Manipulating Data

# The following script will walk through the "Manipulating Data" main concepts and will require the "tidyverse" and "palmerpenguins" to be installed.

# Lesson Plan -------------------------------------------------------------

# During this section, our three main goals are:

# - to learn some of the most useful functions within the tidyverse
# - to learn how to pipe one function into another
# - to describe the concept of a wide and a long table format and for which purpose those formats are useful


# Functions for tidying datasets ------------------------------------------

# Open new R file.

# Save as manipulating_data.R.

# Load necessary packages.
library(tidyverse)
library(palmerpenguins)

# Load necessary data.
penguins_raw <- palmerpenguins::penguins

# View the dataset.
View(penguins_raw)

# See the dataset structure.
str(penguins_raw)

# It is best practice when you are manipulating datasets to keep your raw dataset intact and create new datasets with your edits.

# Select
# Use the select() function to select column(s).

penguin1 <- select(penguins_raw, species, island, sex, year) # selects columns of interest

penguin2 <- select(penguins_raw, -bill_length_mm) # removes columns of interest

# Filter
# Use the filter() function to filter the data based on a certain condition that you specify.

penguin3 <- filter(penguins_raw, sex == "male") # filters for only male records

penguin4 <- filter(penguins_raw, body_mass_g > 4000 & sex == "female") # filters for multiple conditions

# Mutate
# Use the mutate() function to create new columns.
# mutate(data, newcolumn = stuff you did with existing columns)

penguin5 <- mutate(penguins_raw, bill_area_mm2 = bill_length_mm * bill_depth_mm) # create new column for bill area

penguin6 <- mutate(penguins_raw, size_category = case_when(
  body_mass_g < 3000 ~ "XS",
  body_mass_g >= 3000 & body_mass_g < 4000 ~ "S",
  body_mass_g >= 4000 & body_mass_g < 5000 ~ "M",
  body_mass_g >= 5000 ~ "L")) # create new column based on another column

# Challenge: 

# Create a new dataset where only penguins found on Dream Island are included.

penguin_dream <- filter(penguins_raw, island == "Dream")

# Create a new dataset where a new column called "penguin_index" is created by adding together penguin flipper length and body mass.

penguin_new <- mutate(penguins_raw, penguin_index = flipper_length_mm + body_mass_g)

# Piping `%>%` ------------------------------------------------------------

# Now, you may have realized that creating individual datasets for each function can become a bit tedious and confusing. This is where the pipe comes in!

# Pipes look like %>%, and can be typed out or created using the following shortcuts:

# Mac: Cmd + Shift + M
# PC: Ctrl + Shift + M

# Pipe operators (%>%) allow you to run all your manipulations in a single code chunk.

# Let's try it out.
penguin_pipe <- penguins_raw %>% # Create a new dataset called "penguin_pipe". First, starts with the raw dataset and then...
  filter(body_mass_g > 3000) %>% # Filter by body mass and then...
  select(species, island, bill_depth_mm) # Select only the columns of interest. End of pipe

# Challenge: Using the pipe operator, create a new dataset that contains data collected before 2009 and keeps only the columns reporting body mass, sex, and year.

penguin_pipe2 <- penguins_raw %>%
  filter(year < 2009) %>%
  select(body_mass_g, sex, year)

# Summarize

# Another helpful use of the pipe operator is when you'd like to summarize your dataset.

penguin_mf <- penguins_raw %>%
  group_by(sex) %>% # Group the dataset by a column's data.
  summarize(mean_mass = mean(body_mass_g, na.rm=TRUE)) %>% # Calculates the mean body mass by your grouping.
  ungroup() # Removes groupings. DON'T FORGET IT!!

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

# Long and wide formats ---------------------------------------------------

# Let's first create a smaller dataset to work with.
penguins_count <- penguins_raw %>%
  group_by(year, island) %>%
  summarize(count = n()) %>%
  ungroup()

# Pivot_wider

# Shortens dataset - increases columns, decreases rows

penguins_wide <- penguins_count %>%
  pivot_wider(names_from = island, values_from = count)

# Pivot_longer

# Lengthens dataset - increases rows, decreases columns

penguins_long <- penguins_wide %>%
  pivot_longer(Biscoe:Torgersen, names_to = "island", values_to = "count")

# Typically, you'll want your dataset in long format, but this can be a helpful transformation depending on the kind of analysis you'd like to do.

# Exporting a dataset

# Let's export our most recent dataset to our newly created "data" folder.
write_csv(penguins_long, file = "data/penguins_long.csv")

# End of script.
