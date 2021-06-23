install.packages("dplyr")
library(dplyr)


# bad approach to printing each word
best_practice <- c("Let", "the", "computer", "do", "the", "work")
print_words <- function(sentence) {
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}

print_words(best_practice)

best_practice[-6]

print_words(best_practice[-6])

# better approach to printing each word
print_words <- function(sentence) {
  for (word in sentence) {
    print(word)
  }
}

print_words(best_practice)

print_words(best_practice[-6])


# general form for for loops
# for (variable in collection) {
#   do things with variable
# }

len <- 0
vowels <- c("a","e","i","o","u")
for (v in vowels) {
  len <- len + 1
}

len

length(vowels)


# Exercise: print numbers

print_N <- function(N) {
  nseq <- seq(N)
  for (num in nseq) {
    print(num)
  }
}

print_N(10)


# Exercise: Summing Values (without using sum function)

total <- function(ex_vec) {
  vec_sum <- 0
  for (num in ex_vec) {
    vec_sum <- vec_sum + num
  }
  return(vec_sum)
}

ex_vec <- c(4, 8, 15, 16, 23, 42)
total(ex_vec)


# Exercise: Exponential

expo <- function(base,power) {
  result <- 1
  for (num in seq(power)) { # seq(power) <- 1,2,3,4 so for loop runs 4 times
    result <- result*base
  }
  return(result)
}
expo(2,4)


# PROCESSING MULTIPLE FILES
list.files(path = "C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data", pattern = "csv")
list.files(path = "C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data", pattern = "inflammation")


analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

filenames <- list.files(path = "C:/Users/marti/Documents/RStudio_Practice/swcarpentry/data", pattern = "inflammation-[0-9]{2}.csv",
                                                                                                #          |            |        the standard file extension of comma-separated values
                                                                                                #          |            the variable parts (two digits, each between 0 and 9)
                                                                                                #          the static part of the filenames
                        full.names = TRUE)

filenames <- filenames[1:3]
for (f in filenames) {
  print(f)
  analyze(f)
}






