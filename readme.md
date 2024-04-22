Food Insecurity During COVID 19
================
Afia Tyus
DATA 550 - Final Project Git Repository

## Initial code description

`make install`
  - synchronizes the package environment
  - run "make install" to synchronize the package environment BEFORE running other code

`code/00_cleaningdata_TYUS.R`
Cleans the original data set
  - renames columns
  - creates a new column called "food insecurity" which includes both those who reported sometimes or often not having enough to eat
  - creates a readable week number
  - keeps relevant columns

`code/01_table1.R`
  - creates labels for the data set
  - creates a summary table of food insecurity stats by race
  - saves the table as .rds file in the tables folder

`code/02_table2_TYUS.R`
  - creates a summary table of food insecurity stats by age group
  - saves the table as .rds file in the tables folder

`code/03_graph1_TYUS.R`
  - produces a box plot of food insecurity rates by age group
  - saves the graph to the "graphs" folder as a .rds file

`code/04_graph2_TYUS.R`
  - produces a line graph of food insecurity rates by race over time
  - saves the graph to the "graphs" folder as a .rds file

`05_renderreport_TYUS.R`
  - renders the r markdown report (RMarkdown_modularized_TYUS.Rmd) as a pdf
  - saves the report to the working directory

`RMarkdown_modularized_TYUS.Rmd`
  - runs the full modularized report
  - reads in the clean data
  - reads in the outputs (tables 1 and 2 and graphs 1 and 2)


How to build the docker image:
  - run `make project_image` in order to create the image within the container in a Mac/Linux-OS-specific target

How to create the containerized report:
  - run `make final_report/build.pdf` in order to create the final report within the container

