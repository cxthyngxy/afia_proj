
here::i_am("code/05_renderreport_TYUS.R")

rmarkdown::render(
  here::here("RMarkdown_modularized_TYUS.Rmd"),
  knit_root_dir = here::here()
)