#20260124 
#15:05~
#16 Loops, Iteration, and Working with Lists

#16.1 Preparation
install.packages ("pacman")
pacman::p_load (
  rio,
  here,
  purrr,
  grates,
  tidyverse
)
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds", "linelist_cleaned.rds")
linelist <- readRDS ("linelist_cleaned.rds")
#download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.xlsx", "linelist_cleaned.xlsx")
#install.packages ("openxlsx")
#library (openxlsx)
#linelist <- read.xlsx ("linelist_cleaned.xlsx")
head (linelist, 5)


#16.2 for loop
#for loop in R



#Core Components
for (num in c(1, 2, 3, 4, 5)) { # Define a sequence (numbers from 1 to 5) and start the loop with "{"
  print (num +2)                # Operation (add 2 to each number in the sequence and display the result)
}                               # End the loop with "}"

#Squences
#The basic structure of a sequence statement is: "item" in "vector"
#Create a vector for Hospital name

#Example: a sequence of character strings
hospital_names <- unique (linelist$hospital)
hospital_names

#"for" loop over a character sequence
for (hosp in hospital_names) { #Sequence
#Operation goes here
}
hosp

#Example: a sequence of columnnames
for (col in names (linelist)) {          # Loop over each column in the linelist: column names are represented by "col"
                                         # Example operation code; print the number of missing values in each column
  print (sum (is.na (linelist [[col]]))) # The value of "col" changes with each iteration of the loop, and line list is indexed according to the current value of "col"
} 

#Example: a sequence of numbers
for (i in 1:nrow (linelist)) { # Used with a data frame
#The operation code goes here
}
# *1:nrow (linelist) represents a sequence of consecutive numbers from 1 to the total number of rows in linelist.
i

seq_along (hospital_names) #Used with a named of vector


#Operations
#Create a container to store the results: a character vector
cases_demographics <- vector (mode = "character", length = nrow (linelist))
#for loop
for (i in 1:nrow (linelist)) {
#Operation
#Use square brackets as indices to extract the values from row i of linelist
row_gender <- linelist$gender [[i]]
row_age    <- linelist$age_years[[i]]  #Do not forget the index!
#Combine gender and age, and store them in the indexed position of the centainer vector
cases_demographics [[i]] <- str_c (row_gender, row_age, sep = ",")
}#End of loop
head (cases_demographics, 10)

#Containers
#Create an empty vector
delays <- vector (
  mode = "double", #Stpre numeroc data
  length = length (unique (linelist$hospital)) #Number of hospitals in the dataset
)
delays

#Create an empty data frame
delays2 <- data.frame (matrix (ncol = 2, nrow = 3))
delays2

#Create an empty list
plots <- vector (mode = "list", length = 16)
plots


#Displaying Results Without Using Containers
for (hosp in hospital_names) {
  hospital_cases <- linelist |> filter (hospital == hosp)
  print (nrow (hospital_cases))
}

#Verifying the Behavior of for Loops
#To chech whether a loop behavers as internded, temporarily assign an "item" such as i <- 10 or hosp <- "Centtal Hospital".
#Do this outside the loop, then run only the poeration code (the code inside the curly braces) to verify that it produces the expected result.

#Looping Over Plots
#Create the "icidence" object
#outbreak <- incidence2::incidence (
install.packages ("incidence2")
library (incidence2)
outbreak <- incidence (
  x = linelist,              #Specify the data frame (the entire linelist)
  date_index = "date_onset", #Date column
  interval = "week",         #Aggregate by week
  groups = "gender")         #Group by gender
 #na_as_group = T)           #Treat missing gender values as a separated (NA) group

#Plot the epidemic curve
ggplot (outbreak,             #Name of the incidence object
         aes (x = date_index, #Asethetics and axes
              y = count,
              fill = gender), #Fill colour of bars by gender
        color = "black"       #Contour colour of bars
       )+
  geom_col ()+
  facet_wrap (~gender)+
  theme_bw ()+
  labs (title = "Outbreak of all cases", #titre
        x = "Counts",
        y = "Date",
        fill = "Gender",
        color = "Gender"
  )

#Create a vector cotaining hospital names
hospital_names <- unique (linelist$hospital)
#For each hospital name ("hosp") in hospital_names, create and display an epidemic curve
for (hosp in hospital_names) {
     #For each iteration, create an incidence object for the current hospital
     outbreak_hosp <- incidence2::incidence (
       x = linelist |> filter (hospital == hosp), #Filter the linelist based on the hospital currently being iterated over
       date_index = "date_onset",
       interval = "week",
       groups = "gender" #,
       # na_as_group = T
     )

# Create and save the plot
#The title is automatically genderted based on the current hospital name
plot_hosp <- ggplot (outbreak_hosp, #incidence object name
                     aes (x = date_index, #axes
                          y = count,
                          fill = gender), #fill colour by gender
                     color = "black"      #colur of bar contour
                     )+
  geom_col ()+
  facet_wrap (~gender)+
  theme_bw ()+
  labs (title = stringr::str_glue ("Epidemic of cases admitted to {hosp}"), #title
        x = "Counts",
        y = "Date",
        fill = "Gender",
        color = "Gender")
#With older versions of R, remove the #before na_as_group and use this plot command instead.
#plot_hosp <- plot (
#outbreakhosp,
#file = "gender",
#color = "black",
#title = stringer::str_glue ("Epidemic of cases admitted to {hosp}")
#)

#Display the plot for the hospital currently being iterated over
print (plot_hosp)
} #hospital_names #End the for loop after all hospital names in hospital_names have been processed



#~16:38

#19:09~
#Monitoring Loop Progress
#Loop that displays progress every 100 iterations
for (i in seq_len (nrow (linelist))){
  #Print progress
  if (i %% 100 == 0){ #The %% operator represents the modulus (remainder)
    print (i)
}}


#16.3 purrr and Lists
pacman:: p_load (
  rio,
  here,
  tidyerse,
  writexl,
  readxl
)
#map ()
download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/example/hospital_linelists.xlsx", "hospital_linelists.xlsx")
#https://github.com/appliedepi/epiRhandbook_eng/raw/refs/heads/master/data/example/hospital_linelists.xlsx
install.packages ("openxlsx")
library (openxlsx)
sheet_names <- readxl::excel_sheets ("hospital_linelists.xlsx") 
sheet_names


#Splitting and Exporting Datasets
#Custom Functions
#Mapping Functions Across Multiple Columns
#Converting Lists to Data Frames
#Dropping, Keeping, and Compaction Lists

#16.4 The apply Family of Functions
#16.5 References