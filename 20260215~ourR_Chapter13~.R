#title and subtitle~16:45
#20260215 16:51~

#13 Data Handling [Extract]
#13.1 Data Handling and tidyverse
library (tidyverse)
#13.2 The Pipe Operater (|>)
Result1 <- paste (3, "+", 5, "=", 8)
print (Result1)
Result2 <- rep (Result1, 3)
print (Result2)

paste (3, "+", 5, "=", 8) %>% rep (3) %>% print ()

paste (3, "+", 5, "=", 8) |> 
  rep (3) |> 
  print ()

#no pipe
# Result1 <- function1 (data) 
# Result2 <- function2 (data1) 
# Result <- function3 (data2) 

# Result <- function3 (unction2 (function1 (data))) 

#pipe
# Result <- data |>
#  function1 () |>
#  function2 ()
#  function3 ()

#13.3 Selecting columns
download.file ("https://www.jaysong.net/RBook/Data/Ramen.csv", "Ramen.csv")
df <- read.csv ("Ramen.csv")
head (df, 10)

#13.3.1 Selecting Specific columns
head (df [,c("ID", "Name", "Pref", "Score")], 10)



df2 <- df |>
  select (ID, Name, Pref, Score)
head (df2, 10)

df3 <- df |>
  select (ID, Pref, Name)
head (df3,10)


#13.3.2 Selecting Specific columns and Renaming Them
df4 <- df |>
  select (ID, Name, Prefecture = Pref, Score)
head (df4, 10)
names (df4)

#Other method (Don't use dplyr)
df5 <- df
names (df5) [c(3, 9)] <- c("Prefecture", "Distance")
df5
names (df5)

#Other method (use dplyr)
names (df)

#install.packages ("dplyr")
df6 <- df |>
#  dplyr::rename (Pref = Prefecture, Walk = Distance)
#  dplyr::rename (Prefecture = Pref, Distance = Walk)
  rename (Prefecture = Pref, Distance = Walk)
names (df6)


#13.3.3 Excluding Specific columns
df7 <- df |>
  select (ID, Name, Pref, Zipcode, Line, Station, Walk, Bus, Car, Budget, ScoreN, Score)
names (df7)


df8 <- df |>
  select (-Latitude, -Longitude)
names (df8)

#13.3.4 Selecting Adjacent columns
df9 <- df |>
  select (ID, Name, Pref, Zipcode,
          Line, Station, Walk, Bus, Car, Budget, ScoreN, Score)
names (df9)
df10 <- df |>
  select (ID:Zipcode, Line:Score)
names (df10)


#13.3.5 Reordering Only Certain columns
df11 <- df |>
  select (Score, ScoreN, ID:Budget)
names (df11)
names (df)

# The {dplyr} package provides a convenient dedicated function called relocate ().
# With relocate (), you simply specify the variable name, and the specified variable is moved toward the beginning (left side) of the data frame.
df12 <- df |>
  relocate (Score, ScoreN)
names (df12)


# Abitger exanoke us a case wgerem ubstead of movng a variable to the beginning, we move it "before" or "after" a specific variable.
#This can also be done using relocate (), but it requires an additional argument.
#If we want to change the order of Pref and Zipcode, one possible approach would be as follows:
df13 <- df |>
  select (ID:Name, Zipcode, Pref, Latitude:Score)
names (df)
names (df13)

# To rewrite this using relocate (), we need to use either the .after or .before argument.
#relocate (variable1, .after = variable2) means "move variable1 immediately after variable2."
df14 <- df |>
  relocate (Pref, .after = Zipcode)
names (df)
names (df14)

#We can also use .before In this case, we would specify that Zipcode should be moved immediately before Pref.
df15 <- df |>
  relocate (Zipcode, .before = Pref)
names (df)
names (df15)



#13.3.6 Useful Features of select ()
  # starts_with (), ends_with(), contains(), num_range()
df16 <- df |>
  select (ID, Name, starts_with ("Score"))
names (df)
names (df16)

df17 <- df |>
  select (-ends_with ("e"))
names (df)
names (df17)

df18 <- df |>
  select (contains ("re"), -ScoreN)
names (df)
names (df18)


myDF1 <- tibble (
  ID  = 1:5,
  X1  = c(2, 4, 6, 2, 7),
  Y1  = c(3, 5, 1, 1, 0),
  X1D = c(4, 2, 1, 6, 9),
  X2  = c(5, 5, 6, 0, 2),
  Y2  = c(3, 3, 2, 3, 1),
  X2D = c(8, 9, 5, 0, 1),
  X3  = c(3, 0, 3, 0, 2),
  Y3  = c(1, 5, 9, 1, 3),
  X3D = c(9, 1, 3, 3, 8),
)

myDF2 <- myDF1 |>
  select (ID, starts_with ("X"), -ends_with ("D"))
names (myDF2)


myDF3 <- myDF1 |>
  select (ID, num_range ("X", 1:3))
names (myDF3)



  # all_of () and any_of ()
Name_Vec <- c("X1", "X2", "X3")
myDF1 [, c("ID", Name_Vec)]


myDF4 <- myDF1 |>
  select (ID, all_of (Name_Vec))
names (myDF1)
names (myDF4)


Name_Vec2 <- c("X1", "X2", "X3", "X4", "X5")
myDF5 <- myDF1 |>
  select (all_of (Name_Vec2))
#Error in `all_of()`:
#  ! Can't subset columns that don't exist.
#✖ Columns `X4` and `X5` don't exist.
#Run `rlang::last_trace()` to see where the error occurred.  

myDF6 <- myDF1 |>
  select (any_of (Name_Vec2))
names (myDF1)
names (myDF6)

# last_col ()
df19 <- df |>
  select (ID, last_col (0))
names (df)
names (df19)

df20 <- df |>
  select (ID, last_col (1))
names (df)
names (df20)

  # where ()
df21 <- df |>
  select (where (is.numeric))
names (df)
names (df21)

df22 <- df |>
  select (where (is.character))
names (df)
names (df22)




df22 <- df |>
  select (ID, starts_with ("L") & where (is.numeric))
names (df)
names (df22)
#~17:54




#13.4 Selecting Rows
#13.4.1 Selecting Specific Rows

  # slice ()
  # sline_head ()
  # sline_tail ()
  # sline_max ()
  # sline_min ()
  # sline_sample ()

#13.4.2 Selecting Rows That Meet Certain Conditions



#13.5 Sorting rows
