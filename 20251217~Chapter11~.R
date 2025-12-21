#20251217 18:15～
#11.1 Preparation
#Loading packages
#install.packages ("pacman")
#pacman:: P_load (
#  rio,
#  here,
#  lubridate,
#  forcats,
#  aweek,
#  janitor,
#  tidyverse
#)

#I can not install above packags
#install.packages ("rio", "here", "lubridate", "forcats", "aweek", "janitor", "tidyverse")
#library (rio)
#i can not it.
install.packages ("rio")
install.packages ("here")
install.packages ("lubridate")
install.packages ("forcats")
install.packages ("aweek")
install.packages ("janitor")
install.packages ("tidyverse")

library ("rio")
library ("here")
library ("lubridate")
library ("forcats")
library ("aweek")
library ("janitor")
library ("tidyverse")

install.packages ("dplyr")
library (dplyr)
#inport data
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
linelist <- readRDS ("linelist_cleaned.rds")
head (linelist, 5)


#A new categorical variable
linelist0 <- linelist

linelist1 <- linelist |>
  mutate (delay_cat = case_when (
    #Criterion                              Value assigned to delay_cat when the condition is TRUEif base as TRUE then input to delay_cat as value
    days_onset_hosp <2                        ~ "<2 days",
    days_onset_hosp >= 2 & days_onset_hosp <5 ~ "2-5 days",
    days_onset_hosp >= 5                      ~ ">5 days",
    is.na (days_onset_hosp)                   ~ NA_character_,
    TRUE                                      ~ "Check me"
  ))
linelist1


#Initial order
table (linelist1$delay_cat, useNA = "always")

install.packages ("ggplot2")
library (ggplot2)
ggplot (data = linelist1)+
  geom_bar (mapping = aes (x = delay_cat))

#~18:53


#19:30～再開
#11.2 Converting to a factor type
#To convert character or numeric columns to factors,
#use one of the functions provided in the forcats package. 
install.packages ("forcats")
library (forcats)
linelist2 <- as_tibble (linelist1)

#In the example below, mutate () and fct_relevel () are used to convert
#delay_cat column from a character type to a facter.
linelist3 <- linelist2 |>
  mutate (delay_cat2 = fct_relevel (delay_cat))
str (linelist3$delay_cat)
typeof (linelist3$delay_cat2)
glimpse (linelist3)

#Here, the uniqe values in thei column (i.e, values extracted without duplication) 
#are treated as the factor levels. Factor levels have an order,
#which can be checked using base R's levels (), or displayed as a frequency table
#using base R's table () or janitor::tabyl (), which shows the count of value in the column.
levels (linelist3$delay_cat2)


#You can also munually specify the order of factor levels using fct_relevel ().
linelist4 <- linelist3 |>
  mutate (delay_cat2 = fct_relevel (delay_cat, "<2 days", "2-5 days", ">5 days"))
linelist4
levels (linelist4$delay_cat2)


ggplot (data = linelist4)+
  geom_bar (mapping = aes (x = delay_cat2))


#11.3 Adding or Removing Levels
#add label

#If you need to add levels to a factor, you can do so using fct_expand ().
install.packages ("janitor")
library (janitor)
linelist5 <- linelist4 |>
  mutate (delay_cat2 = fct_expand (delay_cat2, "Not admitted to hospital", "Transfer to other jurisdiction")) |>
  tabyl (delay_cat2) #Displaying tables
#linelist5 appears to have been created successfully, but nothing happens when I run tabyl.
head (linelist5$delay_cat2)

#delete level
linelist6 <- linelist5 |>
  mutate (delay_cat2 = fct_drop (delay_cat2)) |>
  tabyl (delay_cat2)
#It doesn’t work with table() either.
# Not working”
#~20:20 in cafe

#For some reason, it doesn't work even wen i import the data using the downloaded version of Rstudio i don't get it at all.
#~25:15




#20251221
head (linelist2$delay_cat)
head (linelist3$delay_cat2)
head (linelist4$delay_cat2)
head (linelist5$delay_cat2)
head (linelist6$delay_cat2)
tabyl (linelist5$delay_cat2)
tabyl (linelist6$delay_cat2)

linelist7 <- linelist6
linelist7 <- linelist7 |>
  mutate (delay_cat2 = fct_drop (delay_cat2)) |>
  tabyl (delay_cat2)
tabyl (linelist7$delay_cat2)

#For some reason, after rerunning everything from scratch, it executed without any issues.
#However, it still doesn't work when chained with the pipe oberator,
#when i run tabyl on its own, i can inspect the contents of the object,
#but drop doesn't seem to have been applied.
#Anyway, let's move on.



##16: