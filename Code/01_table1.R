library(pacman)
p_load(tidyverse, ggplot2,knitr, labelled, gtsummary)


here::i_am("code/01_table1.R")
cleaned_data <- read.csv(file = here::here("cleaned_data/Food_Insecurity_cleaned.csv"))

#labels the data set
var_label(cleaned_data) <- list(
  Age = "Age Group",
  sharefoodinsecure = "Share Food Insecure",
  Race = "Race",
  total = "Total Respondents",
  food_insecurity = "Total Reporting Food Insecurity"
)

table1 <- cleaned_data %>%  filter(!is.na(Race), Location=="US") %>%
  select(food_insecurity, total, sharefoodinsecure, Race) %>% 
  tbl_summary(by = Race) %>% 
  modify_spanning_header(c("stat_1", "stat_2", "stat_3","stat_4", "stat_5") ~ "**Race**") %>% 
  add_overall() %>% 
  add_p()

table1

saveRDS(
  table1,
  file = here::here("tables/table1.rds")
)