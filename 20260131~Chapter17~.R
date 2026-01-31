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

#processing a tabyl table
#Function                 Description
#adorn_totals ()          Add totals (use where = "row", "col", or "both")
#                         Specify name = "Total" to label the totals.

#aborn_percentage ()      Convert counts to proportions by setting denominator =
#                         "row", "col", or "all"

#adorn_pec_formatting ()  Format proportings as percetages. Use digits = to set the number of 
#                         decimal places. To remove th "%" sign, set affix_sign = FALSE.

#adorn_rounding ()        Round proportions by specifying digits = for the numger of decimal
#                         places. To round percentages, use adorn_pct_formatting () with digita = .

#adorn_ns ()              Add counts to a table of proportions or percentages. To display counts in
#                         parentheses after percentages, set position = "rear". To display 
#                         percentages in parentheses after counts, set position = "front".
#

#adorn_title ()           Add labels using the row_name = and/or col_name = arguments.

linelist4 <- linelist |>  # Case line list
  tabyl (age_cat) |>      # Create a ta le of counts and proportions by age category
  adorn_pct_formatting () # Convert proportions to percentages
linelist4


#This is a cross-tabulation table with row totals and row percentages.
linelist5 <- linelist |>
  tabyl (age_cat, gender) |>                 # Counts by age and sex
  adorn_totals (where = "row") |>            # Add row totals
  adorn_percentages (denominator = "row") |> # Convert counts to proportions
  adorn_pct_formatting (digits = 1)          # Convert proportions to percentages
linelist5


#THis is a cross-tabulation table adjusted to display both counts and percentages.
linelist6 <- linelist |>                     # Case line list
  tabyl (age_cat, gender) |>                 # Cross-tabulation of counts
  adorn_totals (where = "row") |>            # Add row totals
  adorn_percentages (denominator = "col") |> # Conbert to proportions
  adorn_pct_formatting () |>                 # Convert to percetages
  adorn_ns (position = "front") |>           # hange the display forat to "count (percent)"
  adorn_title (                              # Adjust the title
    row_name = "Age Category",
    col_name = "Gender"
  )
linelist6





#Output from tabyl ()
#install.packages ("flextable")
#library (flextable)
#"flextable" %in% rownames(installed.packages())
#install.packages(
#  "flextable",
#  dependencies = TRUE
#)
#"flextable" %in% rownames(installed.packages())
#library (flextable)
#flextable
#linelist7 <- lienlist |>
#  tabyl (age_cat, gender) |>
#  adorn_totals (where = "col") |>
#  adorn_perdentages (denominator = "col") |>
#  adorn_pct_formatting () |>
#  adorn_ns (position = "front") |>
#  adorn_title (
#    row_name = "Age Category",
#    col_name = "Gender",
#    placement = "combined") |> # Required for exporting as a image
#  flextable::flextable () |> # Convert to a clean, publication-read image
#  flextable::autofit () # Apply formatting row by row
#linelist7

linelist7 <- lienlist |>
  tabyl (age_cat, gender) |>
  adorn_totals (where = "col") |>
  adorn_perdentages (denominator = "col") |>
  adorn_pct_formatting () |>
  adorn_ns (position = "front") |>
  adorn_title (
    row_name = "Age Category",
    col_name = "Gender",
    placement = "combined") |> # Required for exporting as a image
  flextable::flextable () |> # Convert to a clean, publication-read image
  flextable::autofit () # Apply formatting row by row
linelist7



#Use with other tables
linelist8 <- linelist |>
  count (hospital) |> # Functions from the dplyr package
  adorn_totals ()     # Functions from the janitor package
linelist8



#Story of tabyl
linelist9 <- linelist |>
  tabyl (age_cat, gender) |>
  adorn_percentages (denominator = "col") |>
  adorn_pct_formatting () |>
  adorn_ns (position = "front") |>
  adorn_title (
    row_name = "Age Category",
    col_name = "Gender",
    placement = "combined") |>
  flextable::flextable () |>
  flextable::autofit () |>
  flextable::fave_sa_docx (path = "tabyl.docx")


#statistics
age_by_outcome <- linelist |>
  tabyl (age_cat, outcome, show_na = F)
chisq.test (age_by_outcome)

#Others hint


#~15:35
#17.4 dplyr packages






