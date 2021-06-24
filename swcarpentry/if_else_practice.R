install.packages("dplyr")
library(dplyr)

# Conditionals
num <- 37
num > 100

num < 100

if (num > 100) {
  print("greater")
} else {
  print("not greater")
}
print("done")

num <- 53
if (num > 100) {
  print("num is greater than 100")
}

sign <- function(num) {
  if (num > 0){
    return(1)
  } else if (num == 0){
    return(0)
  } else {
    return(-1)
  }
}

sign(-3)
sign(0)
sign(101)
sign(1/2)
sign(-2/3)


# other comparisons:
# >= greater than or equal to
# <= less than or equal to
# != not equal to
# == equal to
# && and - only true if both are true
# || or - true if one or both are true

if (1 > 0 && -1 > 0) {
  print("both are true")
} else {
  print("at least one is true")
}

if (1 > 0 || -1 > 0) {
  print("at least one is true")
} else {
  print("none are true")
}

a <- NA
a == 1 # if a variable is NA, it will return NA
a == NA # R says: "to check if a variable is NA, use is.na

if (a == NA) {
  print("Hi!")
}

is.na(a)

if (is.na(a)) {
  print("Hi!")
}


# Exercise: Write a function plot_dist that plots a 
# boxplot if the length of the vector is greater than 
# a specified threshold and a stripchart otherwise. 
# To do this you’ll use the R functions boxplot and stripchart.

inflam1 <- read.csv(file = "C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data/inflammation-01.csv", header = FALSE)

plot_dist <- function(v,threshold) {
  if(length(v) > threshold){
    boxplot(v)
  } else {
    stripchart(v)
  }
}

plot_dist(inflam1[,10], threshold = 10)
plot_dist(inflam1[1:5,10], threshold = 10)

plot_dist <- function(v, threshold, use_boxplot = TRUE) {
  if(length(v) > threshold && use_boxplot){
    boxplot(v)
  } else if(length(v) > threshold && use_boxplot){
    hist(v)
  } else {
    stripchart(v)
  }
}
plot_dist(inflam1[,10], threshold = 10, use_boxplot=TRUE)
plot_dist(inflam1[,10], threshold = 10, use_boxplot = FALSE)
plot_dist(inflam1[1:5,10], threshold = 10)


plot_dist <- function(x, threshold, use_boxplot = TRUE) {
  if (length(x) > threshold && use_boxplot) {
    boxplot(x)
  } else if (length(x) > threshold && !use_boxplot) {
    hist(x)
  } else {
    stripchart(x)
  }
}

# EXERCISE: Find the max inflammation score
# Find the file containing the patient with the highest average inflammation score. Print the file name, 
# the patient number (row number) and the value of the maximum average inflammation score.
# Tips:
# Use variables to store the maximum average and update it as you go through files and patients.
# You can use nested loops (one loop is inside the other) to go through the files as well as through the patients in each file (every row).

file_path <- "C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data"
filenames <- list.files(path = file_path, pattern = "inflammation-[0-9]{2}.csv", full.names = TRUE)
filename_max <- "" # filename where the maximum average inflammation patient is found
patient_max <- 0 # index (row number) for this patient in this file
average_inf_max <- 0 # value of the average inflammation score for this patient

for (f in filenames) { # looking through all the files
  dat <- read.csv(file = f, header = FALSE) # reading the file
  dat.means <- apply(dat, 1, mean) # getting the mean
  for (patient_index in 1:length(dat.means)){ # looking at each patient in the file
    patient_average_inf <- dat.means[patient_index] # finding the mean of each patient
    if (patient_average_inf > average_inf_max) { # checking if it's greater than the current max
      average_inf_max <- patient_average_inf # making the current patient avg the new max if it's greater
      filename_max <- f # changing the filename
      patient_max <- patient_index # changing the patient
    }
  }
}
print(filename_max)
print(patient_max)
print(average_inf_max)


















