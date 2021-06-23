# Programming w/ R 
# Analyzing Patient data
# 6/23/21
install.packages("dplyr")
library(dplyr)

inflammation <- read.csv(file = "C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data/inflammation-01.csv", header = FALSE)

head(inflammation)

class(inflammation)

dim(inflammation)

inflammation[1,1] # first value in dataframe: in row 1, column 1

inflammation[30,20] # middle value in dataframe: row 30, column 20

inflammation[c(1,3,5), c(10,20)] # picking columns 10 and 20 from rows 1, 3 and 5

inflammation[1:4, 1:10] # first 10 columns of the first 4 rows

inflammation[5,] # all columns form row 5

inflammation[ , 16:18] # all rows from columns 16-18

p_1 <- inflammation[1,] # first row all columns
max(p_1) # max inflammation for patient 1

max(inflammation[2,]) # max inflammation of patient 2 

min(inflammation[,7]) # min inflammation on day 7

mean(inflammation[,7]) # mean inflammation on day 7

median(inflammation[,7]) # median on day 7

sd(inflammation[,7]) # standard deviation on day 7


summary(inflammation[,1:4]) # summarizes calculations of all rows and columns 1-4

avg_p_inf <- apply(inflammation,1,mean) 
# apply allows us to repeat a function on all the rows (MARGIN = 1)
# or columns (MARGIN = 2) of a dataframe
# avg_p_inf obtains the avg inflammation of each patient
# (calculated the mean of all the rows)

avg_day_inf <- apply(inflammation,2,mean) # avg inflammation of each day

# more efficient alternatives: rowMeans and colMeans


# Exercise: 
# Write a vector containing each affected patient (hint: ?seq)
# Create a new data frame in which you halve the first five days’ values in only those patients
# Print out the corrected data frame to check that your code has fixed the problem
affected_p <- seq(from = 2, to = 60, by = 2)
affected_days <- seq(1,5)
data2 <- inflammation
data2[affected_p,affected_days] <- data2[affected_p,affected_days]/2
data2

# Exercise:calculate the mean inflammation for specific days and patients in the patient dataset (i.e. 60 patients across 40 days).
# calculate the mean inflammation for patients 1 to 5 over the whole 40 days
# calculate the mean inflammation for days 1 to 10 (across all patients).
# calculate the mean inflammation for every second day (across all patients).
p_1_5_mean <- apply(inflammation[1:5,],1,mean)

days_1_10_mean <- apply(inflammation[,1:10],2,mean)

every_2_days <- seq(2,40,2)
days_every2_mean <- apply(inflammation[,every_2_days],2,mean)

p_1_5_mean
days_1_10_mean
days_every2_mean

# Plotting
avg_day_inf <- apply(inflammation,2,mean)
plot(avg_day_inf)

max_day_inf <- apply(inflammation,2,max)
plot(max_day_inf)

min_day_inf <- apply(inflammation,2,min)
plot(min_day_inf)

sd_day_inf <- apply(inflammation,2,sd)
plot(sd_day_inf)
