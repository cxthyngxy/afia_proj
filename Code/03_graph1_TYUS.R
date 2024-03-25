library(pacman)
p_load(tidyverse, ggplot2,knitr, labelled, gtsummary)


here::i_am("code/03_graph1_TYUS.R")
cleaned_data <- read.csv(file = here::here("cleaned_data/Food_Insecurity_cleaned.csv"))

US_Age <- cleaned_data %>% filter(Location== "US", !is.na(Age))

Age_v_FoodInsecurity <- US_Age %>% ggplot(aes(x=Age, y = (sharefoodinsecure*100))) +
  geom_boxplot(color = 'blue4', fill = "grey") +
  ggtitle("Food Insecurity Rates by Age Group")+
  xlab("Age Group")+
  ylab("% reporting food insecurity")

plot(Age_v_FoodInsecurity)

Age_v_FoodInsecurity

saveRDS(
  Age_v_FoodInsecurity,
  file = here::here("graphs/graph1.rds")
)