#### Preamble ####
# Purpose: Tests cleaned data
# Author: Annie Yan, Will Davidson, Jason Ngo
# Data: 15 February 2023 
# Contact: yanzixin0807@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

## Reading the cleaned data CSV's ##
sum_bully_data <- read.csv(here::here("Outputs/data/sum_bully_data.csv"))
sum_cybully_data <- read.csv(here::here("Outputs/data/sum_cybully_data.csv"))
sum_schbully_data <- read.csv(here::here("Outputs/data/sum_schbully_data.csv"))
sum_national_schbully_data <- read.csv(here::here("Outputs/data/sum_national_schbully_data.csv"))

cleaned_bully_data <- read.csv(here::here("Outputs/data/cleaned_schbully_data.csv"))
cleaned_cybully_data <- read.csv(here::here("Outputs/data/cleaned_schbully_data.csv"))
cleaned_schbully_data <- read.csv(here::here("Outputs/data/cleaned_schbully_data.csv"))
cleaned_national_schbully_data <- read.csv(here::here("Outputs/data/cleaned_national_schbully_data.csv"))


#### Test data ####

#cleaned_bully_data testing
cleaned_bully_data$ hits  |> class() == "integer"
cleaned_bully_data$ month |> min(na.rm=TRUE) >= 0
cleaned_bully_data$ day|> max(na.rm=TRUE) <= 31

#cleaned_cybully_data testing
cleaned_cybully_data$ hits  |> class() == "integer"
cleaned_cybully_data$ month |> min(na.rm=TRUE) >= 0
cleaned_cybully_data$ day|> max(na.rm=TRUE) <= 31


#cleaned_schbully_data testing
cleaned_schbully_data$ hits  |> class() == "integer"
cleaned_schbully_data$ month |> min(na.rm=TRUE) >= 0
cleaned_schbully_data$ day|> max(na.rm=TRUE) <= 31

#cleaned_national_schbully_data testing
cleaned_national_schbully_data$ hits  |> class() == "integer"
cleaned_national_schbully_data$ month |> min(na.rm=TRUE) >= 0
cleaned_national_schbully_data$ day|> max(na.rm=TRUE) <= 31


#sum_bully_data testing
sum_bully_data$ X  |> class() == "integer"
sum_bully_data$ date  |> class() == "character"
sum_bully_data$ sum  |> class() == "integer"


#sum_cybully_data testing
sum_cybully_data$ X  |> class() == "integer"
sum_cybully_data$ date  |> class() == "character"
sum_cybully_data$ sum  |> class() == "integer"


#sum_schbully_data testing
sum_schbully_data$ X  |> class() == "integer"
sum_schbully_data$ date  |> class() == "character"
sum_schbully_data$ sum  |> class() == "integer"


#sum_national_schbully_data testing
sum_national_schbully_data$ X  |> class() == "integer"
sum_national_schbully_data$ date  |> class() == "character"
sum_national_schbully_data$ sum  |> class() == "integer"
