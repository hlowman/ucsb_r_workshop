# Hacky Hour Afternoon Day 2
# Heili Lowman
# April 2, 2021

# This code will walk through the hacky hour on Day 2 of the R Workshop.

# Ggplot practice

# Load packages
library(tidyverse)
library(palmerpenguins)

# Load data
penguins_raw <- palmerpenguins::penguins

# ggplot review
# three parts of a plot are:
# (1) ggplot()
# (2) aes() - x & y axes
# (3) geom_x() - geometry

# Create a new plot for bill depth vs. bill length, and color points by species.
# Use "+" to add to plots.

dot_plot_hh <- ggplot(penguins_raw,aes(x = bill_length_mm,
                                       y = bill_depth_mm)) +
  geom_point(aes(color = species)) + # makes scatterplot
  labs(x = "Bill Length (mm)",
       y = "Bill Depth (mm)",
       title = "Penguin Bill Metrics",
       color = "Species") + # adds labels
  theme(plot.title = element_text(hjust = 0.5)) + # center title
  theme_classic() # removes grey background

# Look at the plot.
dot_plot_hh

# Link for helpful color palettes (including color-blind friendly):
# https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3

# Make a boxplot with points.
# Island (x), Bill Length (y), geom_boxplot

box_plot_hh <- ggplot(penguins_raw, 
                      aes(x = island,
                      y = bill_length_mm)) +
  geom_boxplot(aes(fill = island)) + # makes boxplot layer
  scale_fill_manual(values = c("#ffeda0", "#feb24c", "#f03b20")) + # pick island boxplot colors
  geom_jitter(aes(color = island)) + # makes spaced out points
  scale_color_manual(values = c("#e7e1ef", "#c994c7", "#dd1c77")) + # pick island point colors
  labs(x = "Island",
       y = "Bill Length (mm)") + # add labels
  theme_classic() + # removes grey background
  theme(legend.position = "none") # remove legend

# Look at plot.
box_plot_hh

# Export the figure.
ggsave("penguin_plot.png", box_plot_hh, 
       width = 10, height = 10, units = "cm", dpi = 320)

# End of script.
