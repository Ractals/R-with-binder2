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



#18:36~:
#11.4 Adjusting the order of levels
#Manually adjust
head (linelist1$delay_cat)
linelist11_4_0 <- linelist1

linelist11_4_1 <- linelist11_4_0 |>
  mutate (delay_cat3 = fct_relevel (delay_cat, c("<2 days", "2-5 days", ">5 days")))
head (linelist11_4_1$delay_cat3)
head (linelist1$delay_cat)

tabyl (linelist11_4_0$delay_cat)  # 2-5 <2  >5
tabyl (linelist11_4_1$delay_cat3) # <2  2-5 >5
#tabyl (linelist7$delay_cat2)

#linelist11_4_0
#linelist11_4_1

linelist11_4_2 <- linelist11_4_0 |>
  mutate (delay_cat4 = fct_relevel (delay_cat, "<2 days", after = 1)) |>
  tabyl (delay_cat4)
tabyl (linelist11_4_2$delay_cat4) # >5 <2  2-5   (after = 0 or more)



library (ggplot2)
#ggplot
#adjust within the plot
　#Default alphanumeric ordering (no reordering in ggplot)
ggplot (data = linelist11_4_2) + 
  geom_bar (mapping = aes (x = delay_cat4))
  #Factor level order as adjusted within ggplot
ggplot (data = linelist11_4_2)+
  geom_bar (mapping = aes (x = fct_relevel (delay_cat4, c("<2 days", "2-5 days", ">5 days"))))

#all value 1.00 what is this???

ggplot (data = linelist1) +
  geom_bar (mapping = aes (x = delay_cat))
ggplot (data = linelist1)+
  geom_bar (mapping = aes (x = fct_relevel (delay_cat, c("<2 days", "2-5 days", ">5 days"))))

#Reverse
ggplot (data = linelist1)+
  geom_bar (mapping = aes (x = delay_cat))
ggplot (data = linelist1)+
  geom_bar (mapping = aes (x = fct_rev (delay_cat)))
#ggplot (data = linelist1)+
#  geom_bar (mapping = aes (x = guides (delay_cat)))
#I don't fully understand how guides () works

#Ordering by frequency
#Sort by frequency
ggplot (data = linelist1, aes (x = fct_infreq (delay_cat)))+
  geom_bar ()+
  labs (x = "Delay onset ot admission (days)",
        title = "Ordered by frequency")
#Reverse the order based on frequency
ggplot (data = linelist1, aes (x = fct_rev (fct_infreq (delay_cat))))+
  geom_bar ()+
  labs (x = "Delay onset to admission (days)",
  title = "Reverse of order by frequency")



#Order based on the order of appearance
#Using fct_inorder (), you can set the factor level order to match the order of first appearance in the data.
#fct_inorder () is particularly useful when you reorder a data frame with arrange () and want the factor levels to follow that reorderd row order.

#Show a concrete exaple-this explanation makes no sense as is is.

#Order based on summary statistics of another column
#Boxplot ordered by the original factor level order
ggplot (data = linelist1)+
  geom_boxplot (
    aes (x = delay_cat,
         y = ct_blood,
         fill = delay_cat)) +
  labs (x = "Delay onset to admission (days)",
        title = "Ordered by original alpha-numeric levels")+
  theme_classic ()+
  theme (legend.position = "none")
#Boxplot orderd by the median CT value
ggplot (data = linelist1)+
  geom_boxplot (
    aes (x = fct_reorder (delay_cat, ct_blood, "median"),
         y = ct_blood,
         fill = delay_cat))+
  labs (x = "Delay onset to admission (days)",
        title = "Ordered by median CT value in group")+
  theme_classic ()+
  theme (legend.position = "none")

#Order by the value at the end
epidemic_data <- linelist1 |>
  filter (date_onset < as.Date ("2014-09-21")) |>
  count (
    epiweek = lubridate::floor_date (date_onset, "week"),
    hospital
  )

ggplot (data = epidemic_data)+
  geom_line (
    aes(
      x = epiweek,
      y = n,
      color = fct_reorder2 (hospital, epiweek, n)
    ))+
  labs (title = "Factor levels (and legend display) by line height at end of plot",
        color = "Hospital")




#11.5
#If a factor column contains missing values (NA), you can easily convert them into a named level such as "Missing" by using fct_explicit_na ().
#By default, NA values are converted to "(Missing)" and placed at the end of the factor level order.
#You can customize the level name suing the na_level = argument.
#In the example below, fct_explicit_na () is applied to the delay_cat column, converting NA values to "Missing delay", and the resulting table is desplayed using tabyl ().
linelist11_5 <- linelist1 |>
  mutate (delay_cat6 = fct_explicit_na (delay_cat, na_level = "Missing delay")) |>
  tabyl (delay_cat6)


#~20:05

linelist1
#22:12~
#11.6Combine levels
#Manually
levels (linelist3$delay_cat2)
#In the following example, new levels are created using fct_recode (column, "nwe" = "old", "new" = old", "new" = "old")
#The syntax of fct_recode () differs from that of recode ().
#With recode(), factor levels are specified in the form OLD = NEW, whereas fct_recode () yses tge firn NWE=  OLD.
linelist11_6_1 <- linelist3 |>
  mutate (delay_cat7 = fct_recode (
    # new levels          old levels
    delay_cat2,
    "Less than 2 days" = "<2 days",
    "2 to 5 days" = "2-5 days",
    "More than 5 days" = ">5 days"
  )) |>
  tabyl(delay_cat7)
tabyl(linelist11_6_1$delay_cat7)


#Next, fct_recode () is used to combine multiple levels into a single level.
#Note that no error occurs when the new level "Less than 5 days" is created.

linelist11_6_2 <- linelist3 |>
  mutate (delay_cat8 = fct_recode (
    delay_cat2,
    "Less than 5 days" = "<2 days",
    "Less than 5 days" = "2-5 days",
    "More than 5 days" = ">5 days"
  )) |>
  tabyl (delay_cat8)
tabyl(linelist11_6_2$delay_cat8)


#collapse into "Other"
#You can use fct_other () to manually assign factor levels to a level named "Other".
#In the example below, all hospitals in the hospital column except "Port Hospital" and "Center Hospital" are grouped into "Other".
#You can specify levels using either keep = or drop = with a vector.
#The lavel of the "Other# level can be changed using other_level = .
linelist11_6_3 <- linelist3 |>
  mutate (hospital = fct_other (
    hospital,
    keep = c("Port Hospital", "Central Hospital"),
    other_level = "Other Hospital"
  )) |>
  tabyl (hospital)
tabyl (linelist11_6_3$hospital)


#Combaininfrequent levels
#You can use fct_lump () to automatically combine the least frequent factor levels.
#To group many low-frequency levels into a single "Other" level, you can do one of the following:
#・Use n = to specify the number of groups you want to keep ad distinct levels.
#  The top n levels (by frequency) are retained, and all remaining levels are combined into "Other".   
#・Use prop = to specify a threshold propotion for the levels you want to keep.
#  Levels with frequencies below this proportion are combined into "Other"
#You can change the label of the "Other" level using other_level = .
#In the example below, all hospitals except the two most frequent ones are combined into "Other Hospital".
linelist11_6_4 <- linelist3 |>
  mutate (hospital = fct_lump (
    hospital,
    n = 2,
    other_level = "Other Hospital"
  )) |>
  tabyl (hospital)
tabyl (linelist11_6_4$hospital)

#within a plot 
#omit words
ggplot (data = linelist3)+
  geom_bar (mapping = aes (x = hospital, fill = age_cat))+
  scale_fill_discrete (drop = FALSE)+
  labs (
    title = "All age groups will appear in legend, even if no peresent in data"
  )

#In a table
#With janitor::tabyl () and base R's table (), all factor levels are displayed, including levels that are not currently used.
#11.7 Epidemiological week

#Epidemiological weeks within plots
#If your pgal is to create epidemiological weeks and display them in a plot,
#this can be done easily suing floor_date () from the lubridate package, as described in the chapter on Grouping data.
#The values created in this the way will be date objects in YYY-MM-DD format.
#When a column created with floor_date () is used in a plot, 
#the dates are already orderd correctly, 
#so there is no need to worry about converting them to factors or adjusting factor levels.
#See the ggplot () histogram of onset dates shown below for an example.

#When plotting acolumn created with floor_date (), 
#you can use scale_x_date () to control how dates are displayed on the x-axis. 
#For more details, see the chapter on Epidemic curves (epicurves).

#In scale_x_date (), specify the desired display format using the date_labels = ardument in strptime format.
#As explained in detail in the chapter on Date data, strptime formats use the "%" symbol.
#For example "%Y" represents a four-digit year, 
#and "%W" or "%U" represent the week unmber (weeks starting on Monday or Sunday, respectively).
library (lubridate)
linelist11_7_1 <- linelist1 |>
  mutate (epiweek_date =floor_date (date_onset, "week")) |>
  ggplot ()+
  geom_histogram (mapping = aes (x = epiweek_date))+
  scale_x_date (date_labels = "%YW%W")
#Didn't work above cord
#


#Epidemiological week in the data
#To fine-tune the display format, first convert the epidemiological week column (YYY-MM-DD) created with lubridate in the data frame to the desired display format (YYYY-WWw), and then convert it to a factor variable.

linelist11_7_2 <- linelist1 |>
  mutate (epiweek_date = floor_date (date_onset, "week"),
          epiweek_formatted = format (epiweek_date, "%Y-W%W"),
          epiweek_formatted = factor (epiweek_formatted))

levels (linelist11_7_2$epiweek_formatted)


#To streamline the default display, you can use date2week () from the aweek packages.
#By specifying any weekday with week_start = and setting factor = TRUE, the output column becomes an orderd factor.
#In addition, all possible weeks within the period are included as factor levels, even if there are no cases in a given week.
install.packages ("aweek")
library (aweek)
df <- linelist11_7_2 |>
  mutate (epiweek = date2week (date_onset, week_start = "Monday", factor = TRUE))
levels (df$epiweek)

#11.8References
#~23:377





#This chapter isn't very useful, and it's not particularly interesting either.
#repeating this kind of thing just feels like pure drudgery.

