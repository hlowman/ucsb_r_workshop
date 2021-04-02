#################
# Day 2, Session 3: Visualizing Data
# April 2, 2021
# Sam Sambado
#################

# This script is from Day 2, Session 3 of the Introduction to R for 
# Ecologists workshop

# load necessary packages
library(tidyverse) # make tidy data, always install this package
library(palmerpenguins) # built in data set from Dr. Allison Horst
library(patchwork) # arranges finalized graphs

# load necessary data
penguins_raw <- palmerpenguins::penguins

# let's look at data

View(penguins_raw)

str(penguins_raw)

## Today, we will be using the ggplot2 package (bundled as part of the tidyverse) to create our figures.

#Ggplot figures typically consist of three main parts:
  
# + (1) ggplot() = builds the plot using your data

# + (2) geom_*() = tells R what kind of plot (bar, point, boxplot, etc.)

# + (3) aes() = control your variables and aesthetics (color, shape, etc.)

#Let's create a basic scatterplot using our palmer penguins dataset so that we can see these parts in action.

(dot_plot <- ggplot(penguins_raw, aes(x = body_mass_g, y = flipper_length_mm)) +
    geom_point())

# Let's change the point size.

(dot_plot2 <- ggplot(penguins_raw, aes(x = body_mass_g, y = flipper_length_mm)) +
    geom_point(size = 3))

# Or the point color.

dot_plot4 <- ggplot(penguins_raw, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point(aes(color = species))

# Most often you'll want to change the point color according to another part of the dataset.

dot_plot4 <- ggplot(penguins_raw, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point(aes(color = species))

# Now populate the rest of the plot (scale, labels, theme, etc.).

dot_plot5 <- ggplot(penguins_raw, aes(x = body_mass_g, y = flipper_length_mm)) + # this is the data we want to plot
  geom_point(aes(color = species)) + # shape of the data are points, and we want to color them by species type
  scale_color_manual(values = c("darkorange", "purple", "cyan4")) + # we're giving species type a specific color
  labs(x = "Body Mass (g)", # labels to x axis
       y = "Flipper Length (mm)", # labels to y axis
       title = "Penguins Body Metrics", # main title label
       color = "Species") + # legend/color label
  theme_classic() # change the background color of our plot

# Compare basic to final graph - a big visual difference even with the same data!

# first graph
dot_plot
# final graph
dot_plot5

# Additional Plot Types
# Bar Plot with FACETS
# Facetting allows you to break up your figure by a grouping based on your dataset

bar_plot <- ggplot(penguins_raw, aes(x = sex, fill = species))+ # set axes/color
  geom_bar(position = "dodge")+ # plot type (bar plot)
  scale_fill_manual(values = c("darkorange", "purple", "cyan4")) + # choose colors
  labs(x = "Sex", # add labels
       y = "Count")+
  theme_bw()+
  facet_wrap(facets = vars(island)) # add facets

# Customizing Plot Layout

# R also provides handy ways of combining plots of unique data (separate from facetting).
# Today, we'll demonstrate the patchwork() package, but we will also provide you with resources for additional packages.

# You can use "+" or "|" to add plots into a single row and "/" to add additional rows.

full_plot <- (bar_plot | dot_plot5) /# we are using our 2 plots, separate them with |
  dot_plot2 # / starts a plot on another line

# And to export your plot, you can use the ggsave() function.

ggsave("full_plot.pdf", full_plot, # give pdf name, supply plot you want printed
       width = 8, height = 6,   # extra arguments for exported image
       units = "in", 
       dpi = 320) # resolution of image on your computer

# Additional Resources 

# Color blindness simulator - make figures that are color blind friendly!  
# https://www.color-blindness.com/coblis-color-blindness-simulator/
  
# R graph gallery - find what looks good to you and copy the code!
# https://www.r-graph-gallery.com/
  
# index of ggplot basics
# https://ggplot2.tidyverse.org/reference/#section-aesthetics
  
# Fundamentals of Data Visualization - if you want more practice
# https://clauswilke.com/dataviz/

# End of script.

