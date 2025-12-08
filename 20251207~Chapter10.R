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

#24:53時間のいたら解決したけど、やはり不安定だな。

#column split
#・spe = Specifies the position to split, either as a character of a number.
#・remove = Defaults to FALSE. Determines whether the input column is removed.
#・convert = Defaults to FALSE. Converts the string "NA" to NA.
#・extra = Controls the behavior when the number of values produced by the split exceeds the number of new columns specified.
#〇extra = "warn" displays a warning and drops the extra values (default).
#〇extra ="drop" drops the extra values without displaying a warning.
#〇extra = "merge" splits only up to the number of new columns specified by into. "ith this setting, all input data are preserved.

#Below is an example uing extra = "merge" (no data is lost here).
#Two new columns are defined, and the third symptom is placed into the second column.

#The third symptom is merged into the second new column
install.packages ("dplyr")
library (dplyr)

df |>
  separate (symptoms, into = c("sym_1", "sym_2"), sep = ",",  extra = "merge")


#If the default extra = "drop" is used, a warning will be displayed as shown below.
#The third symptom is lost

df |>
  separate(symptoms, into = c("sym_1", "sym_2"), sep = ",")


#sort in alphabetical order
health_zones <- c("Alba", "Takota", "Delta")
#str_order
#Return in alphabetical order
str_order (health_zones)


#sort in alphabetical order
str_sort (health_zones)


#base R functions

n_beds <- 10
n_masks <- 20
paste0 ("Regional hospital needs ", n_beds, " beds and ", n_masks, "masks.")
#~25:21


#Next time, i will start from 10.3: Organization and Standardization





#20251208 23:31~
#10.3 Tidying and standardizing
library (stringr)
str_to_upper ("California")


str_to_lower ("California")


#base_R fanctions
toupper ("California")
tolower ("California")

str_to_title ("go to the US state of california")


tools::toTitleCase ("This os tje IS state of california")


str_to_sentence ("the patient must be transported")


#Extend a string
ICD_codes <- c("R10.13", "R10.819", "R17")
ICD_codes

#"ICD codes padded on the right with spaces to ensure a minimum width of 7 characters
str_pad (ICD_codes, 7, "right")
#??str_pad


stringr::str_pad (ICD_codes, 7, "right")


#Extend the strings by padding with periods instead of spaces.
str_pad (ICD_codes, 7, "right", pad = ".")

#Pad with leading zeros to make it two digits (e.g., for hour or minute display).
str_pad("4", 2, pad = "0")







#Shorten a string
original <- "Symptom onset on 4/3/2020 with vomiting"
str_trunc (original, 10, "center")


#Standardizing string length
ICD_codes <- c("R10.13", "R10.819", "R17")
#Shorten strings so that the maximum length is 6.
ICD_codes2 <- str_trunc (ICD_codes, 6)
ICD_codes2


#Pad the strings so that their minimum length is 6.
ICD_codes_3 <- str_pad (ICD_codes2, 6, "right")
ICD_codes_3


#Remove leading and trailing whitespace
IDs <- c("provA_1852  ", #two space
        "provA_2325"  , #no space
        "provA_9460 "   #one space
        )
str_trim (IDs)


#Remove repeated whitespace

str_squish ("  Pt requires   IV saline\n")


#Wrap text at a specified character width
pt_course <- "Symptom onset 1/4/2020 omitting chills fever. Pt saw traditional healer in home village on 2/4/2020. On 5/4/2020 pt symptoms worsened and was admitted to Lumta clinic. Sample was taken and pt was transported to regional hospital on 6/4/2020. Pt died at regional hospital on 7/4/2020."
str_wrap (pt_course, 40)


#By passing the above command to base R's cat (), you can display the text with line breaks applied.
cat (str_wrap (pt_course, 40))


#~24:03
#next time, i will restart from 10.5:Operations based on position

