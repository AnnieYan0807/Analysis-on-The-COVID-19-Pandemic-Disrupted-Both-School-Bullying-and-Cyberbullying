#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Annie Yan, Will Davidson, Jason Ngo
# Data: 15 February 2023 
# Contact: yanzixin0807@gmail.com
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####

cleaned_data$date  |> class() == "Date"
cleaned_data$ cy_bly |> min(na.rm=TRUE) >= 0
cleaned_data$ sch_cy_bly|> max(na.rm=TRUE) <= 240 