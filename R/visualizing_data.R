# UCSB EEMB R Workshop
# Day 2, Module 3
# Lesson - Visualizing Data

# The following script will walk through the "Visualizing Data" main concepts and will require the "tidyverse" and "palmerpenguins" to be installed.

# Lesson Plan -------------------------------------------------------------

# During this section, our three main goals are:

# - to learn how to create a basic scatterplot in ggplot2
# - to learn some additional customizations and plot types
# - to learn how to customize plot layout in patchwork


# Basic Scatterplot -------------------------------------------------------

# Load necessary packages.
library(tidyverse)
library(palmerpenguins)
library(patchwork)

# Load necessary data.
penguins_raw <- palmerpenguins::penguins

# View the dataset.
View(penguins_raw)

# See the dataset structure.
str(penguins_raw)

# Today, we will be using the ggplot2 package (bundled as part of the tidyverse) to create our figures.

# Ggplot figures typically consist of three main parts:
# (1) ggplot() = builds the plot using your data
# (2) geom_*() = tells R what kind of plot (bar, point, boxplot, etc.)
# (3) aes() = control your variables and aesthetics (color, shape, etc.)

# Let's create a basic scatterplot using our palmer penguins dataset so that we can see these parts in action.

# I recommend saving your plots (exactly as you would save a variable) so that you can call it quickly.

dot_plot <- ggplot(penguins_raw, # specify dataset
                   aes(x = body_mass_g, y = flipper_length_mm)) + # specify axes in aesthetics
                   geom_point() # specify type of plot (scatterplot)

# When you run the above code, it won't immediately appear, but rather be saved in your Environment (take a moment to check to be sure it's there).

# Now, you can run `dot_plot` + `Enter` in the Console and it should appear in your "Plots" pane in the bottom right hand corner.

# Note, if you try and run the following it will give you an error message due to a misplaced "+":
# ggplot(penguins_raw,
#        aes(x = body_mass_g, y = flipper_length_mm))
#   + geom_point()


# Notice how it auto-populates the axis labels and automatically sets ranges for axes as well - all of this can be customized.

# Let's spiff up the figure a bit so that it would be presentable as part of publication. (Start by copy/pasting the above figure code.)

# NOTES FOR INSTRUCTOR - THERE ARE SEVERAL ITERATIVE VERSIONS OF THE SAME PLOT STEPPING THROUGH THE CUSTOMIZATIONS BELOW.
# Encourage folks to copy paste the same figure alongside you as you make these step-by-step edits, changing the variable name each time.

# Let's change the point size.
dot_plot2 <- ggplot(penguins_raw,
                  aes(x = body_mass_g, y = flipper_length_mm)) +
                  geom_point(size = 3)

# Or the point color.
dot_plot3 <- ggplot(penguins_raw,
                  aes(x = body_mass_g, y = flipper_length_mm)) +
                  geom_point(color = "blue")

# Most often you'll want to change the point color according to another part of the dataset.
dot_plot_fancy <- ggplot(penguins_raw,
                  aes(x = body_mass_g, y = flipper_length_mm)) +
                  geom_point(aes(color = species)) # color by species

# Now populate the rest of the plot (scale, labels, theme, etc.).
dot_plot_fancy <- ggplot(penguins_raw,
                  aes(x = body_mass_g, y = flipper_length_mm)) + 
  geom_point(aes(color = species)) + # color by species
  scale_color_manual(values = c("darkorange","purple","cyan4")) + # choose colors manually
  labs(x = "Body Mass (g)",
       y = "Flipper Length (mm)",
       title = "Penguin Body Metrics",
       color = "Species") + # adds appropriate labels
  theme_classic() # removes gray background

# You can easily go down the rabbit hole with color schemes, so for folks who are interested, we will provide you with resources at the close of today to access other color palettes.

# Challenge : Create a new plot named "dot_plot_mine" that plots bill depth by bill length and colors by species. Make sure your axes are labeled appropriately.

dot_plot_mine <- ggplot(penguins_raw,
                 aes(x = bill_length_mm, y = bill_depth_mm)) + 
  geom_point(aes(color = species)) + 
  scale_color_manual(values = c("darkorange","purple","cyan4")) + 
  labs(x = "Bill Length (mm)",
       y = "Bill Depth (mm)",
       title = "Penguin Bill Metrics",
       color = "Species") +
  theme_classic() 

# Additional Plot Types ---------------------------------------------------

# Let's explore a few more different kinds of plots we can make.

# First, we'll create a box plot with a jittered scatterplot layered over top of it.

box_plot <- ggplot(penguins_raw,
                   aes(x = species, y = bill_length_mm,
                       fill = species)) + # fills the boxes
  geom_boxplot() + # specify type of plot (boxplot)
  geom_jitter(alpha = 0.2) + # specify type of plot (jitter)
  # alpha changes the opacity of the color
  scale_fill_manual(values = c("darkorange","purple","cyan4"),
                     guide = FALSE) + # remove legend
  labs(x = "Species",
       y = "Bill Length (mm)",
       title = "Penguin Bill Statistics") + 
  theme_classic() # removes gray background

# Notice, you can put multiple geometries on a single plot, but be sure to layer carefully - R will layer them in the order they are presented in your script.

# Bar Plot with FACETS

# For the following example, we will create a bar plot figure facetted by island.

# Facetting allows you to break up your figure by a grouping based on your dataset.

bar_plot <- ggplot(penguins_raw, # specify dataset
       aes(x = sex, fill = species)) + # set axes/color
  geom_bar(position = 'dodge') + # plot type (bar plot)
  scale_fill_manual(values = c("darkorange","purple","cyan4")) + # choose colors
  labs(x = "Sex",
       y = "Count",
       title = "Penguin Population Metrics",
       fill = "Species") + # add labels
  theme_classic() + # remove gray background
  facet_wrap(facets = vars(island)) # adds facets


# Customizing Plot Layout -------------------------------------------------

# R also provides handy ways of combining plots of unique data (separate from facetting).

# Today, we'll demonstrate the patchwork() package, but we will also provide you with resources for additional packages.

# You can use "+" or "|" to add plots into a single row and "/" to add additional rows.

full_plot <- (dot_plot_fancy | box_plot) /
             bar_plot

full_plot

# And to export your plot, you can use the ggsave() function.

ggsave("full_plot.pdf", full_plot, 
       width = 8, height = 6, units = "in")

# End of script.
