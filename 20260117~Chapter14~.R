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
      hosp_name == "port"             ~ "PortHospital", 
      hosp_name == "St.Mark's"        ~ "St.Mark's Maternity Hospital (SMMH)",
      hosp_name == "central hospital" ~ "Central Hospital",
      TRUE                            ~ "hosp_name"
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
linelist_mini_semi <- hosp_info2 |>
  semi_join (linelist_mini, by = c ("hosp_name" = "hospital"))
linelist_mini_semi



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

#~15:24

#14.3

#~