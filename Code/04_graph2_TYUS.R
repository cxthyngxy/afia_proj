install.packages("pacman")
library(pacman)
p_load(tidyverse, ggplot2,knitr, labelled, gtsummary)

here::i_am("code/03_graph1_TYUS.R")
cleaned_data <- read.csv(file = here::here("cleaned_data/Food_Insecurity_cleaned.csv"))

US_Week <- cleaned_data %>% filter(Location== "US", !is.na(Race), !is.na(Week))

US_week_1 <- US_Week %>% 
  dplyr::select(Week_Number, Race, sharefoodinsecure, Age)

Race_Time <- US_week_1 %>% ggplot( aes(x=Week_Number, y = sharefoodinsecure, color = Race)) +
  geom_line(lwd=0.75)+
  xlab("Week Number")+
  ylab("% reporting food insecurity")+
  ggtitle("Food Insecurity Rates by Race over Time")

plot(Race_Time)

Race_Time

saveRDS(
  Race_Time,
  file = here::here("graphs/graph2.rds")
)