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
#??adorn_ns
#packageVersion("janitor")
#"adorn_ns" %in% ls("package:janitor")
linelist7_2 <- linelist |>
janitor::tabyl(age_cat, gender) |>
  janitor::adorn_totals(where = "col") |>
  janitor::adorn_percentages(denominator = "col") |>
  janitor::adorn_pct_formatting() |>
  janitor::adorn_ns(position = "front")
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
  janitor::adorn_totals ()     # Functions from the janitor package
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
  janitor::tabyl (age_cat, gender) |>
  janitor::adorn_percentages (denominator = "col") |>
  janitor::adorn_pct_formatting () |>
  janitor::adorn_ns (position = "front") |>
  janitor::adorn_title (
    row_name = "Age Category",
    col_name = "Gender",
    placement = "combined") |>
  gt::gt ()
linelist9

#Summary Statistics
age_by_outcome <- linelist |>
  janitor::tabyl (age_cat, outcome, show_na = F)
janitor::chisq.test (age_by_outcome)

#Other tips

#~15:35


#Every time i use AI, it goes into a waiting state, so i can't get any real work done.
#23:24~
#Since there is a high likelihood that the connection will be slow again tomorrow, 
#please provide the remaining section headings of Chaper17, or the English versions of the comments.
#and Replace functions that cannot be executed on Binder with AI-recommended logic.
#~25:27
#20260201 12:55~
#17.4 dplyr packages
#Obtaining counts

linelist10 <- linelist |>  # Start from linelist
  summarize (n_rows = n())  # Create a new summary data frame with an n_rows column
linelist10


#If you group the data in advance, you can do even more interesting things.
linelist11 <- linelist |>
  group_by (age_cat) |>    #Group the data by unique values in the age_cat column
  summarize (n_rows = n()) #Return the number of rows *per group*
linelist11

#The above commands can be shortened by using count ().
#count () performs the following steps:
#1.Groups the data by the specified column (s)
#2.Summarizes them using n() (creating an n column) 
#3.Ungroups the data

linelist12 <- linelist |>
  count (age_cat)
linelist12



#When counting across tow or more grouping columns, the result is returned in a long format, with counts stored in a n column.
linelist13 <- linelist |>
  count (age_cat, outcome)
linelist13





#Displaying all levels


#Proportions
#To display percentages (%), you can easily do this by wrapping the proportion
#(note: n / sum (n)) with percent () from the scales package.
#(Be careful - this converts the result to a character string.)


age_summary <- linelist |>
  count (age_cat) |> # Group by gender and count (creates an "n" column)
  mutate (        # Create column percentages
    percent = scales::percent (n / sum (n)))
#output
age_summary

age_by_outcome <- linelist |>  # Start from linelist
  group_by (outcome) |> # Group by outcome
  count (age_cat) |> # Group by age_cat, count rows, then ungroup age_cat
  mutate (percent = scales::percent (n / sum (n))) # Calculate percentages - note that the denominator is within each outcome group
age_by_outcome



#Plotting
linelist14 <- linelist |> # Start from linelist
  count (age_cat, outcome) |>  # Group and summarize by two columns
  ggplot2::ggplot () + # Pass th new data frame to ggplot
    ggplot2::geom_col ( # Greate a bar chart
      mapping = ggplot2::aes ( # Map outcome to the x-axis
        x = outcome, # Map age_cat to fill (color by age category)
        fill = age_cat, # Map the count column "n" to bar height
        y = n))
linelist14 

#Summary statistics
summarize_table <- linelist |> # Start from linelist and save as a new object
  group_by (hospital) |> # SUmmarize all calculations by hospital
  summarize ( # Obtain summary statistics for the following columns
    cases = n(),  # Number of rows per group
    delay_max = max (days_onset_hosp, na.rm = T), # Maximum delay in days
    delay_mean = round(mean (days_onset_hosp, na.rm = T), digits = 1), # Mean delay in days (rounded)
    delay_sd = round (sd (days_onset_hosp, na.rm = T), digits = 1), # Standard deviation of delay in days (rounded)
    delay_3 = sum (days_onset_hosp >= 3, na.rm = T), # Number of rows with delay ≥ 3 days
    pct_delay_3 = scales::percent (delay_3/cases)) # Convert the ≥ 3-day delay count column to percentages
#Output
summarize_table







#Conditional statistics
linelist15 <- linelist |>
  group_by (hospital) |>
  summarize (
    max_temp_fvr = max (temp [fever == "yes"], na.rm =T),
    max_temp_no = max (temp  [fever == "no"], na.rm = T)
  )
linelist15





#Glueing
summarize_table2 <- summarize_table |>
  mutate (delay = stringr::str_glue ("{delay_mean} ({delay_sd})")) |>  # Combine and format values
  select (-c(delay_mean, delay_sd)) |>                        # Remove the two old columns
  janitor::adorn_totals (where = "row") |>                    # Add a total column
  select (                                                    #Specify column order and names
    "Hospital Name" = hospital,
    "Cases" = cases,
    "Max delay" = delay_max,
    "Mean (sd)" = delay, #Delay 3+ days" = delay_3,
    "% delay_3+ days" = pct_delay_3
  )
summarize_table2


#??str_glue






#Percentiles

#Obtain default age percentiles (0%, 25%, 50%, 75%, 100%)
linelist16 <- linelist |>
  summarize (age_percentiles = quantile (age_years, na.rm = T))
linelist16


#Obtain manually specified age percentiles (5%, 50%, 75%, 98%)
linelist17 <- linelist |>
  summarize (
    age_percentiles = quantile (
      age_years,
      probs = c (.05, 0.5, 0.75, 0.98),
      na.rm = T
    )
  )
linelist17



#Obtain manually specified age percentiles (5%, 50%, 75%, 98%)
linelist18 <- linelist |>
  group_by (hospital) |>
  summarize (
    p05 = quantile (age_years, probs = .05, na.rm = T),
    p50 = quantile (age_years, probs = .5, na.rm = T),
    p75 = quantile (age_years, probs = .75, na.rm = T),
    p98 = quantile (age_years, probs = .98, na.rm = T)
  )
linelist18








lienlist19 <- linelist |>
  group_by (hospital) |>
#  rstatix::get_summarize_stats (age, type = "quantile")
  rstatix::get_summary_stats (age, type = "quantile")
lienlist19


linelist20 <- linelist |>
  rstatix::get_summary_stats (age, type = "quantile")
linelist20



#Combineing summarized data
linelist_agg <- linelist |>
  tidyr::drop_na (gender, outcome) |>
  count (outcome, gender)
linelist_agg
#??drop_na


linelist_agg2 <- linelist_agg |>
  group_by (outcome) |>
  summarize (
    total_cases = sum (n, na.rm = T),
    male_cases = sum (n [gender == "m"], na.rm = T),
    femal_cases = sum (n[gender == "f"], na.rm = T)
  )
linelist_agg2

#~14:44


#15:34~
#across (): multiple columns
linelist21 <- linelist |> 
  group_by (outcome) |> 
  summarize (across (.cols = c(age_years, temp, wt_kg, ht_cm), # Columns
                     .fns = mean, # Function
                     na.rm = T))  # Additional arguments
linelist21


linelist22 <- linelist |>
  group_by (outcome) |>
  summarize (across (.cols = c(age_years, temp, wt_kg, ht_cm),  # Columns
                     .fns = list ("mean" = mean, "sd" = sd), # Multiple functions
                     na.rm = T)) # Additional arguments
linelist22


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
linelist23 <- linelist |>
  group_by (outcome) |>
  summarize (across (
    .cols = where (is.numeric), # All numeric columns in the data frame
    .fns = mean,
    na.rm = T))
linelist23


#Pivoting to wide format
age_by_outcome <- linelist |> # Start from linelist
  group_by (outcome) |> # Group by outcome
  count (age_cat) |> # Group by age_cat, count rows, then ungroup age_cat
  mutate (percent = scales::percent(n/sum(n))) #Calculate percentages - note that the denominator is within each outcome group
age_by_outcome



age_by_outcome2 <- age_by_outcome |>
  select (-percent) |> # Keep only counts for simplicity
  tidyr::pivot_wider (names_from = age_cat, values_from = n)
age_by_outcome2

#??pivot_wider



# Summing rows
#Use adorn_totals () from the janitor packages.


#Counts and Percentages Within Groups
linelist24 <- linelist |>
  group_by (gender) |>
  summarize (
    known_outcome = sum (!is.na (outcome)),  # Number of rows with non-missing outcomes within each group
    n_death = sum (outcome == "Death", na.rm = T), # Number of rows where outcome is "Death" within each gorup
    n_recover = sum (outcome == "Recover", na.rm = T), # Number of rows where outcome is "Recoverd" within each group
  ) |>
  janitor::adorn_totals () |> # Process the total row (sum of each numeric column)
  janitor::adorn_percentages ("col") |> # Calculate column-wise proportions
  janitor::adorn_pct_formatting () |> # Convert proportions to percentages
  janitor::adorn_ns (position = "front") # Display percentages and counts (show counts first)
linelist24












#Summarising Total Data
#Perform summarise () on the "total" data first,
#then combine it back using bind_rows ().



#Grouped Summary by Hospital and Outcome
by_hospital <- linelist |>
  filter (!is.na (outcome) & hospital != "Missing") |>  # Revove case with missing outcome or hospital
  group_by (hospital, outcome) |> # Group th data
  summarise ( # Create new summary columns for metrics of interest
    N = n(), # Number of rows per hospital-outcome gorup
    ct_value = median (ct_blood, na.rm = T)) # Median CT value within each gorup

 # Output the table
by_hospital















#Summary by outcome only
  totals <- linelist |>
    filter (!is.na (outcome) & hospital != "Missing") |>
    group_by (outcome) |> # Remove hospital grouping and group only by outcome
    summarize (
      N = n(),             # Summary statistics by outcome only
      ct_value = median (ct_blood, na.rm = T))

totals  # Output the table












table_long <- bind_rows (by_hospital, totals) |>
#  mutate (hospital =  dbplyr::replace_na (hospital, "Total"))
#  mutate (hospital =  dtplyr::replace_na (hospital, "Total"))
#  mutate (hospital =  stringi::replace_na (hospital, "Total"))
  mutate (hospital =  tidyr::replace_na (hospital, "Total"))
table_long
#??replace_na







table_long2 <- table_long |>
#Wide Transformation and Formatting
  mutate (hospital = tidyr::replace_na (hospital, "Total")) |>
  tidyr::pivot_wider ( # Pivot from ling to wide format
    values_from = c(ct_value, N), # Create new valuues from ct_value and N (count) columns
    names_from = outcome) |>  # Use outcome as new column names
  mutate ( # Add new columns
    N_Known = N_Death + N_Recover, # Total number of known cases
    Pct_Death = scales::percent (N_Death / N_Known, .1), # Percemtage of death case (1 decimal place)
    Pct_Recover= scales::percent (N_Recover / N_Known, .1)) |> # Percentage of recovered cased (1 decimal place)
  select ( # Reorder column
    hospital, N_Known, # First column
    N_Recover, Pct_Recover, ct_value_Recover, # Recovered cases column
    N_Death, Pct_Death, ct_value_Death) |>   # Death cases column
  arrange (N_Known) # Sprt rows from smallest to largest (place total row at the bottom)
table_long2







#17.5 gtsummary Package
#Summary Tables
linelist25 <- linelist |>
  select (age_years, gender, outcome, fever, temp, hospital) |> # Keep only columns of interest
  gtsummary::tbl_summary () # default summary tabel
linelist25
#??tbl_summary


#Customisation
linelist26 <- linelist |>
  select (age_years) |>               # Keep only column of interest
  gtsummary::tbl_summary (                       # Create summary table
    statistic = age_years ~ "{mean}") # Output mean age
linelist26





linelist27 <- linelist |>
  select (age_years) |>                       # Keep only column of interest
  gtsummary::tbl_summary (                    # Create summary table
    statistic = age_years ~ "({min}, {max})") # Output min and max age
linelist27




lienlist28 <- linelist |>
  select (age_years, gender, outcome, fever, temp, hospital) |> # keep only of interest
  gtsummary::tbl_summary ( 
    by = outcome,                    # Stratify the entire table by outcome
    statistic = list (all_continuous () ~ "{mean} ({sd})", # Compute and format statistics for continuous variables
                      all_categorical () ~ "{n} / {N} ({p}%)"), #Compute and format statistics for categorical variables
    digits = all_continuous () ~ 1,  # Specify rounding for continuous variables
#    type = all_categorical () ~ "categorical",                            # Force display of all category levels
    label = list (                   # Display variable labels
      outcome ~ "Outcome",
      age_years ~ "Age (years)",
      gender ~ "Gender",
      temp ~ "Temperature",
      hospital ~ "Hospital"),
    missing_text = "Missing"
  )
linelist28

type = list(
  gender ~ "categorical",
  fever ~ "categorical",
  hospital ~ "categorical"
)

linelist28_2 <- linelist |>
  select (age_years, gender, outcome, fever, temp, hospital) |> # keep only of interest
  gtsummary::tbl_summary ( 
    by = outcome,                    # Stratify the entire table by outcome
    statistic = list (all_continuous () ~ "{mean} ({sd})", # Compute and format statistics for continuous variables
                      all_categorical () ~ "{n} / {N} ({p}%)"), #Compute and format statistics for categorical variables
    digits = all_continuous () ~ 1,  # Specify rounding for continuous variables
    type = all_categorical () ~ "categorical",                            # Force display of all category levels
    label = list (                   # Display variable labels
      outcome ~ "Outcome",
      age_years ~ "Age (years)",
      gender ~ "Gender",
      temp ~ "Temperature",
      hospital ~ "Hospital"),
    missing_text = "Missing" #Handling Missing Values
  )
linelist28_2


linelist28_3 <- linelist |>
  select (age_years, gender, outcome, fever, temp, hospital) |> # keep only of interest
  gtsummary::tbl_summary ( 
    by = outcome,                    # Stratify the entire table by outcome
    statistic = list (gtsummary::all_continuous () ~ "{mean} ({sd})", # Compute and format statistics for continuous variables
                      gtsummary::all_categorical () ~ "{n} / {N} ({p}%)"), #Compute and format statistics for categorical variables
    digits = gtsummary::all_continuous () ~ 1,  # Specify rounding for continuous variables
    type = gtsummary::all_categorical () ~ "categorical",                            # Force display of all category levels
    label = list (                   # Display variable labels
      outcome ~ "Outcome",
      age_years ~ "Age (years)",
      gender ~ "Gender",
      temp ~ "Temperature",
      hospital ~ "Hospital"),
    missing_text = "Missing" #Handling Missing Values
  )
linelist28_3






#Display Multiple Rows for Continuous Variables
linelist29 <- linelist |> 
  select (age_years, temp) |> # keep only columns of interest
  gtsummary::tbl_summary (    # Create a summary table
    type = gtsummary::all_continuous () ~ "continuous2",    # Specify that multiple statistics should be displayed
    statistic = gtsummary::all_continuous () ~ c(
      "{mean} ({sd})", # Row 1: mean and SD
      "{median} ({p25}, {p75})", # Row 2: median and IOR
      "{min}, {max}") # Row 3: minimum and maximum
  )
linelist2    
    


#~17:24



#17.5 Base R
 # Save the table as an object
 # Output the table



#Proportions 
 # Calculaterow-wise proportions from the previously defined table
 # Round the results



#Totals 


#Convert to a Data Frame



#17.5
#References
 # Number of rows with non-missin goutcomes within each group
 # Number of rows where outcome is "Death" within each group
 # Number of rows where outcome is "Recoverd" within each group

 # Process the total row (sum of each numeric column)
 # Calculate column-wise proprotions
 # Convert proportions to percentages
 # Display percentages and counts (show counts first)