#20260131 13:49~
#Binder took nearly an hour to start today, and it even threw an error. 
#Once the next presentation is done, i'm done with it-i'm sticking to loal RStudio.


#17 Creating Descriptive Statistics Tables
#17.1 Preparation
#install.packages

install.packages ("pacman")
library (pacman)

#p_load
pacman::p_load (
  rio,
  here,
  skimr,
  tidyverse,
  gtsummary,
  rstatix,
  janitor,
  scales,
  flextable
)

#import data
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
linelist <- readRDS ("linelist_cleaned.rds")
#download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.xlsx", "linelist_cleaned.xlsx")
#install.packages ("openxlsx")
#library (openxlsx)
#linelist <- read.xlsx ("linelist_cleaned.xlsx")
head (linelist, 5)


#17.2 Viewing the Data
#Retrieve informating for each variable in the dataset
skim (linelist)

#Using the skimer package and rstatix / gtsummary's
#get_summary_stats (), you can obtain summary statistics in data frame format.
#While it is also possible to use base R's sumary () function to get an overview of the entire dataset, 
#it's output cam be harder to read compared with the results produced by skimr.

## Retrive information for each column in the dataset
summary (linelist)


#summary statistics
summary (linelist$age_years)


summary (linelist$age_years)[[2]]


#Using restatix / gtsummary's get_summary_stats (), uyou can obtain summary statistics in data frame format.
linelist2 <- linelist |>
  get_summary_stats (
    age, wt_kg, ht_cm, ct_blood, temp, # Row where the calculations are performed
    type = "common" #Specify the summary statistics to be used
  )
linelist2


#17.3 The Janitor Package
#Basic Usage of tabyl ()
linelist3 <- linelist |>
  tabyl (age_cat)
linelist3



#Cross-tabulation table
linelist3 <- linelist |>
  tabyl (age_cat, gender)
linelist3
