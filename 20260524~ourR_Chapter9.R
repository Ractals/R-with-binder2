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