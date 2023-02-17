state_bully_data |> ggplot(aes(x = date, y = hits, color = State.Name)) + geom_point() + theme(axis.text.x = element_text(angle = 45,hjust=1))
bully_dates_test <- state_bully_data %>% mutate(year = lubridate::year(date), 
                      month = lubridate::month(date), 
                      day = lubridate::day(date))
bully_dates_test <- bully_dates_test |> filter(month == 1 | month == 7)
bully_dates_test <- bully_dates_test |> filter(year > 2015)

bully_dates_test_2 <- bully_dates_test|>group_by(date)|>summarise(sum = sum(hits))

bully_dates_test |> ggplot(aes(x = date, y = hits)) + 
  geom_point(size = 3, alpha = 0.5) + 
  geom_line() + 
  theme(axis.text.x = element_text(angle = 45,hjust=1))

bully_dates_test_2 |> ggplot(aes(x = date, y = sum)) + 
  geom_col() + 
  theme(axis.text.x = element_text(angle = 45,hjust=1))

state_bully_data_2 <- state_bully_data_2 |> filter(dma_json_code == 'US-CA' | dma_json_code == 'US-NY' | dma_json_code == 'US-TX' |
                                                 dma_json_code == 'US-NJ' | dma_json_code == 'US-WA' | dma_json_code == 'US-IL' |
                                                 dma_json_code == 'US-HI' | dma_json_code == 'US-FL' | dma_json_code == 'US-VA' |
                                                 dma_json_code == 'US-MA', na.rm = TRUE)

state_bully_data_2 <- state_bully_data_2 |> mutate(year = lubridate::year(date), 
                                                month = lubridate::month(date), 
                                                day = lubridate::day(date))

state_bully_data_2 <- state_bully_data_2 |> filter(month == 1 | month == 7 | month == 9 | month == 3)
state_bully_data_2 <- state_bully_data_2 |> filter(year > 2015)
state_bully_data_2 <- state_bully_data_2|>group_by(date)|>summarise(sum = sum(hits))

state_bully_data |> ggplot(aes(x = date, y = sum)) + 
  geom_col() +
  theme(axis.text.x = element_text(angle = 45,hjust=1)) +
  labs(
    x = "School Year Date Intervals",
    y = "Sum of Searches by Investigated States"
  )
