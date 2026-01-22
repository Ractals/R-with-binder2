#20260121 24:20~



#15.1 Preparation
install.packages ("pacman")
pacman::p_load (
  tidyverse, janitor,stringr
)
#It's too large, so i copy-pasted it.
obs <- data.frame(
  recordID  = c(1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18),
  personID  = c(1,1,2,2,3,2,4,5,6,7,2,1,3,3,4,5,5,7,8),
  name      = c("adam", "adam", "amrish", "amrish", "mariah", "amrish", "nikhil", "brian", "smita", "raquel", "amrish",
                "adam", "mariah", "mariah", "nikhil", "brian", "brian", "raquel", "natalie"),
  date      = c("1/1/2020", "1/1/2020", "2/1/2020", "2/1/2020", "5/1/2020", "5/1/2020", "5/1/2020", "5/1/2020", "5/1/2020","5/1/2020", "2/1/2020",
                "5/1/2020", "6/1/2020", "6/1/2020", "6/1/2020", "6/1/2020", "7/1/2020", "7/1/2020", "7/1/2020"),
  time      = c("09:00", "09:00", "14:20", "14:20", "12:00", "16:10", "13:01", "15:20", "14:20", "12:30", "10:24",
                "09:40", "07:25", "08:32", "15:36", "15:31", "07:59", "11:13", "17:12"),
  encounter = c(1,1,1,1,1,3,1,1,1,1,2,
                2,2,3,2,2,3,2,1),
  purpose   = c("contact", "contact", "contact", "contact", "case", "case", "contact", "contact", "contact", "contact", "contact",
                "case", "contact", "contact", "contact", "contact", "case", "contact", "case"),
  symptoms_ever = c(NA, NA, "No", "No", "No", "Yes", "Yes", "No", "Yes", NA, "Yes",
                    "No", "No", "No", "Yes", "Yes", "No","No", "No")) %>% 
  mutate(date = as.Date(date, format = "%d/%m/%Y"))



obs2 <- obs |>
  tabyl (name, purpose)
obs2

#15.2 Deduplication

#Check for duplicate rows
get_dupes

#100% duplicate across all columns 
obs
obs3 <- obs |>
  janitor::get_dupes ()
#No variable names specified - using all columns.

library(janitor)
obs3_2 <- obs |>
  get_dupes ()
#No variable names specified - using all columns.

obs4 <- obs |>
  janitor::get_dupes (-recordID)
obs4

#Keep only unique rows
obs5 <- obs |>
  distinct (across (-recordID),
            .keep_all = TRUE) #Make the data frame contain only uniwue rows (keep the first occurrence of duplicates)
obs5


#Remove duplicates based on specific columns
obs6 <- obs |>
  distinct (name, purpose, .keep_all = TRUE) |> #Remove duplicates based on the name and purpose columns to obtain uniqu rows while retaining all columns
  arrange (name) #Reorder for better readability
obs6

#Remove duplicate elements within a vector
x <- c (1, 1, 2, NA, NA, 4, 5, 4, 4, 1, 2)
duplicated (x)

x [duplicated (x)]

unique (x)

unique (na.omit (x))

#Using base R
duplicated (obs)
obs [duplicated (obs),]
obs

obs [!duplicated (obs),]

obs [!duplicated (obs[, 2:5]),]

obs [!duplicated (obs[, c("name", "purpose")]),]

#~24:47



#20260122 20:26~
#15.3 slicing (extract)

obs01 <- obs |> slice (4) #return the 4 row
obs01

obs02 <- obs |> slice (c(2, 4)) #return 2 and 4 row
obs02

obs03<- obs |> slice (c(2:4)) #return 2 to 4 row
obs03

obs04 <- obs |> slice_min (n = 3)
obs04

obs05 <- obs |> slice_max (n = 2)
obs05

obs06 <- obs |> slice_head ()
obs06

obs07 <- obs |> slice_tail ()
obs07

obs08 <- obs |> slice_sample ()
obs08

#slice by group
obs010<- obs |>
  group_by (name) |> #Grop row by the name column
  slice_max (date, #Keep the row with the maximum date value in each group
             n = 1, #Retain only the top row
             with_ties = F) #If multiple rows have the same date, keep the first row
obs010

#Break ties


#Example of using multiple slices to break ties
obs011 <- obs |>
  group_by (name) |>
  #First, slice by the most recent date
  slice_max (date, n = 1, with_ties = T) |>
  #Next, if multiple rows still match, select the row with the must recent time (ties are not allowed)
  slice_max (lubridate::hm(time), n = 1, with_ties = F)
obs011


#Keep everything, but mark it
#1.Define the rows to keep for analysis as a data frame
obs_keep <- obs |>
  group_by (name) |>
  slice_max (encounter, n = 1, with_ties = FALSE) #Retain only the most recent encounter for each participant
#2.Mark the original data frame
obs_marked <- obs |>
  
  #Create a new dup_record column
  mutate (dup_record = case_when (
    #Mark records that are present in the obs_keep data frame
    recordID %in% obs_keep$recordID ~ "For analysis",
    #Mark all other records as "lgnore" for analysis
    TRUE ~ "Ignore"
    
  ))

#Output
obs_marked


#Calculate row completeness
#Create a vector of columns to be used as the "key"
#Display the results as the proportion of non-missing values among the columns specified as key_cols
key_cols = c("personID", "name", "symptoms_ever")
#obs012 <- obs |>
obs012 <- obs %>%
  mutate (key_completeness = rowSums (!is.na (.[,key_cols]))/length (key_cols))
obs012


#~20:59
#15.4 Rolled-upvalues

#Arrange rolled-up values into a single column

#Roll up values into one row per personID
cases_rolled <- obs |>
  #Group by personID
  group_by (personID) |>
  #Sort rows within each grop (e.g., by date)
  arrange (date, .by_group = T) |>
  #Paste together all values within each group, separating them with "; " in each column
  summarise (
    across (everything (), #Apply to all columns
            ~paste0 (na.omit (.x), collapse = "; "))) #Function to concatenate non-missing values
cases_rolled

#Variant - display unique values only
cases_rolled2 <- obs |>
  group_by (personID) |>
  arrange (date, .by_group = T) |>
  summarise (
    across (everything (), #Apply to all columns
            ~paste0 (unique (na.omit (.x)), collapse = "; "))) #Function to concatenate non-missing (non-NA) values
cases_rolled2


#Variant - add a suffix to column names
cases_rolled3 <- obs |>
  group_by (personID) |>
  arrange (date, .by_group = T) |>
  summarise(
    across (everything(),
            list (roll = ~paste0 (na.omit (.x), collapse = "; ")))) #Append "_roll" to column names
cases_rolled3

#Overriding Values and Hierarchies
#Clean case
#Clean Yes-No-Unknown columns:
cases_clean <- cases_rolled3 |>                                  #Replace the text based on the "highest" value (most important value) found in the string
  mutate (across (c (contains ("symptoms_ever")),                #Operate on the specified columns (Y / N / U)
            list (mod = ~case_when (                             #Implement case_when () and add the suffix "_mod" to the new columns
              str_detect (.x, "Yes")     ~"Yes",                 #If "Yes" is detected, convert the cell value to "Yes"
              str_detect (.x, "No")      ~ "No",                 #If "No" is detected, convert the cell value to "No"
              str_detect (.x, "Unknown") ~ "Unknown",            #If "Unknown" is detected, convert the cell value to "Unknown"
              TRUE                       ~ as.character (.x)))), #Otherwise, keep the original value
      .keep = "unused")                                          #Drop the original columns and keep only the "_mod" columns
cases_clean 

#15.5 Probabilistic Deduplication

#15.6 Reference
#~21:48