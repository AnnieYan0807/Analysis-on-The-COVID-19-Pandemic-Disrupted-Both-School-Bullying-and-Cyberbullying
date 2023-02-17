#### Preamble ####
# Purpose: Cleans raw data by selecting relevant data
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
#raw_data <- read_csv("inputs/data/raw_data.csv")

#cleaned_data <- 
#  raw_data |> select (state,date,year,month,
#                      cy_bly,sch_bly,sch_cy_bly,sch_cy_bly_sum,
#                      yrbs_bly_sch,yrbs_bly_cyb,yrbs_bly_avg,
#                      avg_t,avg_v,pop2019)

#Filter by states with the 10 highest Asian Populations
#California, New York, Texas, New Jersey, Washington
#Illinois, Hawaii, Florida, Virginia, Massachusetts
state_bully_data <- state_bully_data |> filter(dma_json_code == 'US-CA' | dma_json_code == 'US-NY' | dma_json_code == 'US-TX' |
                                                    dma_json_code == 'US-NJ' | dma_json_code == 'US-WA' | dma_json_code == 'US-IL' |
                                                    dma_json_code == 'US-HI' | dma_json_code == 'US-FL' | dma_json_code == 'US-VA' |
                                                    dma_json_code == 'US-MA', na.rm = TRUE)

state_cybully_data <- state_cybully_data |> filter(dma_json_code == 'US-CA' | dma_json_code == 'US-NY' | dma_json_code == 'US-TX' |
                                                 dma_json_code == 'US-NJ' | dma_json_code == 'US-WA' | dma_json_code == 'US-IL' |
                                                 dma_json_code == 'US-HI' | dma_json_code == 'US-FL' | dma_json_code == 'US-VA' |
                                                 dma_json_code == 'US-MA', na.rm = TRUE)

state_schbully_data <- state_schbully_data |> filter(dma_json_code == 'US-CA' | dma_json_code == 'US-NY' | dma_json_code == 'US-TX' |
                                                 dma_json_code == 'US-NJ' | dma_json_code == 'US-WA' | dma_json_code == 'US-IL' |
                                                 dma_json_code == 'US-HI' | dma_json_code == 'US-FL' | dma_json_code == 'US-VA' |
                                                 dma_json_code == 'US-MA', na.rm = TRUE)

#Cleaning up value names so they are legible
state_bully_data <- state_bully_data |> mutate(keyword=recode(keyword, '%2Fm%2F027vd9' = 'School & Cyberbullying'))
state_cybully_data <- state_cybully_data |> mutate(keyword=recode(keyword, '%2Fm%2F07km37' = 'Cyberbullying'))
state_schbully_data <- state_schbully_data |> mutate(keyword=recode(keyword, '%2Fm%2F03m50g4' = 'School Bullying'))

#Rename dma_json_code column to State.Name for legibility
state_bully_data <- state_bully_data |> rename(State.Name = dma_json_code)
state_cybully_data <- state_cybully_data |> rename(State.Name = dma_json_code)
state_schbully_data <- state_schbully_data |> rename(State.Name = dma_json_code)

#Cleaning up state names so they are easier to read
state_bully_data <- state_bully_data |> mutate(State.Name=recode(State.Name, 
                                                              'US-CA' = 'California',
                                                              'US-NY' = 'New York',
                                                              'US-TX' = 'Texas',
                                                              'US-NJ' = 'New Jersey',
                                                              'US-WA' = 'Washington',
                                                              'US-IL' = 'Illinois',
                                                              'US-HI' = 'Hawaii',
                                                              'US-FL' = 'Florida',
                                                              'US-VA' = 'Virginia',
                                                              'US-MA' = 'Massachusetts'))
state_cybully_data <- state_cybully_data |> mutate(State.Name=recode(State.Name, 
                                                                 'US-CA' = 'California',
                                                                 'US-NY' = 'New York',
                                                                 'US-TX' = 'Texas',
                                                                 'US-NJ' = 'New Jersey',
                                                                 'US-WA' = 'Washington',
                                                                 'US-IL' = 'Illinois',
                                                                 'US-HI' = 'Hawaii',
                                                                 'US-FL' = 'Florida',
                                                                 'US-VA' = 'Virginia',
                                                                 'US-MA' = 'Massachusetts'))
state_schbully_data <- state_schbully_data |> mutate(State.Name=recode(State.Name, 
                                                                 'US-CA' = 'California',
                                                                 'US-NY' = 'New York',
                                                                 'US-TX' = 'Texas',
                                                                 'US-NJ' = 'New Jersey',
                                                                 'US-WA' = 'Washington',
                                                                 'US-IL' = 'Illinois',
                                                                 'US-HI' = 'Hawaii',
                                                                 'US-FL' = 'Florida',
                                                                 'US-VA' = 'Virginia',
                                                                 'US-MA' = 'Massachusetts'))
#### Save data ####
write.csv(state_bully_data, here::here("Outputs/data/cleaned_bully_data.csv"))
write.csv(state_cybully_data, here::here("Outputs/data/cleaned_cybully_data.csv"))
write.csv(state_schbully_data, here::here("Outputs/data/cleaned_schbully_data.csv"))

