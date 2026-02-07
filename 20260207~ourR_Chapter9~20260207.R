#20260207 15:41~
#Data type
#9.1 What is data type?
#9.2 Logical
logical_vec1 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
logical_vec1


logical_vec2 <- c(TRUE, "FALSE", TRUE, TRUE, FALSE)
logical_vec2
class (logical_vec1)
class (logical_vec2)

is.logical (logical_vec1)
is.logical (logical_vec2)

#9.3Numeric
numeric_vec1 <- c(2, 0, 0, 1, 3)
class (numeric_vec1)

is.numeric (numeric_vec1)

is.numeric (logical_vec1)
typeof (numeric_vec1)
#All numeric vecters created by the user are of type duble.
#If you want to create an integer vector, you can append L to the number to explicitly declare it as an integer.
integer_vec1 <- c(2L, 0L, 0L, 1L, 3L)
typeof (integer_vec1)


integer_vec2 <- c(2L, 0L, 0, 1L, 3L)
typeof (integer_vec2)

typeof (2.00L)
typeof (2.03L)
typeof (3L/12L)
typeof (3L/11L)
typeof (3.0L + 1L)
typeof (3L - 4L)
typeof (3L * 6L)


#9.4 Complex
complex_vec1 <- c(1 + 3i, 3 + 2i, 2.5 + 7i)
typeof (complex_vec1)

complex_vec2 <- c(3i+1, 2i+3, 7i+2.5)
typeof (complex_vec2)

complex_vec1 == complex_vec2

complex_vec3 <- c(2+7i, 5, 13+1i)
complex_vec3

typeof (complex_vec3)
class (complex_vec3)


#9.5 Character
char_vec1 <- c("Shigemura", "Song", "Tani", "Yanai")
char_vec2 <- c(1, 2, 3, 4)
char_vec3 <- c("1", "2", "3", "4")
char_vec4 <- c(1, "2", 3, 4)
char_vec1
char_vec2
char_vec3
char_vec4
class (char_vec1)
class (char_vec2)
class (char_vec3)
class (char_vec4)


#9.6 Factor
factor_vec1 <- c("Excellent/Great", "Excellent/Great", "Doing okay", "Very fine", "Feeling good")
factor_vec1
class (factor_vec1)

factor_vec2 <- factor (factor_vec1, ordered = TRUE,
                       levels = c("Excellent/Great", "Doing okay", "Very fine", "Feeling good"))
class (factor_vec2)

factor_vec2[2] <- "Extreme fine"
factor_vec2

factor_vec2 [2] <- "Feeling good"
factor_vec2

factor_vec3 <- factor (factor_vec1, levels = c("Doing okay", "Feeling good", "Very fine", "Excellent/Great"))
factor_vec3
class (factor_vec3)

zaisei_df <- data.frame (
  ID = c(1, 2, 3, 4, 5),
  Pref = c("Hokkaido", "Tokyo", "Aichi", "Osaka", "Fukuoka"),
  Zaisei = c(0.44396, 1.19157, 0.92840, .78683, .64322)
  
)
zaisei_df

barplot (height = zaisei_df$Zaisei,
         names.arg = zaisei_df$Pref,
         xlab = "Prefecture",
         ylab = "Zaisei")

zaisei_df$Pref <- factor(zaisei_df$Pref, 
                         levels = c("Hokkaido", "Tokyo", "Aichi", "Osaka", "Fukuoka"))
barplot (height = zaisei_df$Zaisei,
         names.arg = zaisei_df$Pref,
         xlab = "Prefecture",
         ylab = "Zaisei")


#Since no logic was provided, i tried to use AI to evaluate the effect of applying a factor by creatin g histograms before and after factor application using base R, but it didn't work very well

zaisei_df2 <- data.frame (
  ID = c(1, 2, 3, 4, 5),
  Pref = c("Hokkaido", "Tokyo", "Aichi", "Osaka", "Fukuoka"),
  Zaisei = c(0.44396, 1.19157, 0.92840, .78683, .64322)
  
)
zaisei_df2
#??aes
#??labs
ggplot2::ggplot (zaisei_df2, ggplot2::aes (x = Pref, y = Zaisei))+
  ggplot2::geom_col ()+
  ggplot2::labs (
    x = "Prefecture",
    y = "Zaisei",
    title = "Zaisei by Prefecture"
  )
zaisei_df2$Pref <- factor(zaisei_df2$Pref, 
                         levels = c("Hokkaido", "Tokyo", "Aichi", "Osaka", "Fukuoka"))
ggplot2::ggplot (zaisei_df2, ggplot2::aes (x = Pref, y = Zaisei))+
  ggplot2::geom_col ()+
  ggplot2::labs (
    x = "Prefecture",
    y = "Zaisei",
    title = "Zaisei by Prefecture"
  )

#~17:14

#9.7 Data
#9.7.1 Why dose the Date type exist?
SongSleep <- data.frame (
  Date = c("2026-02-07", "2026-02-08", "2026-02-09", "2026-02-10",
           "2026-02-11", "2026-02-12", "2026-02-13"),
  Sleep = c(173, 193, 314, 259, 210, 214, 290)
)
SongSleep

ggplot2::ggplot (SongSleep, mapping = ggplot2::aes (x = Date, y = Sleep))+
  ggplot2::geom_point ()+
  ggplot2::labs (x = "date", y = "times (min)")+
  ggplot2::theme_gray (base_size = 12)

#We convert each value in the Date column to the Date type and store it as DateD in the SoongSleep dataset.
SongSleep$DateD <- as.Date (SongSleep$Date)
SongSleep
#When we look at the contents, there does not appear to be much difference.
#The Date and DateD columns look exactly the same.

ggplot2::ggplot (SongSleep, mapping = ggplot2::aes (x = DateD, y = Sleep))+
  ggplot2::geom_point () +
  ggplot2::labs (x = "DateD", y = "times (min")+
  ggplot2::theme_gray (base_size = 12)


#Suppose that Song accidentally forget to record the data on Feb 9.
#In other words, let's consider a situation where the third row of the SongSLeep dataset in missing.
SongSleep2 <- SongSleep [-3,]
SongSleep2
#When we look at the contents, they appear as shown below. Boh the Date and DateD columns look the same.

#In this state, we set the x-axis to Date
ggplot2::ggplot(SongSleep2, mapping = ggplot2::aes (x= Date, y = Sleep))+
  ggplot2::geom_point ()+
  ggplot2::labs (x = "date", y = "times (min)")+
  ggplot2::theme_gray (base_size = 12)


#Nex in this state, we set the x-axis to DateD
ggplot2::ggplot (SongSleep2, mapping = ggplot2::aes (x = DateD, y = Sleep))+
  ggplot2::geom_point ()+
  ggplot2::labs (x = "DateD", y = "Time (min)")+
  ggplot2::theme_gray (base_size = 12)





#If the data are not of the Date type, values that are not present in the data will not be shown in the plot.
#In contrast, when using the Date type, missing days are displayed in the plot even if there are gaps in the data.
#To reproduce this behavior with a regular character or factor type, 
#it is necessary to add rows for the missing dates and specify the sleep duration as missing values.
#For example, in the SongSleep dataset, let's keep the row for the missing dates and set only the sleep duration to missing values

SongSleep3 <- SongSleep
SongSleep3$Sleep[SongSleep$Date == "2026-02-09"] <- NA
SongSleep3



ggplot2::ggplot (SongSleep3, mapping = ggplot2::aes (x = Date, y = Sleep))+
  ggplot2::geom_point ()+
  ggplot2::labs (x = "Date", y = "time (min)")+
  ggplot2::theme_bw ()

#~17:52
#18:13~
#9.7.2 How to create a Date object
  #1.character type to Date type
  #2.numeric type to Date type
Date1 <- "2026-02-07"
Date2 <- "2026-2-07"
Date3 <- "2026/2/7"
Date4 <- "26/02/07"
Date5 <- "20260207"
Date6 <- "2026 02 07"
Date7 <- "2026.02.07"
as.Date (Date1)
as.Date (Date2)
as.Date (Date3)
as.Date (Date4)
as.Date (Date4, "%y/%m/%d")
#as.Date (Date5)
as.Date (Date5, "%y/%m/%d")
as.Date (Date5, "%y%m%d")
as.Date (Date5, "%Y%m%d")
#as.Date (Date6)
as.Date (Date6, "%y/%m/%d")
as.Date (Date6, "%Y %m %d")
#as.Date (Date7)
as.Date (Date7, "%y/%m/%d")
as.Date (Date7, "%y.%m.%d")
as.Date (Date7, "%Y.%m.%d")


as.Date ("7Feb2026", format = "%d%b%Y")
as.Date ("Feb/07/2026", format = "%b/%d/%Y")

Sys.getlocale (category = "LC_TIME")
Sys.setlocale (category = "LC_TIME", local = "C")
as.Date ("07Feb2026", format = "%d%b%Y")
as.Date ("Feb/07/2026", format = "%b/%d/%Y")
Sys.setlocale (category = "LC_TIME", locale = "ja_JP.UTF-8")
#In the first place, RStudio runnning on Binder dose not use ja_JP.UTF-8, 
#and it cannot be reconfigured to ja_JP.UTF-8, can it?


#9.7.3 POSIXct, POSIXlt type
#The POSIXct and POSIXlt types are data types that include not only date information but also time information.
#They can be created using the as.POSIXct () and as.POSIXlt () functions.
#Although they loog the same, their internal structures are different.
#For details, see ?as.POSIXct or ?as.POSIXlt.

#~18:37

#19:45~
#9.8 NA
na_vec1 <- c(1, NA, 3, NA ,5, 6)
na_vec1
class (na_vec1)
is.na (na_vec1)

length (na_vec1)


#Handling missing values
na_vec1 +1
na_vec1

sum (na_vec1)
na_vec1 [!is.na (na_vec1)]
sum (na_vec1 [!is.na (na_vec1)])

sum (na_vec1, na.rm = T)


#How to use missing values

result_vec1 <- 1
result_vec1 <- c(result_vec1, 2)
result_vec1
result_vec1 <- c(result_vec1, 3)
result_vec1 <- c(result_vec1, 4)
result_vec1 <- c(result_vec1, 5)
result_vec1 <- c(result_vec1, 6)
result_vec1 <- c(result_vec1, 7)
result_vec1 <- c(result_vec1, 8)
result_vec1 <- c(result_vec1, 9)
result_vec1 <- c(result_vec1, 10)
result_vec1

result_vec2 <- rep (NA, 10)
result_vec2
result_vec2 [1] <- 1
result_vec2 [2] <- 2
result_vec2 [3] <- 3
result_vec2 [4] <- 4
result_vec2 [5] <- 5
result_vec2
result_vec2 [6] <- 6
result_vec2 [7] <- 7
result_vec2 [8] <- 8
result_vec2 [9] <- 9
result_vec2 [10] <- 10
result_vec2


# method1
result_vec01 <- 1
for (i in 2:10) {
  result_vec01 <- c(result_vec01, i)
}
# method2
result_vec02 <- rep (NA, 10)
for (i in 1:10) {
  result_vec02 [i] <- i
}

result_vec01
result_vec02


#9.9 NULL

null_vec1 <- c(1, 3, NULL, 5, 10)
null_vec1

length (null_vec1)



class (null_vec1)

is.null (null_vec1)

null_list1 <- list (Room1 = 1:3,
                    Room2 = c("Yuki", "Jeahyun", "Hadley"),
                    Room3 = NULL)
null_list1
is.null (null_list1 [["Room3"]])


#9.10 NaN
#NaN represents a value that cannot be calculated.

nan_vec1 <- c(2/5, 0/12, 0/0)
nan_vec1

class (nan_vec1)
is.nan (nan_vec1)


#9.11 Inf
# That means infinity
inf_vec1 <- c(28/95, 3/0, -12/0, 0/0)
inf_vec1
class (inf_vec1)
is.infinite (inf_vec1)


#~20:06