FROM rocker/rstudio as base

RUN apt-get update
RUN apt-get install -y zlib1g-dev libxml2-dev cmake libfontconfig1-dev libfreetype6-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev

RUN mkdir /home/rstudio/final_project
WORKDIR /home/rstudio/final_project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

###### DO NOT EDIT LINES ABOVE ######

FROM rocker/rstudio
WORKDIR /home/rstudio/final_project
COPY --from=base /home/rstudio/final_project . 

COPY makefile . 
COPY RMarkdown_modularized_TYUS.Rmd .


RUN mkdir code
RUN mkdir Graphs
RUN mkdir Raw_Data
RUN mkdir Tables
RUN mkdir Cleaned_data
RUN mkdir final_report


COPY Raw_Data/Food_Insecurity.csv Raw_Data
COPY Code code


CMD make final_report && mv RMarkdown_modularized_TYUS.pdf final_report


# The Makefile contains a rule that performs a docker run command that mounts a 
# local directory called report to somewhere in the container to retrieve the 
# output of the report.