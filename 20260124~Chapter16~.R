#20260124 
#15:05~
#16 Loops, Iteration, and Working with Lists

#16.1 Preparation
install.packages ("pacman")
pacman::p_load (
  rio,
  here,
  purrr,
  grates,
  tidyverse
)
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
linelist <- readRDS ("linelist_cleaned.rds")
#download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.xlsx", "linelist_cleaned.xlsx")
#install.packages ("openxlsx")
#library (openxlsx)
#linelist <- read.xlsx ("linelist_cleaned.xlsx")
head (linelist, 5)


#16.2 for loop
#for loop in R



#Core Components
#Squences
#Operations
#Containers
#Displaying Results Without Using Containers
#Verifying the Behavior of for Loops
#Looping OVer Plots
#Monitoring Loop Progress


#16.3 purrr and Lists
#map ()
#Splitting and Exporting Datasets
#Custom Functions
#Mapping Functions Across Multiple Columns
#Converting Lists to Data Frames
#Dropping, Keeping, and Compaction Lists

#16.4 The apply Family of Functions
#16.5 References