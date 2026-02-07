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

