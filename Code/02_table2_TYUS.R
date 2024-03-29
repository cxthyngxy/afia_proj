
library(pacman)
p_load(tidyverse, ggplot2,knitr, labelled, gtsummary)


here::i_am("code/02_table2_TYUS.R")
cleaned_data <- read.csv(file = here::here("cleaned_data/Food_Insecurity_cleaned.csv"))

table2 <- cleaned_data %>%  filter(!is.na(Age), Location=="US") %>% 
  select(food_insecurity, total, sharefoodinsecure, Age) %>% 
  tbl_summary(by = Age) %>% 
  modify_spanning_header(c("stat_1", "stat_2", "stat_3","stat_4", "stat_5") ~ "**Age Grouping**") %>% 
  add_overall() %>% 
  add_p()

table2

saveRDS(
  table2,
  file = here::here("tables/table2.rds")
)