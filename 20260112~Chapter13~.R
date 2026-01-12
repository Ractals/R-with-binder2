#13.1 Preparation
#20260112 16:42~
pacman::p_load(rio, here, tidyverse, janitor)
#"download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
#"linelist <- readRDS ("linelist_cleaned.rds")
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.xlsx", "linelist_cleaned.xlsx")
install.packages ("openxlsx")
library (openxlsx)
linelist <- read.xlsx ("linelist_cleaned.xlsx")
head (linelist, 5)


#13.2 Grouping
ll_by_outcome <- linelist |>
  group_by (outcome)
ll_by_outcome
print (ll_by_outcome)

#group
l_by_outcome1 <- ll_by_outcome |>
  group_by (outcome) |>
  tally ()
ll_by_outcome1
linelist1 <- linelist |>
  group_by (outcome) |>
  tally ()
linelist1

#Unique group
ll_by_outcome2 <- ll_by_outcome |>
  group_by (outcome) |>
  group_keys ()
ll_by_outcome2
linelist2 <- linelist |>
  group_by (outcome) |>
  group_keys ()
linelist2
#Unique groups
linelist3 <- linelist |> group_by (outcome, gender) |>
  tally ()
linelist3

#new column
#Group the data using a binary variable (column) created within the group_by () command.
linelist4 <- linelist |>
  group_by (
    age_class = ifelse (age >= 18, "adult", "child")
  ) |>
  tally (sort = T)
linelist4

#Adding and removing grouping variables
#Group by outcome
by_outcome <- linelist |>
  group_by (outcome)
by_outcome_tally <- by_outcome |> 
  tally ()
by_outcome_tally
#Additionally,group by sex
by_outcome_gender <- by_outcome |>
  group_by (gender, .add = TRUE)
by_outcome_gender_tally <- by_outcome_gender |>
  tally ()
by_outcome_gender_tally


#Ungrouping
head (linelist,5)
linelist0 <- linelist
linelist <- linelist0
linelist5_0 <- linelist |>
  group_by (outcome, gender) |>
  tally () 
head (linelist5_0, 5)
linelist5 <- linelist |>
  group_by (outcome, gender) |>
  tally () |>
  ungroup ()
head (linelist5, 5)

linelist6 <- linelist |>
  group_by (outcome, gender) |>
  tally () |>
  ungroup (gender) #Remove grouping by gender while keeping grouping by outcome.
head (linelist6, 5)

#13.3 Summarizing grouped data

#13.4 Aggregation grouped data

#tally ()

#count ()

#Add totals


#Add sums



#13.5 Grouping by date

#Group line list cases by day

#Group line list cases by week

#Group line list cases by month


#Aggregate daily counts into weekly counts
#To aggredate daily counts into weekly counts, use floor_date () as shown above.
#However, insteadof count (), use group_by () and summarize ().
#This is because you need not only to count the number of rows per week, but also to sum the daily case counts using sum ().

#Aggredate daily counts into monthly counts
#To aggredate daily counts into monthly counts, use floor_date () with unit = "month" as shown above.
#Again, instead of count (), use group_by () and summarize (),
#This is because you need not only to count the number of rows per month, but also to sum the daily case counts useing sum ().

#13.6 Sorting groped data
#When you use arrange () from dplyr to reorder rows in a data frame, it behaves the same way even when the data are grope, unless the argument .by_group = TRUE is specified.
#When .by_group = TRUE is used, rows are first sorted  y the grouping variables, and then by the variables specified in arrange ().

#13.7 Filtering grouped data

#Slicing by group

#Filtering by grop size

#13.8 Transforming grouped data

#13.9 Selecting grouped data

#13.10 References