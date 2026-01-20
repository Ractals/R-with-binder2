#20260117 24:45~
#14.1 preparation

install.packages ("pacman")
pacman::p_load (rio, here, tidyverse, RecordLinkage, fastLink)

download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
linelist <- readRDS ("linelist_cleaned.rds")
#download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.xlsx", "linelist_cleaned.xlsx")
#install.packages ("openxlsx")
#library (openxlsx)
#linelist <- read.xlsx ("linelist_cleaned.xlsx")
head (linelist, 5)

#sample dataset
linelist_mini <- linelist |>
  select (case_id, date_onset, hospital) |>
  head (10)
linelist_mini



#hospital information dataframe
hosp_info = data.frame (
  hosp_name = c("central hospital", "military", "military", "port", "St.Mark's", "ignace", "sisters"),
  catchment_pop = c(1950280, 40500, 10000, 50280, 12000, 5000, 4200),
  level = c("Tertiary", "Secondary", "Primary", "Secondary", "Secondary", "Primary", "Primary")
)
hosp_info

#Data preprocessing
unique (linelist_mini$hospital)

unique (hosp_info$hosp_name)

#Standardize values
hosp_info2 <- hosp_info |>
  mutate (
    hosp_name = case_when (
      #base                             #newvalue
      hosp_name == "military"         ~ "Military Hospital",
      hosp_name == "port"             ~ "Port Hospital", 
      hosp_name == "St.Mark's"        ~ "St. Mark's Maternity Hospital (SMMH)",
      hosp_name == "central hospital" ~ "Central Hospital",
      TRUE                            ~ hosp_name
    )
  )
hosp_info2
unique (hosp_info2$hosp_name)

#str_to_upper ()
#str_to_title ()

#14.2 Joins using dplyr
#left_join
linelist_mini_left <- linelist_mini |>
  left_join (hosp_info2, by = c ("hospital" = "hosp_name"))
linelist_mini_left
#linelist_mini_leftmerge <- linelist_mini |>
#  merge (hosp_info, by = c ("hospital" = "hosp_name"), all.x = TRUE)


linelist_mini_right <- hosp_info2 |>
  right_join (linelist_mini, by = c ("hosp_name" = "hospital"))
linelist_mini_right

#full join
linelist_mini_full <- linelist_mini |>
  full_join (hosp_info2, by = c ("hospital" = "hosp_name"))
linelist_mini_full



#inner join
linelist_mini_inner <- linelist_mini |>
  inner_join (hosp_info2, by = c ("hospital" = "hosp_name"))
linelist_mini_inner



#semi join
linelist_mini
hosp_info2
linelist_mini_semi <- hosp_info2 |>
  semi_join (linelist_mini, by = c ("hosp_name" = "hospital"))
linelist_mini_semi


#linelist_mini_semi2 <- linelist_mini|>
#  semi_join (hosp_info2, by = c ("hospital" = "hosp_name"))
#linelist_mini_semi2

#anti join
linelist_mini_anti <- hosp_info2 |>
  anti_join (linelist_mini, by = c ("hosp_name" = "hospital"))
linelist_mini_anti

#A complex ecample of anti_join ()
linelist_mini_complex <- linelist_mini |>
  inner_join (hosp_info2, by = c ("hospital" = "hosp_name"))
linelist_mini_complex

linelist_mini_complex2 <- linelist_mini |>
  anti_join (hosp_info2, by = c ("hospital" = "hosp_name"))
linelist_mini_complex2

#~25:24






#20260119 21:21~
#14.3 Probabilistic matching
pacman::p_load (
  tidyverse, fastLink
)
#It's too large, so i copy-pasted it - Occam's razor.
cases <- tribble(
  ~gender, ~first,      ~middle,     ~last,        ~yr,   ~mon, ~day, ~district,
  "M",     "Amir",      NA,          "Khan",       1989,  11,   22,   "River",
  "M",     "Anthony",   "B.",        "Smith",      1970, 09, 19,      "River", 
  "F",     "Marialisa", "Contreras", "Rodrigues",  1972, 04, 15,      "River",
  "F",     "Elizabeth", "Casteel",   "Chase",      1954, 03, 03,      "City",
  "M",     "Jose",      "Sanchez",   "Lopez",      1996, 01, 06,      "City",
  "F",     "Cassidy",   "Jones",      "Davis",     1980, 07, 20,      "City",
  "M",     "Michael",   "Murphy",     "O'Calaghan",1969, 04, 12,      "Rural", 
  "M",     "Oliver",    "Laurent",    "De Bordow" , 1971, 02, 04,     "River",
  "F",      "Blessing",  NA,          "Adebayo",   1955,  02, 14,     "Rural"
)

results <- tribble(
  ~gender,  ~first,     ~middle,     ~last,          ~yr, ~mon, ~day, ~district, ~result,
  "M",      "Amir",     NA,          "Khan",         1989, 11,   22,  "River", "positive",
  "M",      "Tony",   "B",         "Smith",          1970, 09,   19,  "River", "positive",
  "F",      "Maria",    "Contreras", "Rodriguez",    1972, 04,   15,  "Cty",   "negative",
  "F",      "Betty",    "Castel",   "Chase",        1954,  03,   30,  "City",  "positive",
  "F",      "Andrea",   NA,          "Kumaraswamy",  2001, 01,   05,  "Rural", "positive",      
  "F",      "Caroline", NA,          "Wang",         1988, 12,   11,  "Rural", "negative",
  "F",      "Trang",    NA,          "Nguyen",       1981, 06,   10,  "Rural", "positive",
  "M",      "Olivier" , "Laurent",   "De Bordeaux",  NA,   NA,   NA,  "River", "positive",
  "M",      "Mike",     "Murphy",    "O'Callaghan",  1969, 04,   12,  "Rural", "negative",
  "F",      "Cassidy",  "Jones",     "Davis",        1980, 07,   02,  "City",  "positive",
  "M",      "Mohammad", NA,          "Ali",          1942, 01,   17,  "City",  "negative",
  NA,       "Jose",     "Sanchez",   "Lopez",        1995, 01,   06,  "City",  "negative",
  "M",      "Abubakar", NA,          "Abullahi",     1960, 01,   01,  "River", "positive",
  "F",      "Maria",    "Salinas",   "Contreras",    1955, 03,   03,  "River", "positive"
)
#Probabilitic matching
fl_output <- fastLink::fastLink (
  dfA = cases,
  dfB = results,
  varnames = c("gender", "first", "middle", "last", "yr", "mon", "day", "district"),
  stringdist.match = c("first", "middle", "last", "district"),
  numeric.match = c("yr", "mon", "day"),
  threshold.match = .95)



#check matches
my_matches <- fl_output$matches
my_matches



#Clean the data before joining
#####################################
#Convert the row numbers (row.names) of cases into a column
cases_clean <- cases |> rownames_to_column ()

#Convert the row numbers (row.names) of test_results into a column
results_clean <- results |> rownames_to_column ()

#Convert all columns in the dataset to character strings so they can be joined by row number
matches_clean <- my_matches |>
  mutate (across (everything (), as.character))

#Join matches_clean to dfA, then join dfB as well
#####################################
#Add column "jnds.b" to dfA
complete <- left_join (cases_clean, matches_clean, by = c("rowname" = "inds.a"))

#Add columns originating from dfB
complete <- left_join (complete, results_clean, by = c("inds.b" = "rowname"))

cases_clean
results_clean
matches_clean
complete



cases_clean <- cases |> rownames_to_column ()

results_clean <- results |>
  rownames_to_column () |>
  select (rowname, result)

matches_clean <- my_matches |>
  mutate (across (everything (), as.character))

#joint
complete <- left_join (cases_clean, matches_clean, by = c ("rowname" = "inds.a"))
complete <- left_join (complete, results_clean, by = c("inds.b" = "rowname"))
cases_clean
results_clean
matches_clean
complete


case_matched <- cases [my_matches$inds.a,] # Rows in cases that match rows in resuts
results_matched <- results [my_matches$inds.b,] #Rows in results that match rows in cases

cases_not_matched <- casec[!rownames (cases) %in% my_matches$inds.a,] #Rows in cases that do not match any rows in results
results_not_matched <- results [!rownames (results) %in% my_matches$inds.b,] #Rows in results that do not match any rows in cases

#Pribabilistic deduplication
#Run fastLink on the same dataset
cases_dup <- complete
dedupe_output <- fastLink (
  dfA = cases_dup,
  dfB = cases_dup,
  varnames = c ("gender", "first", "middle", "last", "yr", "mon", "day", "district")
)

#Run getMatches ()
cases_dedupe <- getMatches (
  dfA = cases_dup,
  dfB = cases_dup,
  fl.out = dedupe_output
)

#Display the second row and all of its potential duplicates
cases_dedupe |>
  count (dedupe.ids) |>
  filter (n >1)

cases_dedupe [cases_dedupe$dedupe.ids ==2,]
#~21:59


#20260120 24:34~
#14.4 Joining and aligning data
#Bind rows

#Create the core table
hosp_summary <- linelist |>
  group_by (hospital) |> #sort by hospital
  summarise (            #Create new summary columns for the target metrics
    case = n (),         #Number of rows per hospital-outcome group
    ct_value_med = median (ct_blood, na.rm = T) #Median CT value per group
  )
hosp_summary

#Create totals
totals <- linelist |>
  summarise (
    cases = n(),                              # Total number of rows in entire dataset
    ct_value_med = median (ct_blood, na.rm = T) # Median CT value for the entire dataset
)
totals

#Bind the data frames
combined <- bind_rows (hosp_summary, totals)
combined

#~24:50

#25:11~
#Bind columns
#Create a summary statistics table
case_info <- linelist |>
  group_by (hospital) |>
  summarise (
    cases = n(),
    deaths = sum (outcome  == "Death", na.rm = T)
  )
case_info
#~25:12


#14.5 References
