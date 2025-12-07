#20251207
#18:43~

#chapter10 character data

#10.1 preparation

#install packages
install.packages ("rio")
library (rio)
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
linelist <- readRDS ("linelist_cleaned.rds")
linelist0 <- linelist

head (linelist)

#10.2 join/split/array


#jointing strings
#??stringr
install.packages ("stringr")
library (stringr)
str_c ("String1", "String2", "String3")


str_c("String1", "String2", "String3", sep = ", ")


first_names <- c("abdul", "fahruk", "janice")
last_names <- c("hussein", "akinleye", "okeke")
first_names
last_names
str_c (first_names, last_names, sep = " ", collapse = "; ")


cat (str_c (first_names, last_names, sep = " ", collapse = "; \n"))


##################
# sep collapse  #
##################


#dtbanuc string
str_glue ("Data include {nrow (linelist)} cases and are current to {format (Sys.Date (), '%d %b %Y')}.")
#####################################
# References to dynamic code or predefined values are placed
#inside curly braces ｛｝within double quotes. 
#you can include multiple pairs of curly braces 
#in a single str_glue () command. 
#####################################
names (linelist)

str_glue ("Linelist as of {current_date}.\nLast case hospitalized on {last_hospital}.\n{n_missing_onset} cases are missing date of onset and not shown",
          current_date = format (Sys.Date (), '%d %b %Y'),
          last_hospital = format (as.Date (max (linelist$date_hospitalisation, na.rm = T)), '%d %b %Y'),
          n_missing_onset = nrow (linelist |> filter (is.na (date_onset)))
)
#I can't run it - it shows "Error: object 'date_onset' not fount."
#I don't get it. date_onset definitely exists as a variable, 
#but is it supposed to be an object?


#Extracting from a data frame
install.packages ("tidyverse")
library ("tidyverse")
case_table <- tibble (
  zone = c("Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5"),
  new_cases = c(3, 0, 7, 0, 15),
  total_cases = c(40, 4, 25, 10, 103)
)
case_table

case_table |>
  str_glue_data ("{zone}: {new_cases} ({total_cases} total cases)")


#Concatenate strings from different rows
str_c (case_table$zone, case_table$new_cases, sep = " = ", collapse = "; ")

#By wrapping the previously written str_c () with another str_c (), 
#you can add the string "New Cases:" to the beginning of the sentence. 
#(If "New Cases;" were inside the original str_c (), 
#it would be displayed multiple times.)

str_c ("New Cases: ", str_c (case_table$zone, case_table$new_cases, sep = " = ", collapse = "; "))



#mergeing columns
df <- tibble (
  case_ID = c(1:6),
  symptoms = c("jaundice, fever, chills",  #patient No.1
               "chills, aches, pains",     #patinet No.2
               "fever",                      #patient No.3
               "vomiting, diarrhooea",      #patient No.4
               "bleeding from gums, fever", #patient No.5
               "rapid pulse, headache"     #patient No.6
  ),
  outcom = c("Recover", "Death", "Death", "Recover", "Recover", "Recover")
)

df
#??separate
install.packages("tidyr")
library(tidyr)
separate

df_split <- separate (df, symptoms, into = c("sym_1", "sym_2", "sym_3"), extra = "merge")
df_split


#below as to avoid the warning
df_split <- separate (
  df, symptoms, into = c("sym_1", "sym_2", "sym_3"), 
  extra = "merge", 
  fill = "right" # to avoid the warning: fill the missing values with NA on the right
)
df_split


#split

str_split (string = "jaundice, fever, chills", pattern = ",")


pt1_symptoms <- str_split ("jaundice, fever, chills", ",")
pt1_symptoms [[1]][2] #Return the second value inside the first (and in this case, only) element of the list
#In the example above, since it is a list, the first (and in this case, the only) element is essentially the first object.



#When multiple strings are supplied to str_split (), the resulting list contains multiple elements.
symptoms <- c("jaundice, fever, chills", 
              "chills, aches, pains",
              "fever",
              "vomiting diarrhoea",
              "bleeding from gums, fever",
              "rapid, pulse, headache")
str_split (symptoms, ",") #Split the symptoms for each patient



#If you want to later convert the output into data frame columns,
#it is useful to set simplify = TRUE, which outputs a character matrix.
str_split (symptoms, ",", simplify = TRUE)

#You can also use n = to control the number of splits. For example, the following example limits the number of splits to 2,
#and any additional commas remain inside the second value.
str_split (symptoms, ",", simplify = TRUE, n = 2)


#なんかcmmiteもできないし、
#実行もできなくなったからここまで#だな。
#毎回commiteしないとプログラムの安全を確保できないう#えに、
#こうも不安定だと使い物にならないね。
#～20:49