#### Preamble ####
# Purpose: Create a simulation of a dataset expected to be seen in the replicated paper.
# Author: Annie Yan, Will Davidson, Jason Ngo
# Data: 15 February 2023 
# Contact: yanzixin0807@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(853)

simulated_bullying_data <-
  tibble(
    Date = rep(x = as.Date("2021-01-01") + c(0:364), times = 3),
    
    State = c(
      rep(x = "AK", times = 365),
      rep(x = "CA", times = 365),
      rep(x = "NY", times = 365)
    ),
    
    Cyberbullying =
      rpois(
        n = 365 * 3,
        lambda = 10
      ),
    
    Schoolbullying =
      rpois(
        n = 365 * 3,
        lambda = 20
      ),

    School_cyber_bullying =
      rpois(
        n = 365 * 3,
        lambda = 80
      )
    
    )
    

head(simulated_bullying_data)
