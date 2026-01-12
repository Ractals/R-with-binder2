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
  #20260103 add
  install.packages ("ggplot2")
  library (ggplot2)

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

#20260103 22:02~
#Before passing the data to ggplot (), simply extract the total number of from the dataset.
df_long3 <- df_long2 |>
  filter (age_group != "malaria_tot") |>
  ggplot () +
  geom_col (
    aes (x = data_date, y = counts, fill = age_group),
    width = 1
  )
#filter
#ggplot
#geom_col
#aes

head (df_long2$age_group)
head (df_long2$data_date)
head (df_long2$counts)
#head (df_long$age_group)
df_long3
df_long2$age_group

#ggplot (data = df_long3) +
#  geom_col(
#    mapping = aes (x = data_date, y = counts, fill = age_group),
#    width = 1
#  )
#I can't create df_long3 from df_long2. i dont't understand what it reason.
#~22:36

#When running pivot_longer (), you can exclude this variable (the malaria_tot column) ad kee it in the dataset as a separate variable.



#20260111 18:24~
#retry on 0103 (without "malaria_tot in df_long2)

#when creating the prot, remove "malaria_tot"
#df_long$counts
df_long2$counts

df_long3_2 <- df_long2 |>
  filter (age_group != "malaria_tot") |>
  ggplot ()+
  geom_col (
    aes (x = data_date, y = counts, fill = age_group),
    width = 1
  )
df_long3_2

#or alternatively, specify only the data other than "malaria_tot" when transposing.

df_long4 <- count_data |>
  pivot_longer (
    cols = "malaria_rdt_0-4" : malaria_rdt_15,
    names_to = "age_group",
    values_to = "counts"
  )
df_long4
#12.2.3 Pivoting data that contain multiple data types
df <- df_long2 |>
  pivot_longer (
    cols = -id,
    names_to = c ("observation")
  )
str (count_data)
#what the hell, so it's not real data?
#A	2021-04-23	Healthy	2021-04-24	Healthy	2021-04-25	Unwell
#B	2021-04-23	Healthy	2021-04-24	Healthy	2021-04-25	Healthy
#C	2021-04-23	Missing	2021-04-24	Healthy
df <- tibble (
id  = c("A", "B", "C"),
obs1_date = c("2021-04-23", "2021-04-23", "2021-04-23"),
obs1_status = c("Healthy", "Healthy", "Missing"),
obs2_date = c("2021-04-24", "2021-04-24", "2021-04-24"),
obs2_status = c("Healthy", "Healthy", "Healthy"),
obs3_date = c("2021-04-25", "2021-04-25", "2021-04-25"),
obs3_status = c("Unwell", "Healthy", "Healthy")
)
df
#df$obs3_status
df2 <- df |>
  pivot_longer (
    cols = -id,
    names_to = c("observation")
  )
df2
df_long5 <- df |>
  pivot_longer (
    cols = -id,
    names_to = c("observation", ".value"),
#names_to = c("observation"),
    names_sep = "_"
  )
df_long5


df_long6 <- df_long5 |>
  mutate (
    date = date |> lubridate::as_date (),
    observation = 
      observation |>
      str_remove_all ("obs") |>
      as.numeric ()
  )
df_long6


ggplot (data = df_long6, mapping = aes (x = date, y = id, fill = status)) +
  geom_tile (colour = "black")+
  scale_fill_manual (
    values = 
      c ("Healthy" = "lightgreen",
         "Unwell" = "red",
         "Missing" = "orange")
  )

#12.3 Feom long to wide
df_wide <- linelist |>
  count (age_cat, gender)
df_wide

#20260111 25:17~
#12.4 Filling in missing values
df1 <- tibble::tribble (
  ~Measurement, ~Facility, ~Cases,
             1, "Hosp 1",      66,
             2, "Hosp 1",      26,
             3, "Hosp 2",       8,
             1,  "Hosp 2",     71,
             2,  "Hosp 2",     62,
             3,  "Hosp 2",     70,
             1,  "Hosp 3",     47,
             2,  "Hosp 3",     70,
             3,  "Hosp 3",     38,  
)
df1

df2 <- tibble::tribble (
  ~Year, ~Measurement, ~Facility, ~Cases,
  2000,            1,  "Hosp 4",     82,
  2001,            2,  "Hosp 4",     87,
  2002,            3,  "Hosp 4",     46
)
df2

install.packages ("dplyr")
library (dplyr)
#arrange


df_combined <-
  bind_rows (df1, df2) |>
  arrange (Measurement, Facility)
df_combined

#fill ()
install.packages ("tidyr")
library (tidyr)
#fill

df_combined2 <- df_combined |>
  fill (Year, .direction = "up")
df_combined2

df_combined3 <-
  df_combined |>
  arrange (Measurement, desc (Facility))
df_combined3

df_combined4 <-
  df_combined3 |>
  fill (Year, .direction = "down")
df_combined4

ggplot (df_combined4)+
  aes (Year, Cases, fill = Facility)+
  geom_col ()

install.packages ("janitor")
library (janitor)
#adorn_totals
  
install.packages ("knitr")
library (knitr)

#install.packages ("kableExtra")
#library (kableExtra)
install.packages("kableExtra")
library(kableExtra)

#install.packages ("arrange")
#library (arrange)
install.packages ("dplyr")
library (dplyr)
#arrange
install.packages ("tidyr")
library (tidyr)
#fill

df_combined5 <- df_combined4 |>
  pivot_wider (
    id_cols = c(Measurement, Facility),
    names_from = "Year",
    values_from = "Cases"
  ) |>
  arrange (Facility) |>
#  janitor::adorntotals (c("row", "col")) |>
#  knitr::kable ()|>
#  kableExtra::row_spec (row = 5, bold = TRUE) |>
#  kableExtra::column_spec (column = 5, bold = TRUE)
  adorn_totals (c("row", "col")) |>
  kable ()|>
  row_spec (row = 5, bold = TRUE) |>
  column_spec (column = 5, bold = TRUE)
df_combined5

#Error in adorn_totals(arrange(pivot_wider(df_combined4, id_cols = c(Measurement,  : 
#                                                                      at least one targeted column must be of class numeric.  Control target variables with the ... argument. adorn_totals should be called before other adorn_ functions.
#                                                                    In addition: Warning message:
#                                                                      Values from `Cases` are not uniquely identified; output will contain list-cols.
#                                                                    • Use `values_fn = list` to suppress this warning.
#                                                                    • Use `values_fn = {summary_fun}` to summarise duplicates.
#                                                                    • Use the following dplyr code to identify duplicates.
#                                                                    {data} %>%
#                                                                      dplyr::group_by(Measurement, Facility, Year) %>%
#                                                                      dplyr::summarise(n = dplyr::n(), .groups = "drop") %>%
#                                                                      dplyr::filter(n > 1L) 
#I don't understand at all why the two pieces of code above won't run.

  #20260112
  arrange
    adorn_totals
    kable
    row_spec
    column_spec 
    #why it loogs like the functions "disappeared"
    #in R:
      #You load library (dplyr)
      #Other packages are not loaded automatically
      #Functions that previously worked can no longer be found
    #This is how R behaves.
      #Not:Loading dplyr broke things
      #Yes;You simply haven't reloaded the required packages with library ()
  install.packages(c("dplyr", "tidyr", "janitor", "knitr", "kableExtra", "tidyr"))
  
  library(dplyr)       # arrange
  library(janitor)     # adorn_totals
  library(knitr)       # kable
  library(kableExtra)  # row_spec, column_spec
  library (tidyr)
  arrange
  adorn_totals
  kable
  row_spec
  column_spec 
  pivot_wider
  
  df_combined5 <- df_combined4 |>
    pivot_wider (
      id_cols = c(Measurement, Facility),
      names_from = "Year",
      values_from = "Cases"
    ) |>
    arrange (Facility) |>
    adorn_totals (c("row", "col")) |>
    kable ()|>
    row_spec (row = 5, bold = TRUE) |>
    column_spec (column = 5, bold = TRUE)
  df_combined5
  
  #df_combined5 <- df_combined4
  df_combined5 <- as.data.frame(df_combined4)  
  df_combined5
  df_combined5 <- df_combined5 %>% 
    pivot_wider(
      id_cols = c(Measurement, Facility),
      names_from = "Year",
      values_from = "Cases"
    ) %>% 
    arrange(Facility)
  df_combined5 <- 
    adorn_totals(df_combined5, c("row", "col")) %>% 
    kable() %>% 
    row_spec(row = 5, bold = TRUE) %>% 
    column_spec(column = 5, bold = TRUE) 
    #Error in adorn_totals(df_combined5, c("row", "col")) : 
    #at least one targeted column must be of class numeric.  Control target variables with the ... argument. adorn_totals should be called before other adorn_ functions.
    #It'shopeless. there's nothing i can do about it.20260112~14:49
df_combined6 <- df_combined5 |>
  pivot_wider (
    nemas_fro = "Year",
    values_from = "Cases"
  ) |>
  knitor::kable ()
#Error in loadNamespace(x) : there is no package called ‘knitor’
#This is due to the effect of the previous logic.

#12.5 References
#~26:08
