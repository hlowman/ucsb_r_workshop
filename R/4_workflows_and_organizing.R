# UCSB EEMB R Workshop
# Day 2, Module 1
# Human-friendly workflows

# REMEMBER TO BEGIN RECORDING.

# Welcome -----------------------------------------------------------------

# Introductions - Heili, Ana, helpers
# Name, field of study, and if you could be any Emoji, what would it be and why?

# Schedule: morning will be split into 3 hour-long lessons, with
# 15 minute breaks in between each one, and with a "hacky hour"
# practice session every afternoon after lunch

# Day 1: Welcome + Introduction to R/RStudio + Importing Data
# Day 2: Workflows + Tidying Data + Visualizing Data

# Want to take just a few minutes to be sure everyone is comfortable with using the virtual setup and knows how to get help and support.

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

# NAVIGATE TO WEBSITE ON SCREEN SHARE

#	Reminder about the website for schedule, topics, and scripts from yesterday
#	Adding videos to the website next week

# Community:
#	We can’t cover everything that R and RStudio have to offer in terms of data management, analysis, and 
# visualization in two days, so we’ve put a few resources on the website that we have all found useful in the past. 

# The following will walk through human-friendly workflows for data and code organization.
# There is very little coding in this lesson. 

# Lesson Plan -------------------------------------------------------------

# This morning, we're going to take a step back and talk about how to organize
# your code and files. Up until now, you are working within a pre-defined 
# structure we provided for you. This lesson will help you think about the 
# organization approaches that make sense for your projects and help you start off
# with organization skills that won't make you cry.

#Specifically we will talk about:
# - folder and subfolder organization for projects with data, code, and more
# - using R Projects to transfer this organziation to RStudio
# - using the here() package for code that can be run anywhere by anyone

# Folder organization and R Projects -----------------------------------------------------

#Data and code organization and re-inforcing the R Project
# Challenge: think about a project you will or are currently working on. 
#Make a list of what types of files you might have for that project. 
#Now, try to think of ways to put those into folders. Put the possible folder names into the chat. 

# We specified a raw data and data folder because it's always a good idea to 
# keep a raw version of your data somewhere in perpetuity that you don't change 
# by any downstream analysis or manipulation. We can go into the why of the ethics on
# this, but yes, there are very noteworthy cases when data comes into question and 
# researchers have not been able to produce data and suffered the consequences of 
# not being able to prove data were real.

# Then, depending on your project, you might have different subfolders in here as well
# such as a folder for paper drafts, or a 'notes' folder from meetings associated with
# the project. 

# Create files and folders for them to make some file and folder organization for this project as I do it

# In that folder, or working directory, there will be an R project. 
# ‘One R project per research project’. 
#We are emphasizing the R project because it’s a way to save yourself a lot of time and hassle wondering
#WHERE ARE MY DATA because it translates all the organization you’ve created in your computer folders to R. 

#	What do I mean by that? If you have an R session open, close it. 
#Now, open R Studio from your applciations. Where does R think you are (Project in right hand side says none). 

# Type in the function in the console 

getwd()

#	Let’s try and re-load our data from yesterday now

library(tidyverse)

surveys <- read_csv(“data_raw/portal_data_joined.csv”)

#Why didn’t it work?

# Let’s fix this by navigating either to the corner and selecting an R project there, 
#or navigating to the File → Open Menu. OR. Go ahead and close R Studio and I’ll show you a quicker way.

# Navigate to your folder with your scripts. 
#Now, you will see an object with the extension .RProj. 
#Double clik on that and R Studio will open up within your R project right away. 

#Let’s re-type 

getwd() 

#now where are we?

#	Let’s try re-loading surveys again

library(tidyverse)

surveys <- read_csv(“data_raw/portal_data_joined.csv”)

# Once you start working on several different projects (and maybe you already have started)
# and maybe even with multiple collaborators on projects, having clear and 
# consistent file and folder organization is going to save you so much time
# and heartache.

# There is no prescriptive file and folder organization strategy and it will likely
# depend on the project you're working on.

# This is the beauty of the R Project. We created an R Project with you for this workshop

## PAUSE##

# A couple last things I will point out about the R Project capability in R studio.

# If you look to the bottom right hand part of your RSTudio envrionment, you can see a 
# Files tab. If you ever want to remember what is in your project, you can navigate in this
# pane really similarly to if you were navigating through folders in your computer. I find 
# this to be a useful tool if I ever forget where a file lives or what I called it

# The second thing I will point out is that your RStudio icon on your screen has a 
# little banner below it when you are in a specific project - this helps you know
# whether you are in this project or not and scary though it is - you could have multipe
# RStudio windows open at a time for multiple projects. But why do that to yourself...

## PAUSE ##

# The here package --------------------------------------------------------

# Coding in R is learning another language. A language of computers. I hope everyone
# finds that the rest of the content of the day help to somewhat "translate" that 
# language into more human-friendly ways of describing data and the objects that 
# R works with. I'm going to start an introduction to that theme for the rest of the 
# day by introducing one of my favorite R packages, the here package.

# Up to now, we have been importing data into R using a file path, something like

file <- read_csv("subfolder\file.csv")

# This code is reproducible, in that as long as someone downloads or receives
# the entire folder attached to your R Project, they'll be able to have your 
# code run on their computer without having to edit it in any way. 

# However, this way of calling files wiht a "file path" is a little 
# computer-y, and depending on platforms, the conventions of \ or / can actually
# be diferent and cause problems sometimes

# The here package takes this file path and converts it into something that 
# to me at least makes a little more sense and doesn't run the risk of these 
# \ / problems. 

# LEt's start by installing the here package with

install.packages("here")

# Now let's load it, again, using the library() funciton to bring it into our 
# library or collection of packages on our computer

library(here)

# You'll notice that when you load the package, the package automatically
# tells you wehre you currently "live" in your computer.

# The primary function of the here package is actually the here() function.
# Called on its own, it works like the getwd() function, and tellls you where
# you currently live on your computer. Let's try it.

here()

# This path will look differnet on everyone's computers, but on mine 
# it tells me that I'm in a set of folders that end in the folder where my R Project is
# which is the ucsb_r_workshop folder

# If we use the here function inside another function to find a specific file, such
# as when if you recall from yesterday we used the read_csv function to call in a file
# from our computer, rather than calling the file based on \ or / based file paths, 
# we will use the names of folders and files separted by a comma ',' and surrounded by
# quotation marks ' ' to represent different "arguments" 
# in the here() function. In this case, an argument corresponds to a file or folder
# or, anything that is nested between a set of \\ or // in a fiel path your computer uses
# Let's do it with an example. 

# Ok, so recall from yesterday we called the surveys csv with the function read_csv()
# let's start there to figure out how to convert the file path for the here function

surveys <- read_csv("data_raw/portal_data_joined.csv")

# Let's convert this call to the way the here() function would find this file. We 
# will be using the here() function nested within the read_csv() function.

surveys_here <- read_csv(here('data_raw', 'portal_data_joined.csv'))

# When we call surveys this way, each part of the file path represents an "arugment"
# to the here package. You can see that every argument is just the text that is 
# sandwiched between a set of // or \\ in a file path. So, in this case,
# the here function is looking in the "data_raw" subfolder to find the 
# "portal_data_joined.csv" file. I like to think of the here function as saying to 
# my computer, ok, so starting where we are in the working directory look here (the 
# 'data_raw' folder) and then look here (portal_data_joined.csv) to find what i'm looking for

# This isn't a necessary tool, but I find it to be a way to convert something
# from computer speak to human speak. 

# Challenge ---------------------------------------------------------------

# optional: take a file path from your work from yesterday from a data file
# you imported on your own. Try and convert it to using the here() function!





