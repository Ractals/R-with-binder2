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
#we can include multiple pairs of curly braces 
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


