#### Preamble ####
# Purpose: Cleans raw data
# Author: Annie Yan, Will Davidson, Jason Ngo
# Data: 15 February 2023 
# Contact: yanzixin0807@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Clean data ####
# [...UPDATE THIS...]
raw_data <- read_csv("inputs/data/raw_data.csv")

cleaned_data <- 
  raw_data |> select (state,date,year,month,
                      cy_bly,sch_bly,sch_cy_bly,sch_cy_bly_sum,
                      yrbs_bly_sch,yrbs_bly_cyb,yrbs_bly_avg,
                      avg_t,avg_v,pop2019)


#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

