# As an exercise, see if you can make a data frame that has two columns the first with “treatment” with values 
# 1 through 5 and the second with “response” with random gaussian values with a different mean for each treatment. 
# So there are say 100 rows for each treatment, so the data frame frame has 500 rows total.

library("rcpp")
library("rstan")
library("rstantools")
library("tidyverse")
library("devtools")
library("brms")

# Make vectors for treatment and response
# treatment: make a vector of 100 1s, another one for 100 2s ...
# response: make 5 vectors for each treatment
# then make a vector with all treatments and a vector with all responses
# use data.frame(all_treatments, all_repsonses)

# rbind() adds rows
# cbind() adds columns
# rnorm() produces a random normal (Gaussian) distribution

treatments <- c()
for( i in 1:5){
  t_i <- rep(i,100)
  treatments <- append(treatments, t_i)
}
treatments


responses <- c()
for( j in runif(5,0,10)){
  responses <- append(responses,rnorm(100,j,runif(1)))
}
class(responses)

random_t_r <- data.frame(Treatment=treatments, Response=responses)
random_t_r

aggregate.data.frame(random_t_r,list(treatments),mean)

mean(random_t_r[1:100,2])


# A BETTER WAY OF DOING IT


data <- tibble::tibble(treatment = 1:5) %>% # piping tibble(treatment) into mutate. tibble constructs a df
  dplyr::mutate( # allows you to manipulate dataframe
    treatment_mean = rnorm( # finding the treatment mean
      n = 5,
      mean = 10,
      sd = 1)) %>% # piping treatment mean into rowwise
  dplyr::rowwise() %>% # piping rowwise into do 
  dplyr::do({ # do applies a function to each group (in this case rowwise)
    treatment_params <- . # the df
    tibble::tibble( # constructing a df
      treatment = treatment_params$treatment, # putting treatment into the df
      treatment_mean = treatment_params$treatment_mean, # treatment_mean into the df
      value = rnorm( # response value
        n = 100,
        mean = treatment_params$treatment_mean,
        sd = runif(n = 100)))
  }) %>%
  dplyr::ungroup() # removes grouping done by group_by

data %>%
  dplyr::group_by(treatment) %>%
  dplyr::summarize(
    treatment_mean = treatment_mean[1],
    empirical_mean = mean(value))
