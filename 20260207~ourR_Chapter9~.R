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


SongSleep$DateD <- as.Date (SongSleep$Date)

SongSleep
ggplot2::ggplot (SongSleep, mapping = ggplot2::aes (x = DateD, y = Sleep))+
  ggplot2::geom_point () +
  ggplot2::labs (x = "DateD", y = "times (min")+
  ggplot2::theme_gray (base_size = 12)




SongSleep2 <- SongSleep [-3,]
SongSleep2
ggplot2::ggplot(SongSleep2, mapping = ggplot2::aes (x= Date, y = Sleep))+
  ggplot2::geom_point ()+
  ggplot2::labs (x = "date", y = "times (min)")+
  ggplot2::theme_gray (base_size = 12)



ggplot2::ggplot (SongSleep2, mapping = ggplot2::aes (x = DateD, y = Sleep))+
  ggplot2::geom_point ()+
  ggplot2::labs (x = "DateD", y = "Time (min)")+
  ggplot2::theme_gray (base_size = 12)






SongSleep3 <- SongSleep
SongSleep3$Sleep[SongSleep$Date == "2026-02-09"] <- NA
SongSleep3



ggplot2::ggplot (SongSleep3, mapping = ggplot2::aes (x = Date, y = Sleep))+
  ggplot2::geom_point ()+
  ggplot2::labs (x = "Date", y = "time (min)")+
  ggplot2::theme_bw ()

#~17:52
#1~
#9.7.2 How to create a Date object