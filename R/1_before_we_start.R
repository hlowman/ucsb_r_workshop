# UCSB EEMB R Workshop
# Day 1, Module 1
# Lesson - Before We Start

# The following script will walk through the "Before We Start"
# main concepts, but no coding will take place during this section.

# As we wait for folks to join, please take a moment to fill out the
# pre-workshop survey if you haven't already.

# GO SLOW.

# TURN ON CLOSED CAPTIONING.

# REMEMBER TO BEGIN RECORDING.

# Welcome -----------------------------------------------------------------

# Introductions - Heili, Ana, helpers
# Name, field of study, and favorite recent meal - falafel sandwich

# Schedule: mornings will be split into 3 hour-long lessons, with
# 15 minute breaks in between each one, and with a "hacky hour"
# practice session every afternoon after lunch

# Day 1: Welcome + Introduction to R/RStudio + Importing Data
# Day 2: Workflows + Tidying Data + Visualizing Data

# Want to take the next 15-20 minutes to be sure everyone is comfortable with using the virtual setup and knows how to get help and support.

# During this first "Welcome" lesson, I'm going to walk through the Zoom 
# and RStudio programs with everyone so that you feel comfortable using 
# them for the remaining lessons.

# If you need assistance at any point, please type in the chat or
# raise your hand, and one of the helpers will reach out to you.

# Just to be certain everyone knows how to do this, please take a moment
# and type YOUR FAVORITE MEAL in the chat.

# PAUSE

# Now, raise your hand.

# PAUSE

# At certain points during the lessons, we may ask you to confirm
# that things are going smoothly or if you're encountering any
# issues or need clarification. 

# If things are going well, we'll ask you to give us a "thumbs up".
# Please take a moment and give us a "thumbs up".

# If things are not going well, we'll ask you to "raise your hand".

# So, just to clarify:
# Raise your hand or type in the chat if you have a question.
# Give us the thumbs up if you're doing alright.

# Are there any questions about using Zoom during this workshop?

#### PAUSE ####

# You are more than welcome to leave your cameras on.
# But we ask that everyone mute themselves unless they've been
# called on to speak by the instructor.

# Before we go further, I would also like to remind everyone of
# our workshop code of conduct:
# https://rladies.org/code-of-conduct/
# If anyone would like to report a violation of this code of
# conduct, they can do so here:
# https://docs.google.com/forms/d/e/1FAIpQLSfISSlxKKqRxVxdvdz-ytm4581IQcXw3CrZybR3xlowCOUcag/viewform

#### PAUSE ####

# Installation - check to be sure everyone was able to download R
# and RStudio. Instructions available here : 
# https://datacarpentry.org/R-ecology-lesson/index.html#Install_R_and_RStudio

# Anyone who was unable to download R and RStudio please let us
# know in the chat and we will place you in a breakout room with a 
# helper to get you sorted out. You will not miss any coding content
# while downloading.

# SHARE SCREEN.

# OPEN POWERPOINT.

# GO THROUGH SLIDES.

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

# CLOSE POWERPOINT.

# Open R.

# You should see a plain window, that looks like a text editor.
# This is the R console that interprets what we type into the
# computer and performs the resulting data analyses.

# 4 + 4 (Hit Enter.)

# However, this is not the most user-friendly interface.
# Let us try RStudio instead.

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

# You can see this works exactly as it did in R, but we have
# lots more capabilities in RStudio.

# Going counter-clockwise, the tabs in the next section allow you
# to see the **Files** that are associated with your code, the
# **Plots** you've created, the **Packages** that are installed,
# **Help** documents when you get stuck, and view additional HTML
# content you might create with the **Viewer** tab. We'll go over
# each of these more in detail shortly.

# TYPE "mean" in HELP TAB.

# The most important thing to be familiar with here is the
# PACKAGES pane. R and RStudio come with some basic capabilities,
# but everything else nice and fancy comes in a different package.
# In order to use what's in the package, we need to "attach" it.

# Ana will go over this in the next lesson, but for now, you can
# think of this packages tab as your library. You'll need to take
# a book (or a package) off the shelf in order to read it, but
# they'll always be there for you to access. To "read" one of the
# packages, you simply need to click the checkbox next to a
# package to attach it. Then, you're good to go!

# You can also type the library() command in the console,
# and it will attach a package.

# Continuing counter-clockwise, you will find the **Environment**
# pane. This is where all of your datasets and variables will be
# stored. For example, let's say we assign a value of 4 to a
# variable named "cat". 

# Type, `cat <- 4` in the Console and hit Enter - it should now
# appear in your Environment. 

# This can now be used in future code.
# Type, `cat * 10` in the Console and hit Enter - what happens?

# The remaining tabs - History, Connections, etc. - will not be as
# important for today's lesson, so don't worry about them.

# Finally, we have the **Source** pane. This is where you'll be
# doing the majority of your coding during this workshop.

# Now that we've walked through the different parts of RStudio,
# let's get set up for today's lesson.

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

# Now, let's create a file to store IN that project.
# Navigate to File > New File > R Script and title it 
# "intro_to_R".

# Your source pane should now open with the title "intro_to_R" along
# the top of the pane.

# You've just opened your first R script! YAY!

# PAUSE

# If anyone is having trouble creating this file,
# please let one of the helpers know.

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
# Click "Apply".

# Next, navigate to the Appearance tab, and here you can customize
# the appearance and colors of your code.
# My personal favorites include using "Dracula" and "Pastel on
# Dark", since they're a bit easier on the eyes.
# Once you've made your selection, scroll to the bottom of the
# window and click "Apply".

# Then, type the following in the Console, hitting Enter each time:

# install.packages("tidyverse")
# install.packages("here")
# install.packages("palmerpenguins")

# If you got an error, please reach out to one of the instructors
# and helpers for help.

# If you didn't, please give us a thumbs up emoji, and you may head out 
# for your break. We'll see you in 15 minutes!

# REMEMBER TO STOP RECORDING.

# End of script.
