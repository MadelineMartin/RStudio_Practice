install.packages("dplyr")
library(dplyr)

# Fahrenheit to Celsius function
f_to_c <- function(temp_F){
  temp_C <- (temp_F - 32)*5/9
  return(temp_C)
}

f_to_c(32) # freezing
f_to_c(212) # boiling

# Celsius to Kelvin function

c_to_k <- function(temp_C) {
  temp_K <- temp_C + 273.15
  return(temp_K)
}

c_to_k(0) #freezing point of water

# Fahrenheit to Kelvin
f_to_k <- function(temp_F) {
  temp_C <- f_to_c(temp_F)
  temp_K <- c_to_k(temp_C)
  return(temp_K)
}
f_to_k(32.0) # freezing point of water

# nesting functions
c_to_k(f_to_c(32.0))


# Exercise: Create a function that takes in 2 vectors 
# returns a new vector that has the wrapper vector at the beginning and end of the content
highlight <- function(content,wrapper) {
  new_vector <- c(wrapper,content,wrapper)
  return(new_vector)
}
secret <- "top secret"
message <- c("you","are","cute","!")
highlight(message,secret)


# Testing, Error Handling, and Documenting
center <- function(data,midpoint) {
  new_data <- (data - mean(data)) + midpoint
  return(new_data)
}
z <- c(0,0,0,0)
z
center(z,3)

inflam <- read.csv(file = "C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data/inflammation-01.csv", header = FALSE)
centered <- center(inflam[,4],0) # center inflammation data from day 4 - 0
head(centered)

mean(inflam[,4]) # original mean
mean(centered) # centered mean

sd(inflam[,4])
sd(centered)
sd(inflam[,4])-sd(centered)
all.equal(sd(inflam[,4]),sd(centered))

# Error handling
datNA <- inflam
datNA[10,4]<- NA
center(datNA[,4],0)

center <- function(data,midpoint) {
  new_data <- (data-mean(data, na.rm=TRUE)) + midpoint
  return(new_data)
}
center(datNA[,4],0)

datNA[,1] <- as.factor(datNA[,1])
datNA[,2] <- as.character(datNA[,2])

center(datNA[,1],0)

center(datNA[,2],0)

# Documentation
center <- function(data,midpoint) {
  # return a new vector containing the original data centered around the midpoint.
  # Example: center(c(1, 2, 3), 0) => c(-1, 0, 1)
  new_data <- (data - mean(data)) + midpoint
  return(new_data)
}

# Exercise: Functions to create graphs
# Write a function called analyze that takes a filename as an argument and displays 
# the three graphs produced in the previous lesson (average, min and max inflammation over time).

analyze <- function(filename) {
  
  dat <- read.csv(filename, header = FALSE)
  
  avg_day_inf <- apply(dat,2,mean)
  plot(avg_day_inf)
  
  max_day_inf <- apply(dat,2,max)
  plot(max_day_inf)
  
  min_day_inf <- apply(dat,2,min)
  plot(min_day_inf)
  
}

analyze("C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data/inflammation-01.csv")
analyze("C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data/inflammation-02.csv")


# Exercise: Rescaling
# Write a function rescale that takes a vector as input and returns a corresponding vector 
# of values scaled to lie in the range 0 to 1.
rescale <- function(vectr) {
  L <- min(vectr)
  H <- max(vectr)
  new_vectr <- (vectr - L) / (H - L)
  return(new_vectr)
}

random_vectr <- seq(1,10)
rescale(random_vectr)

# Defining Defaults
head(inflam)

center <- function(data, midpoint = 0) {
  # return a new vector containing the original data centered around the
  # midpoint (0 by default).
  # Example: center(c(1, 2, 3), 0) => c(-1, 0, 1)
  new_data <- (data - mean(data)) + midpoint
  return(new_data)
}

test_data <- c(0,0,0,0)
center(test_data,3)
more_data <- 5 + test_data
more_data

center(more_data)









