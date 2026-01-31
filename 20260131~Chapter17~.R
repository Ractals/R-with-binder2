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

#install.packages ("janitor")
#library (janitor)
#install.packages ("gt")
#library (gt)

##################################################################################
#Replace the above logic with an AI-recommended approach that works in Binder.
required_pkgs <- c("janitor", "gt")
new_pkgs <- required_pkgs[!required_pkgs %in% installed.packages()[,"Package"]]
if (length(new_pkgs)) install.packages(new_pkgs)

library(janitor)
library(gt)
linelist7_1 <- linelist |>
  tabyl (age_cat, gender) |>
  adorn_totals (where = "col") |>
  adorn_percentages (denominator = "col") |>
  adorn_pct_formatting () |>
  adorn_ns (position = "front") |>
  gt ()
linelist7_1

install.packages ("knitr")
library (knitr)
linelist7_2 <- linelist |>
  tabyl (age_cat, gender) |>
  adorn_totals (where = "col") |>
  adorn_percentages (denominator = "col") |>
  adorn_pct_formatting () |>
  adorn_ns (position = "front")
kable (linelist7_2)



install.packages ("reactable")
library (reactable)
reactable (linelist7_2)
##################################################################################







#??count
#install.packages ("dplyr")
library (dplyr)
#Use with other tables
linelist8 <- linelist |>
  count (hospital) |> # Functions from the dplyr package
  adorn_totals ()     # Functions from the janitor package
linelist8



#Saving tabyl
#linelist9 <- linelist |>
#  tabyl (age_cat, gender) |>
#  adorn_percentages (denominator = "col") |>
#  adorn_pct_formatting () |>
#  adorn_ns (position = "front") |>
#  adorn_title (
#    row_name = "Age Category",
#    col_name = "Gender",
#    placement = "combined") |>
#  flextable::flextable () |>                     #Convert to an image
#  flextable::autofit () |>                       # Confirm that there is only one row
#  flextable::fave_sa_docx (path = "tabyl.docx")  #Save as a word document using a file path 

linelist9 <- linelist |>
  tabyl (age_cat, gender) |>
  adorn_percentages (denominator = "col") |>
  adorn_pct_formatting () |>
  adorn_ns (position = "front") |>
  adorn_title (
    row_name = "Age Category",
    col_name = "Gender",
    placement = "combined") |>
  gt ()
linelist9


#Summary Statistics
age_by_outcome <- linelist |>
  tabyl (age_cat, outcome, show_na = F)
chisq.test (age_by_outcome)

#Other tips


#~15:35


#Every time i use AI, it goes into a waiting state, so i can't get any real work done.
#23:24~
#17.4 dplyr packages
#Obtaining counts

  # Start from linelist
  # Create a new summary data frame with an n_rows column


#If you group the data in advance, you can do even more interesting things.
  #Group the data by unique values in the age_cat column
  #Return the number of rows *per group*


#The above commands can be shortened by using count ().
#count () performs the following steps:
#1.Groups the data by the specified column (s)
#2.Summarizes them using n() (creating an n column) 
#3.Ungroups the data

#When counting across tow or more grouping columns, the result is returned in a long format, with counts stored in a n column.






#Displaying all levels


#Proportions
#To display percentages (%), you can easily do this by wrapping the proportion
#(note: n / sum (n)) with percent () from the scales package.
#(Be careful - this converts the result to a character string.)



 # Group by gender and count (creates an "n" column)
 # Create column percentages



 # Start from linelist
 # Group by outcome
 # Group by age_cat, count rows, then ungroup age_cat
 # Calculate percentages - note that the denominator is within each outcome group




#Plotting
 # Start from linelist
 # Group and summarize by two columns
 # Pass th new data frame to ggplot
 # Greate a bar chart
 # Map outcome to the x-axis
 # Map age_cat to fill (color by age category)
 # Map the count column "n" to bar height






#Summary statistics
 # Start from linelist and save as a new object
 # SUmmarize all calculations by hospital
 # Obtain summary statistics for the following columns
 # Number of rows per group
 # Maximum delay in days
 # Mean delay in days (rounded)
 # Standard deviation of delay in days (rounded)
 # Number of rows with delay ≥ 3 days
 # Convert the ≥ 3-day delay count column to percentages

#Output







#Conditional statistics


#Glueing

 # Combine and format values
 # Remove the two old columns
 # Add a total column




#Percentiles

#Obtain default age percentiles (0%, 25%, 50%, 75%, 100%)

#Obtain manually specified age percentiles (5%, 50%, 75%, 98%)

#Obtain manually specified age percentiles (5%, 50%, 75%, 98%)




#Combineing summarized data


#across (): multiple columns

 # Columns
 # Function
 # Additional arguments


 # Columns
 # Multiple functions
 # Additional arguments



#Below are the tidyselect helperfunctions that can be supplied to .cols = when selecting columns:
#・everything () - all remaining columns not otherwise specified
#・last_col () - the last column
#・where () - select columns for which a function returns TRUE
#・starts_with () - columns that start wotj a prefix (e.g.,starts_with (#date"))
#・ends_with () - columns that end with a suffix (e.g., ends_with ("_end"))
#・contains () - columns containing a string (e.g., contains ("time"))
#・matches () - apply a regular expression (e.g., matches ("[pt]al"))
#・num_range () - numeric ranges in column names
#・any_of () - matches columns by name; usful when some columns may not exist 
#(e.g., any_o f(c ("date_onset", "date_death", "cardiac_arrest")))

#For example, to return the mean of all numeric columns, use where () and specify
#the function as.numeric () (without parentheses).
#All of this is done inside the across () command.

 # All numeric columns in the data frame



#Pivoting to wide format
 # Start from linelist
 # Group by outcome
 # Group by age_cat, count rows, then ungroup age_cat
 #Calculate percentages - note that the denominator is within each outcome group


 # Keep only counts for simplicity



# Summing rows
#Use adorn_totals () from the janitor packages.