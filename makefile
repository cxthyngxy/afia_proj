

cleandata: code/00_cleaningdata_TYUS.R
	Rscript code/00_cleaningdata_TYUS.R

table1: code/01_table1.R cleandata
	Rscript code/01_table1.R

table2: code/02_table2_TYUS.R cleandata
	Rscript code/02_table2_TYUS.R

graph1: code/03_graph1_TYUS.R cleandata
	Rscript code/03_graph1_TYUS.R

graph2: code/04_graph2_TYUS.R cleandata
	Rscript code/04_graph2_TYUS.R


final_report: RMarkdown_modularized_TYUS.Rmd cleandata table1 table2 graph1 graph2
	Rscript code/05_renderreport_TYUS.R


.PHONY: cleanoutputs
cleanoutputs:
	rm -f tables/*.rds && rm -f RMarkdown_modularized_TYUS.pdf && rm -f graphs/*.rds && rm -f graphs/*.png && rm -f cleaned_data/Food_Insecurity_cleaned.csv