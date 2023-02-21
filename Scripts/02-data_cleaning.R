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
library(lubridate)
# [...UPDATE THIS...]

#### Clean data ####
# [...UPDATE THIS...]

##National wide data##
#create new dataset: national schbully data 
national_schbully_data <- state_schbully_data_raw
national_schbully_data <- national_schbully_data |> mutate(keyword=recode(keyword, '%2Fm%2F03m50g4' = 'School Bullying'))
national_schbully_data <- national_schbully_data |> rename(Location = dma_json_code)
national_schbully_data <- national_schbully_data |> mutate(year = lubridate::year(date), 
                                                     month = lubridate::month(date), 
                                                     day = lubridate::day(date))
national_schbully_data <- national_schbully_data |> filter(month == 1 | month == 7 | month == 9 | month == 3)
national_schbully_data <- national_schbully_data |> filter(year > 2015)
national_schbully_data_sum <- national_schbully_data|>group_by(date)|>summarise(sum = sum(hits))
write.csv(national_schbully_data_sum, here::here("Outputs/data/sum_national_schbully_data.csv"))
write.csv(national_schbully_data, here::here("Outputs/data/cleaned_national_schbully_data.csv"))


## Top 10 states with highest asian population ##

#Filter by states with the 10 highest Asian Populations
#California, New York, Texas, New Jersey, Washington
#Illinois, Hawaii, Florida, Virginia, Massachusetts
state_bully_data <- state_bully_data_raw |> filter(dma_json_code == 'US-CA' | dma_json_code == 'US-NY' | dma_json_code == 'US-TX' |
                                                    dma_json_code == 'US-NJ' | dma_json_code == 'US-WA' | dma_json_code == 'US-IL' |
                                                    dma_json_code == 'US-HI' | dma_json_code == 'US-FL' | dma_json_code == 'US-VA' |
                                                    dma_json_code == 'US-MA', na.rm = TRUE)

state_cybully_data <- state_cybully_data_raw |> filter(dma_json_code == 'US-CA' | dma_json_code == 'US-NY' | dma_json_code == 'US-TX' |
                                                 dma_json_code == 'US-NJ' | dma_json_code == 'US-WA' | dma_json_code == 'US-IL' |
                                                 dma_json_code == 'US-HI' | dma_json_code == 'US-FL' | dma_json_code == 'US-VA' |
                                                 dma_json_code == 'US-MA', na.rm = TRUE)

state_schbully_data <- state_schbully_data_raw |> filter(dma_json_code == 'US-CA' | dma_json_code == 'US-NY' | dma_json_code == 'US-TX' |
                                                 dma_json_code == 'US-NJ' | dma_json_code == 'US-WA' | dma_json_code == 'US-IL' |
                                                 dma_json_code == 'US-HI' | dma_json_code == 'US-FL' | dma_json_code == 'US-VA' |
                                                 dma_json_code == 'US-MA', na.rm = TRUE)

## Bottom 10 states with highest asian population ##

#Filter by states with 10 lowest asian population
#Wyoming, Vermont, Montana, North Dakota, South Dakota,
#West Virginia, Maine, Rhode Island, Mississippi, Idaho
state_bully_data_lowasp <- state_bully_data_raw |> filter(dma_json_code == 'US-WY' | dma_json_code == 'US-AL' | dma_json_code == 'US-MT' |
                                                 dma_json_code == 'US-SD' | dma_json_code == 'US-ND' | dma_json_code == 'US-WV' |
                                                 dma_json_code == 'US-ME' | dma_json_code == 'US-KY' | dma_json_code == 'US-MS' |
                                                 dma_json_code == 'US-AR', na.rm = TRUE)

state_cybully_data_lowasp <- state_cybully_data_raw |> filter(dma_json_code == 'US-WY' | dma_json_code == 'US-AL' | dma_json_code == 'US-MT' |
                                                     dma_json_code == 'US-SD' | dma_json_code == 'US-ND' | dma_json_code == 'US-WV' |
                                                     dma_json_code == 'US-ME' | dma_json_code == 'US-KY' | dma_json_code == 'US-MS' |
                                                     dma_json_code == 'US-AR', na.rm = TRUE)

state_schbully_data_lowasp <- state_schbully_data_raw |> filter(dma_json_code == 'US-WY' | dma_json_code == 'US-AL' | dma_json_code == 'US-MT' |
                                                       dma_json_code == 'US-SD' | dma_json_code == 'US-ND' | dma_json_code == 'US-WV' |
                                                       dma_json_code == 'US-ME' | dma_json_code == 'US-KY' | dma_json_code == 'US-MS' |
                                                       dma_json_code == 'US-AR', na.rm = TRUE)

#Cleaning up value names so they are legible
state_bully_data <- state_bully_data |> mutate(keyword=recode(keyword, '%2Fm%2F027vd9' = 'School & Cyberbullying'))
state_cybully_data <- state_cybully_data |> mutate(keyword=recode(keyword, '%2Fm%2F07km37' = 'Cyberbullying'))
state_schbully_data <- state_schbully_data |> mutate(keyword=recode(keyword, '%2Fm%2F03m50g4' = 'School Bullying'))

state_bully_data_lowasp <- state_bully_data_lowasp |> mutate(keyword=recode(keyword, '%2Fm%2F027vd9' = 'School & Cyberbullying'))
state_cybully_data_lowasp <- state_cybully_data_lowasp |> mutate(keyword=recode(keyword, '%2Fm%2F07km37' = 'Cyberbullying'))
state_schbully_data_lowasp <- state_schbully_data_lowasp |> mutate(keyword=recode(keyword, '%2Fm%2F03m50g4' = 'School Bullying'))

#Rename dma_json_code column to State.Name for legibility
state_bully_data <- state_bully_data |> rename(State.Name = dma_json_code)
state_cybully_data <- state_cybully_data |> rename(State.Name = dma_json_code)
state_schbully_data <- state_schbully_data |> rename(State.Name = dma_json_code)

state_bully_data_lowasp <- state_bully_data_lowasp |> rename(State.Name = dma_json_code)
state_cybully_data_lowasp <- state_cybully_data_lowasp |> rename(State.Name = dma_json_code)
state_schbully_data_lowasp <- state_schbully_data_lowasp |> rename(State.Name = dma_json_code)

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

state_bully_data_lowasp <- state_bully_data_lowasp |> mutate(State.Name=recode(State.Name, 
                                                                               'US-AR' = 'Arkansas',
                                                                               'US-ME' = 'Maine',
                                                                               'US-MS' = 'Mississippi',
                                                                               'US-MT' = 'Montana',
                                                                               'US-ND' = 'North Dakota',
                                                                               'US-SD' = 'South Dakota',
                                                                               'US-AL' = 'Alabama',
                                                                               'US-WV' = 'West Virginia',
                                                                               'US-WY' = 'Wyoming',
                                                                               'US-KY' = 'Kentucky'))
state_cybully_data_lowasp <- state_cybully_data_lowasp |> mutate(State.Name=recode(State.Name, 
                                                                               'US-AR' = 'Arkansas',
                                                                               'US-ME' = 'Maine',
                                                                               'US-MS' = 'Mississippi',
                                                                               'US-MT' = 'Montana',
                                                                               'US-ND' = 'North Dakota',
                                                                               'US-SD' = 'South Dakota',
                                                                               'US-AL' = 'Alabama',
                                                                               'US-WV' = 'West Virginia',
                                                                               'US-WY' = 'Wyoming',
                                                                               'US-KY' = 'Kentucky'))
state_schbully_data_lowasp <- state_schbully_data_lowasp |> mutate(State.Name=recode(State.Name, 
                                                                                'US-AR' = 'Arkansas',
                                                                                'US-ME' = 'Maine',
                                                                                'US-MS' = 'Mississippi',
                                                                                'US-MT' = 'Montana',
                                                                                'US-ND' = 'North Dakota',
                                                                                'US-SD' = 'South Dakota',
                                                                                'US-AL' = 'Alabama',
                                                                                'US-WV' = 'West Virginia',
                                                                                'US-WY' = 'Wyoming',
                                                                                'US-KY' = 'Kentucky'))

#Separating the dates to filter them
state_bully_data <- state_bully_data |> mutate(year = lubridate::year(date), 
                                                   month = lubridate::month(date), 
                                                   day = lubridate::day(date))
state_cybully_data <- state_cybully_data |> mutate(year = lubridate::year(date), 
                                               month = lubridate::month(date), 
                                               day = lubridate::day(date))
state_schbully_data <- state_schbully_data |> mutate(year = lubridate::year(date), 
                                               month = lubridate::month(date), 
                                               day = lubridate::day(date))

state_bully_data_lowasp <- state_bully_data_lowasp |> mutate(year = lubridate::year(date), 
                                               month = lubridate::month(date), 
                                               day = lubridate::day(date))
state_cybully_data_lowasp <- state_cybully_data_lowasp |> mutate(year = lubridate::year(date), 
                                                   month = lubridate::month(date), 
                                                   day = lubridate::day(date))
state_schbully_data_lowasp <- state_schbully_data_lowasp |> mutate(year = lubridate::year(date), 
                                                     month = lubridate::month(date), 
                                                     day = lubridate::day(date))

#Selecting Jan, Mar, Jul & Sep as they represent 3 months of a school year and one summer month
state_bully_data <- state_bully_data |> filter(month == 1 | month == 7 | month == 9 | month == 3)
state_cybully_data <- state_cybully_data |> filter(month == 1 | month == 7 | month == 9 | month == 3)
state_schbully_data <- state_schbully_data |> filter(month == 1 | month == 7 | month == 9 | month == 3)

state_bully_data_lowasp <- state_bully_data_lowasp |> filter(month == 1 | month == 7 | month == 9 | month == 3)
state_cybully_data_lowasp <- state_cybully_data_lowasp |> filter(month == 1 | month == 7 | month == 9 | month == 3)
state_schbully_data_lowasp <- state_schbully_data_lowasp |> filter(month == 1 | month == 7 | month == 9 | month == 3)


#Using data from 2016 and above
state_bully_data <- state_bully_data |> filter(year > 2015)
state_cybully_data <- state_cybully_data |> filter(year > 2015)
state_schbully_data <- state_schbully_data |> filter(year > 2015)

state_bully_data_lowasp <- state_bully_data_lowasp |> filter(year > 2015)
state_cybully_data_lowasp <- state_cybully_data_lowasp |> filter(year > 2015)
state_schbully_data_lowasp <- state_schbully_data_lowasp |> filter(year > 2015)

#Summarized sum by the 4 months, saved in another variable that'll solely be used to graph
state_bully_data_sum <- state_bully_data|>group_by(date)|>summarise(sum = sum(hits))
state_cybully_data_sum <- state_cybully_data|>group_by(date)|>summarise(sum = sum(hits))
state_schbully_data_sum <- state_schbully_data|>group_by(date)|>summarise(sum = sum(hits))

state_bully_data_lowasp_sum <- state_bully_data_lowasp|>group_by(date)|>summarise(sum = sum(hits))
state_cybully_data_lowasp_sum <- state_cybully_data_lowasp|>group_by(date)|>summarise(sum = sum(hits))
state_schbully_data_lowasp_sum <- state_schbully_data_lowasp|>group_by(date)|>summarise(sum = sum(hits))


#### Save data ####
write.csv(state_bully_data, here::here("Outputs/data/cleaned_bully_data.csv"))
write.csv(state_cybully_data, here::here("Outputs/data/cleaned_cybully_data.csv"))
write.csv(state_schbully_data, here::here("Outputs/data/cleaned_schbully_data.csv"))
write.csv(state_bully_data_sum, here::here("Outputs/data/sum_bully_data.csv"))
write.csv(state_cybully_data_sum, here::here("Outputs/data/sum_cybully_data.csv"))
write.csv(state_schbully_data_sum, here::here("Outputs/data/sum_schbully_data.csv"))

write.csv(state_bully_data_lowasp, here::here("Outputs/data/cleaned_bully_lowasp_data.csv"))
write.csv(state_cybully_data_lowasp, here::here("Outputs/data/cleaned_cybully_lowasp_data.csv"))
write.csv(state_schbully_data_lowasp, here::here("Outputs/data/cleaned_schbully_lowasp_data.csv"))
write.csv(state_bully_data_lowasp_sum, here::here("Outputs/data/sum_bully_lowasp_data.csv"))
write.csv(state_cybully_data_lowasp_sum, here::here("Outputs/data/sum_cybully_lowasp_data.csv"))
write.csv(state_schbully_data_lowasp_sum, here::here("Outputs/data/sum_schbully_lowasp_data.csv"))