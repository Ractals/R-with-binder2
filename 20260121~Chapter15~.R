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
#15.3 slicing (extract)