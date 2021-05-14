# Coding Club Workshop 1 - R Basics
# Learning how to import and explore data, and make graphs about Edinburgh's biodiversity
# Written by Gergana Daskalova 06/11/2016 University of Edinburgh
install.packages("dplyr")
library(dplyr)
# Note that there are quotation marks when installing a package, but not when loading it
# and remember that hashtags let you add useful notes to your code! 
edidiv <- read.csv("C:/Users/marti/Documents/RStudio_Practice/ourcodingclub_tutorials/CC-RBasics-master/CC-RBasics-master/edidiv.csv")

head(edidiv) #Displays the firts few rows
tail(edidiv) #Displays the last few rows
str(edidiv) #Tells you whether the variables are continuous, integers, categorical or characters


