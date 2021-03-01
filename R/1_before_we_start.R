# UCSB EEMB R Workshop
# Day 1, Module 1
# Lesson - Before We Start

# The following script will walk through the "Before We Start"
# main concepts, but no coding will take place during this section.


# Welcome -----------------------------------------------------------------

# Introductions - Heili, Ana, helpers

# Schedule: mornings will be split into 3 hour-long lessons, with
# 15 minute breaks in between each one, and with a "hacky hour"
# practice session every afternoon after lunch

# Day 1: Welcome + Introduction to R/RStudio + Importing Data
# Day 2: Workflows + Tidying Data + Visualizing Data

# If you need assistance at any point, please type in the chat or
# raise your hand, and one of the helpers will reach out to you.

# At certain points during the lessons, we may ask you to confirm
# that things are going smoothly or if you're encountering any
# issues or need clarification. 
# Ask everyone to practice using green check and red "x".
# You can also click the little red "x" in Zoom if you're struggling
# with something, and the helpers know to look for that symbol.

# Installation - check to be sure everyone was able to download R
# and RStudio. Instructions available here : https://datacarpentry.org/R-ecology-lesson/index.html#Install_R_and_RStudio

#### PAUSE ####

# Anyone who was unable to download R and RStudio please let us
# know and we will place you in a breakout room with a helper to
# get you sorted out. Reassure them that they will not miss any
# coding content while downloading.


# Lesson Plan -------------------------------------------------------------

# During this first section, our three main goals are:

# - to understand what R and RStudio are and why they are useful to learn
# - to recognize the main components of RStudio
# - to provide any needed support for getting set up for the remaining lessons


# Why R? ------------------------------------------------------------------

# "R" refers to a programming language that has become an
# increasingly popular data science tool.
# This popularity is in large part due to the fact that the
# software is open source - meaning it is free to use and anyone
# can contribute to it.
# There are also a number of online communities built to support R
# and RStudio users, since it's used by people in diverse fields.
# We will provide you with several of our favorite online
# resources at the end of today, but we wanted to share with you
# early on, that R users at ALL LEVELS use online resources
# CONSTANTLY to help them figure out how to code for their projects.

# Some neat things about R to keep in mind:
# - It's not a "point and click" type of program, which means you
# will have a full record of what you do as you progress through
# an analysis. FUTURE YOU will be very thankful for this.
# - For similar reasons, R is also very collaboration-friendly.
# This means many of the protocols are easily shared across
# research groups and, importantly, across disciplines.
# - Finally, R is becoming increasingly adept at working with all
# kinds of data sets - standard Excel files, shapefiles,
# timeseries, etc.

# Open R.

# You should see a plain window, that looks like a text editor.
# This is the R console that interprets what we type into the
# computer and performs the resulting data analyses.
# However, this is not the most user-friendly interface.

# Close R.

# Open RStudio.

# Instead, most folks use RStudio to interact with R. The R
# software is still running under the hood (which is why you
# downloaded both before today's lesson), but you will interact
# within this window instead.

# For the remainder of this workshop, we will be working with RStudio.

# There are slight differences between Macs and PCs, but we will
# do our best to provide both sets of instructions when they may
# differ in our future lessons.


# Components of RStudio ---------------------------------------------------

# There are four basic components (moving counterclockwise) -
# - the Console
# - the Files/Plots/Help pane
# - the Environment
# - the Source

# The first part of RStudio that we will be working in is called
# the **Console**. This is the part of the application that tells
# you what R is running.

# Feel free to take a minute and type in the Console as you would
# a calculator and see what happens.

# 4 + 4 (Hit Enter.)

# Going counter-clockwise, the tabs in the next section allow you
# to see the **Files** that are associated with your code, the
# **Plots** you've created, the **Packages** that are installed,
# **Help** documents when you get stuck, and view additional HTML
# content you might create with the **Viewer** tab. Don't worry,
# we'll go over each of these more in detail soon.

# The most important thing to be familiar with here is the
# PACKAGES pane. R and RStudio come with some basic capabilities
# (usually referred to as base R), but everything else nice and
# fancy comes in a different package. In order to use what's in
# the package, we'll need to "attach" it. 

# Ana will go over this in the next lesson, but for now, you can
# think of this packages tab as your library. You'll need to take
# a book (or a package) off the shelf in order to read it, but
# they'll always be there for you to access. To "read" one of the
# packages, you simply need to click the checkbox next to a
# package to attach it. Then, you're good to go!

# Continuing counter-clockwise, you will find the **Environment**
# pane. This is where all of your datasets and variables will be
# stored. For example, let's say we assign a value of 4 to a
# variable named "cat". 

# Type, `cat <- 4` in the Console and hit Enter - it should now
# appear in your Environment. 

# The remaining tabs - History, Connections, etc. - will not be as
# important for today's lesson, so don't worry about them.

# Finally, we have the **Source** pane. This is where you'll be
# doing the majority of your coding during this workshop.

# To stay organized, you always want to start each time in R with
# a new PROJECT. To do so, navigate to File > New Project > 
# New Directory > New Project. Here, you should specify a 
# machine-readable name (no spaces or special symbols) for your
# project. Today, we'll call our project "r_ecology_workshop".
# Also, you want to be sure to save it somewhere memorable on
# your computer. I would recommend making an R specific folder
# on your desktop or somewhere else to keep all your scripts in 
# one place.

# By creating projects, you automatically create folders to keep
# your scripts organized. VERY important for keeping future you
# happy!

# Alright, now let's create a new file to work in today. 
# Navigate to File > New File > R Script and title it 
# "intro_to_R".

# You've just opened your first R script! YAY!

# This is where we will be working for the remainder of the
# workshop. If you were to do all your work in the Console, it
# would be like sending RStudio a bunch of text messages - they're
# quick and easy, but also you can't go back and edit them. And
# it's hard to navigate through the history.

# Instead, R scripts provide us a way of essentially typing out a
# giant Word document that can be edited, the changes tracked, and
# run in parts or in full. It gives you a lot more flexibility
# when coding, and also allows you to save your code in a file
# structure similar to other documents on your computer.

#### PAUSE ####

# Would anyone like any additional clarification on the different
# parts of RStudio?

# TO REVIEW: The CONSOLE is where R is running, the PACKAGES pane
# allows you to access additional functions, the ENVIRONMENT pane
# tells you what R has stored, and the SOURCE or SCRIPT is where
# you will be typing for the remainder of the workshop.


# Package Installation ----------------------------------------------------

# Before we take a break, we're going to make a few customizations
# to our RStudio and install a few packages (add a few books to
# our library) to prepare for our next lesson.

# First, navigate to your RStudio > Preferences.
# Under the General tab, find your Workspace section.
# Where it says "Restore .RData into workspace at setup." - make
# sure this is NOT checked and that the dropdown menu underneath
# reads as "Never".
# This makes sure you start with a blank slate each time you open
# up your RStudio.

# Next, navigate to the Appearance tab, and here you can customize
# the appearance and colors of your code.
# My personal favorites include using "Dracula" and "Pastel on
# Dark", since they're a bit easier on the eyes.
# Once you've made your selection, scroll to the bottom of the
# window and click "Apply".

# Then, type the following in the Console:

# install.packages("tidyverse")
# install.packages("here")
# install.packages("palmerpenguins")

# If you got an error, please reach out to one of the instructors
# and helpers for help.

# If you didn't, you may head out for your break. We'll see you in
# 15 minutes!

# End of script.
