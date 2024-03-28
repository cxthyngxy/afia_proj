install.packages("pacman")
library(pacman)
p_load(tidyverse, ggplot2,knitr, labelled, gtsummary)


here::i_am("code/00_cleaningdata_TYUS.R")
projectdata <- read.csv(file = here::here("raw_data/Food_Insecurity.csv"))

cleaning <- projectdata %>% 
  rename("Enough of food wanted" = Enough.of.the.kinds.of.food.wanted,
         "Enough food, but not kinds wanted" = Enough.Food..but.not.always.the.kinds.wanted,
         "Sometimes not enough" = Sometimes.not.enough.to.eat,
         "Often not enough" = Often.not.enough.to.eat,
         "Did not report" = Did.not.report)

# creating a new column called "food insecurity" which includes both those who reported sometimes or often not having enough to eat
cleaning$food_insecurity <- cleaning$`Sometimes not enough` + cleaning$`Often not enough`

cleaning$total <- cleaning$`Sometimes not enough` + cleaning$`Often not enough` + cleaning$`Enough of food wanted` + cleaning$`Enough food, but not kinds wanted`+ cleaning$`Did not report`

cleaning$sharefoodinsecure <- cleaning$food_insecurity / cleaning$total

# keeping relevant columns
cleaned_data <- cleaning %>% dplyr::select(week_name, Age, food_insecurity, total, sharefoodinsecure, Location, Week, Household_Size, Race, Sex_At_Birth)

# creating a readable week number

cleaned_data$Week_Number <- as.numeric(gsub("week", "", cleaned_data$Week))

write_csv(cleaned_data, file = here::here("cleaned_data/Food_Insecurity_cleaned.csv"))
