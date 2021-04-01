# UCSB EEMB R Workshop
# Day 2, Module 1
# Human-friendly workflows

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

# Folder organization -----------------------------------------------------

# Once you start working on several different projects (and maybe you already have started)
# and maybe even with multiple collaborators on projects, having clear and 
# consistent file and folder organization is going to save you so much time
# and heartache.

# There is no prescriptive file and folder organization strategy and it will likely
# depend on the project you're working on.

# Let's take the example of the folder we had you download for this workshop. 
# I'm going to open mine and you can follow along on your computer or just watch.

# We started by creating a top folder (in R speak, this is your working directory)
# with a name that corresponds to the project name, in this case "ucsb r workshop"
# Then, we created subfolders inside this top folder (directory) corresponding to 
# different aspects of our project, including a "raw data", "data", and "code" or "R" 
# folder. We specified a raw data and data folder because it's always a good idea to 
# keep a raw version of your data somewhere in perpetuity that you don't change 
# by any downstream analysis or manipulation. We can go into the why of the ethics on
# this, but yes, there are very noteworthy cases when data comes into question and 
# researchers have not been able to produce data and suffered the consequences of 
# not being able to prove data were real.

# Then, depending on your project, you might have different subfolders in here as well
# such as a folder for paper drafts, or a 'notes' folder from meetings associated with
# the project. 

# Challenge ---------------------------------------------------------------

# Think about a project you are or will be working on - what folders might you include
# in this project (enter in chat).

# R Projects --------------------------------------------------------------

# A big reason I want to spend time on file and folder organization is that it directly
# links to how much of a headache it is to link your workflow to R. Having good file and 
# folder organization is the first step - making sure it talks to R is the next step.

# This is the beauty of the R Project. We created an R Project with you for this workshop
# and have been having you use it to open and close RStudio. What is this thing even 
# doing?

# An R Project is a special kind of RStudio add-on that tells RStudio where your project 
#"lives" and where it should start looking for things when you start to work on a project 
# which means - it tells your computer that whereever the R project is is your "working
# directory" and all the files and data you import into R from a project live somewhere
# inside that working directory in a subfolder.

# So lets open R Studio with your R Project icon. Where are we living on your computer?
# We can get this information by typing in the get working directory function

getwd()

# This will look different on every computer, but corresponds to where your working directory,
# or where the R project on your computer is. 

# Open R Studio environment that doesn't have a project associated

# I have an R Studio environment open here that doesn't have an R Project just to show you
# the beauty of this project. If I type getwd() into this window, 

getwd()

# I get my base directory,
# which means to get to where my files and folders are I would have to use extra functions
# to get there or I would have to specfiy really long file paths every time I wanted to get 
# to somewhere with my data and code. 

# Needless to say, R Projects are really really useful for helping you stay organized

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





