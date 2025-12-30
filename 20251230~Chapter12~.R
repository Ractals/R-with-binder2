#2025123015:12~
#pacman::p_load (rio, here, kableExtra, tidyverse)
#install.packages ("rio")
#install.packages ("here")
#install.packages ("kableExtra")
#install.packages ("tidyverse")

#library (rio)
#library (here)
#library (kableExtra)
#library (tidyverse)

#12.1 preparation
install.packages ("pacman")
pacman::p_load (rio, here, kableExtra, tidyverse)

#Malaria case count data
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/malaria_facility_count_data.rds", "malaria_facility_count_data.rds")
count_data <- readRDS ("malaria_facility_count_data.rds")
head (count_data, 5)


#"download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
#"linelist <- readRDS ("linelist_cleaned.rds")
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.xlsx", "linelist_cleaned.xlsx")
install.packages ("openxlsx")
library (openxlsx)
linelist <- read.xlsx ("linelist_cleaned.xlsx")
head (linelist, 5)

#12.1.1 Line list of case data
#12.2From wide to long
#12.2.1Wide format
ggplot (count_data) +
  geom_col (aes (x = data_date, y = malaria_tot), width = 1)


#12.2.2 Standard wide-to-long transformation
df_long <- count_data |>
  pivot_longer (
    cols = c("malaria_rdt_0-4", "malaria_rdt_5-14", "malaria_rdt_15", "malaria_tot")
  )
head (df_long, 5)


#Select columns using tidyselect helper functions
count_data2 <- count_data |>
  pivot_longer (
    cols = starts_with ("malaria_")
  )
head (count_data2$name)
#Select columns by position
count_data3 <- count_data |>
  pivot_longer (cols = 6:9)
head (count_data3, 5)

#Select a range of consecutive columns
count_data4 <- count_data |>
  pivot_longer (cols = "malaria_rdt_0-4": malaria_tot)
head (count_data4)

head (count_data)

#named new columns
df_long2 <- count_data |>
  pivot_longer (
    cols = starts_with ("malaria_"),
    names_to = "age_group",
    values_to = "counts"
  )
head (df_long2$age_group, 5)


ggplot (data = df_long2) +
  geom_col (
    mapping = aes (x = data_date, y = counts, fill = age_group),
    width = 1
  )
#~16:08