#### Preamble ####
# Purpose: read and saves the data from server
# Author: Annie Yan, Will Davidson, Jason Ngo
# Data: 15 February 2023 
# Contact: yanzixin0807@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(haven)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]

raw_data <- read_dta('/Users/annie/Desktop/Spring 2023/Worlds become data/Analysis on The COVID-19 Pandemic Disrupted Both School Bullying and Cyberbullying/draft/data/analysis_file.dta')


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "inputs/data/raw_data.csv") 

         