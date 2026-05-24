#20260207
#24:01~

#9.1 data type

#9.2Lobical



logical_vec1 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
logical_vec1

logical_vec2 <- c(TRUE, "FALSE", TRUE, TRUE, FALSE)
logical_vec2

class (logical_vec1)
class (logical_vec2)

is.logical (logical_vec2)

#9.3 Numeric

numeric_vec1 <- c(2, 0, 0, 1, 3)
class (numeric_vec1)


is.numeric (numeric_vec1)
is.numeric (logical_vec1)

typeof (numeric_vec1)


integer_vec1 <- c(2L, 0L, 0L, 1L, 3L)
typeof (integer_vec1)

integer_vec2 <- c(2L, 0L, 0, 1L, 3L)
typeof (integer_vec2)


typeof (2.00L)
typeof (2.03L)
typeof (3L/12L)
typeof (3L/1L)
typeof (3.0L+1L)
typeof (3L-4L)
typeof (3L*6L)


#9.4 Complex
complex_vec1 <- c(1+3i, 3+2i, 2.5+7i)
complex_vec1
class (complex_vec1)

complex_vec2 <- c(3i+1, 2i+3, 7i+2.5)
complex_vec2
class (complex_vec2)

complex_vec1 == complex_vec2

complex_vec3 <- c(2+7i, 5, 13+1i)
complex_vec3
class (complex_vec3)




#9.5 Character
char_vec1 <- c("Shigemura", "Song", "Tani", "Yanai")
char_vec2 <- c(1, 2, 3, 4)
char_vec3 <- c("1", "2", "3","4")
char_vec4 <- c(1, "2", 3, 4)
char_vec1
char_vec2
char_vec3
char_vec4
class (char_vec1)
class (char_vec2)
class (char_vec3)
class (char_vec4)



#9.6 Facter
factor_vec1 <- c("I absolutely love it.", "I absolutely love it.",
                 "I somewhat line it.", 
                 "I really line it.", 
                 "I like it")
class (factor_vec1)

factor_vec2 <- factor (factor_vec1, ordered = TRUE, 
                       levels = c(
                                  "I somewhat line it.", 
                                  "I like it",
                                  "I really line it.", 
                                  "I absolutely love it."
                                  )
                       )
class (factor_vec2)

factor_vec2
factor_vec2[2] <- "I’m super into it."
factor_vec2

factor_vec2[2] <- "I like it"
factor_vec2


factor_vec3 <- factor (factor_vec1,
                       levels = c(
                                   "I somewhat line it.", 
                                   "I like it",
                                   "I really line it.", 
                                   "I absolutely love it."
                                  )
                       )
factor_vec3

class (factor_vec3)

#from 20260207 (copy)
zaisei_df <- data.frame (
                          ID = c(1, 2, 3, 4, 5),
                          Pref = c("Hokkaido", "Tokyo", "Aichi", "Osaka", "Fukuoka"),
                          Zaisei = c(0.44396, 1.19157, 0.92840, .78683, .64322)
                        )

barplot (height = zaisei_df$Zaisei,
         names.arg = zaisei_df$Pref,
         xlab = "Prefecture",
         ylab = "Zaisei")

zaisei_df$Pref <- factor (zaisei_df$Pref,
                          levels = c("Hokkaido", "Tokyo", "Aichi", "Osaka", "Fukuoka"))



barplot (height = zaisei_df$Zaisei,
         names.arg = zaisei_df$Pref,
         xlab = "Prefecture",
         ylab = "Zaisei")


#9.7 Date
#9.7.1
SongSleep <- data.frame (Date = c("2017-06-17", "2017-06-18", "2017-06-19", "2017-06-20",
                                  "2017-06-21", "2017-06-22", "2017-06-23"),
                         Sleep = c(173, 192, 314, 259, 210, 214, 290)
                         )
SongSleep

library (ggplot2)
ggplot (SongSleep,
        mapping = aes (x = Date, y = Sleep))+
  geom_point ()+
  labs (x = "Date", y = "time (min)")+
  theme_gray (base_size = 12)
  
SongSleep$DateD <- as.Date (SongSleep$Date)
SongSleep

ggplot (SongSleep,
        mapping =aes (x = DateD, y = Sleep))+
  geom_point ()+
  labs (x = "Date", y = "Time (min)")+
  theme_gray (base_size = 12)


SongSleep2 <- SongSleep [-3,]
SongSleep2


ggplot (SongSleep2,
        mapping = aes (x = Date, y = Sleep))+
  geom_point ()+
  labs (x = "Date", y = " Time (min")+
  theme_gray (base_size = 12)

SongSleep3 <- SongSleep
SongSleep3$Sleep [SongSleep$Date == "2017-06-19"] <-NA
SongSleep3

ggplot (SongSleep3,
        mapping = aes (x= Date, y = Sleep))+
  geom_point ()+
  labs (x = "Date", y= "Time (min)")+
  theme_bw ()



#9.7.2
#20260524
Date1 <- "2026-05-24"
Date2 <- "2026-5-24"
Date3 <- "2026/5/24"
Date4 <- "26/05/24"
Date5 <- "20260524"
Date6 <- "2026 05 24"
Date7 <- "2026.05.24"


as.Date (Date1)
as.Date (Date2)
as.Date (Date3)
as.Date (Date4, "%y/%m/%d")
as.Date (Date5, "%Y%m%d")
as.Date (Date6, "%Y %m %d")
Date6_2 <- Date6
as.Date (Date6_2, "%y %m %d")
as.Date (Date7, "%Y.%m.%d")


as.Date ("25may2026", format = "%d%b%Y")
as.Date ("May/24/2026", format = "%b/%d/%Y")
Sys.getlocale (category = "LC_TIME")
Sys.setlocale (category = "LC_TIME", locale = "C")
as.Date ("25may2026", format = "%d%b%Y")
as.Date ("May/24/2026", format = "%b/%d/%Y")
Sys.setlocale (category = "LC_TIME", locale = "ja_JP.UTF-8")
Sys.setlocale (category = "LC_TIME", locale = "en_US.UTF-8")


#9.7.3 POSIXct, POSIXlt

#9.8 NA
na_vec1 <- c(1, NA, 3, NA, 5, 6)
na_vec1

class (na_vec1)

is.na (na_vec1)

length (na_vec1)

na_vec1 +1
sum (na_vec1)

na_vec1 [is.na (na_vec1)]
na_vec1 [!is.na (na_vec1)]

sum (na_vec1 [!is.na (na_vec1)])

sum (na_vec1, na.rm = TRUE)

result_vec2      <- rep (NA, 10)
result_vec2 [1]  <- 1
result_vec2 [2]  <- 2
result_vec2 [3]  <- 3
result_vec2 [4]  <- 4
result_vec2 [5]  <- 5
result_vec2 [6]  <- 6
result_vec2 [7]  <- 7
result_vec2 [8]  <- 8
result_vec2 [9]  <- 9
result_vec2 [10] <- 10
result_vec2



result_vec1 <- 1
for (i in 2:10) {
  result_vec1 <- c (result_vec1, i)
}
result_vec1

result_vec2 <- rep (NA, 10)
for (i in 1:10) {
  result_vec2 [i] <- i
}
result_vec2




#9.9 NULL
null_vec1 <- c(1, 3, NULL, 5, 10)
null_vec1
length (null_vec1)

class (null_vec1)
is.null (null_vec1)


null_list <- list (Room1 = 1:3,
                   Room2 = c("Yuki", "Jaehyun", "Hadley"),
                   Room3 = NULL)
null_list


is.null (null_list [["Room3"]])


#9.10 NaN

nan_vec1 <- c(2/5, 0/12, 0/0)
nan_vec1
class (nan_vec1)
is.nan (nan_vec1)


#9.11 Inf
inf_vec1 <- c(28/95, 3/0, -12/0, 0/0)
inf_vec1
class (inf_vec1)
is.infinite (inf_vec1)


#20260524 ~24:01





