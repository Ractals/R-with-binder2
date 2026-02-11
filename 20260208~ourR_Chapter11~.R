#20260208 16:22~
#11 Basics of R programing
#11.1 Basic concepts of the R language
#11.1.1 Objects
my_vec1 <- c(1, 2, 3, 4, 5)
my_vec1*2

#11.1.2 Class
class  (my_vec1)
class ("*")
class ('*')
#class (*)
class (merge)
class (2)
class (class)


#11.1.3 Functions and arguments
my_vec2 <- c(1, 2, 3, NA, 5)

sum (my_vec2, na.rm = T)


#11.2 R coding style
#11.2.1 Object name
var1 <- c(2, 3, 5, 7, 11) #recomended
変数1 <- c(2, 3, 5, 7, 11) #not recomended
var1
変数1

#100A <- "R"
#ERROR1
#Error: unexpected symbol in "100A"

#Avoid reserved words
pi

pi <- 777

pi

base::pi


#if <- "YY"
#ERROR2
#Error: unexpected assignment in "if <-"

#for <- "JS"
#ERROR3
#Error: unexpected assignment in "for <-"

#TRUE <- "Always one!"
#ERROR4
#Error in TRUE <- "Always one!" : 
#invalid (do_set) left-hand side to assignment


#Please not that something like the following code can happen.
vals <- 1:5
vals [c(TRUE, TRUE, FALSE, FALSE, TRUE)]

#vals[c(T, T, F, F, T)]
#ERROR5
#> vals[c(T, T, F, F, T)]
#Error in vals[c(T, T, F, F, T)] : 
#  only 0's may be mixed with negative subscripts

T <- "Taylor"
F <- "Fourier"
vals [c(T, T, F, F, T)]
#Thus, although T and F are available by default, they are not reserved words and can be reassigned.
#However, using T and F as names for user-defined objects can cause confusing, so it is safer to avoid using them.
#In addition, the bad habit of using T or F instead of TRUE and FALSE should be abandoned; they should always be spelled out in full.

#Emphasize brevity and clarity
#Object names should be chosen so that the type of data they contain can be inferred from the name alone.
#For example, if you are creating a variable to represent gender,
var2 <- c("female", "male", "male", "female")
#it is better to write:
gender <- c("female", "male", "male", "female")


#Others
mathematicsscore <- c(30, 91, 43, 77, 100)
#it is better to write:
MathScore <- c(30, 91, 43, 77, 100)
#or
mathScore <- c(30, 91, 43, 77, 100)
#or
math_score <- c(30, 91, 43, 77, 100)

#11.2.2 Line breaks
#11.2.3 Spaces and indentation
#Good example
data.frame (
  name     = c("Song", "Yanai", "Wickham"),
  favorite = c("Ramen", "Cat",  "R"),
  gender   = c("Male",  "Male", "Male")
)
#Bad example
data.frame (
  name = c("Song", "Yanai", "Hadley"),
  favorite = c("Ramen", "Cat","R"),
  gender = c("Male", "Male", "Male")
)


#An evil example
data.frame (name = c("Song", "Yanai", "Hadley"), favorite = c("Ramen", "Cat","R"), gender = c("Male", "Male", "Male"))

#Good example
data.frame (
  name     = c("Song", "Yanai", "Wickham"),
  favorite = c("Ramen", "Cat",  "R"),
  gender   = c("Male",  "Male", "Male")
)

#Bad example
data.frame (
  name     = c("Song", "Yanai", "Wickham"),
  favorite = c("Ramen", "Cat",  "R"),
  gender   = c("Male",  "Male", "Male")
)

#11.2.4 Assignment





#11.3 Iteration
#11.3.1 Iteration using for
#  for (any?variable in vector) {
#  processing
#  }

for (i in 1:5) {
  print (1)
}
#of  
for (i in 1:5) print (1)



vals <- c(24, 64, 31, 46, 81, 102)
for (incom in vals) {
  x <- paste0 ("I got ", incom, " yen")
  print (x)
}

paste0 ("R is", "scripting", "language.")
paste0 ("My", "annual incom", 375, "/ year")
cities <- c("Sapporo", "Sendai", "Tokyo", "Yokohama", "Nagoya",
            "Kyoto", "Osaka", "Kobe", "Hiroshima", "Fukuoka")
for (i in seq_along (cities)) {
  x <- paste0 ("Now, city price is ", cities[i])
  print (x)
}

for (city in cities){
  x <- paste0 ("Now, city price is ", city)
  print (x)
}

for (i in seq_along (cities)) {
  msg <- paste0 ("Number if ", i, "city is", cities[i])
  print (msg)
}

#~17:23
#18:11~
#Nested for loops
for (i in 1:9) {
  for (j in 1:9) {
    print (paste (i, "*", j, "=", i*j))
  }
}


for (i in 9:1) {
  for (j in 1:9) {
    print (paste (i, "*", j, "=", i*j))
  }
}

for (i in 1:9) {
  for (j in i:9) {
    print (paste (i, "*", j, "=", i*j))
  }
}

for (i in 9:1) {
  for (j in i:9) {
    print (paste (i, "*", j, "=", i*j))
  }
}

#Load the {tidyverse} package to use read_csv ()
install.packages ("pacman")
pacman::p_load (tidyverse)
#Read FIFA_Men.csv and store it as my_df
download.file ("https://www.jaysong.net/RBook/Data/FIFA_Men.csv", "FIFA_Men.csv")
#??read_csv
#read_csv
my_df <- readr::read_csv ("FIFA_Men.csv")
#Extract only the rows where the Confederation column of my_df is OFC
my_df <- my_df [my_df$Confederation == "OFC",]
my_df

for (i in 1:nrow (my_df)) {
  print (paste0 ("=====", i, " Team information for the nth entry ===="))
  for (j in c ("Team", "Rank", "Points")) {
    print (paste0 (j,": ", my_df [i,j]))
  }
}

for (i in 1:nrow (my_df)){
  print (paste0 ("=====", i, " Team information for the nth entry ===="))
  for (j in c("Team", "Confederation", "Rank", "Points")) {
    print (paste0 (j, ": ", my_df[i, j]))
  }
}

#Incidentally, the same result can be achieved using a single for loop as follows.
for (i in 1:nrow (my_df)) {
  print (paste0 ("=====", i, " Team information for the nth entry ====\n"))
  cat (paste0 ("Team:",   my_df$Team[i],   "\n",
               "Rank:",   my_df$Rank[i],   "\n",
               "Points:", my_df$Points[i], "\n"))
}

for (i in 1:nrow (my_df)) {
  print (paste0 ("=====", i, " Team information for the nth entry ====\n"))
  cat (paste0 ("Team:",           my_df$Team[i],            "\n",
               "Confederation",   my_df$Confederation[i],   "\n",
               "Rank:",           my_df$Rank[i],            "\n",
               "Points:",         my_df$Points[i],          "\n"))
}


my_list <- list (A = c("Song", "Wickham", "Yanai"),
                 B = c("Watanabe", "Toyoshima", "Fujii"),
                 C = c("Abe", "Moon", "Xi"))

my_list

for (i in 1:3) {
  for (j in names (my_list)) {
    print (my_list [[j]][i])
  }
  print (paste0 ("=== Up to here is the work of the student with attendance number", i, "==="))
}

my_list2 <- list (c("Spng", "Wickham", "Yanai"),
                 c("Watanabe", "Toyoshima", "Fujii"),
                 c("Abe", "Moon", "Xi"))
my_list2

for (i in 1:3) {
  for (j in seq_along (my_list)) {
    print (my_list [[j]][i])
  }
  print (paste0 ("=== Up to here is the work of the student with attendance number", i, "==="))
}

#~19:17
#??cat
cat("Hello", "World")
print("Hello")
cat("Hello")
cat("Hello\n")

paste("A", "B")
# "A B"

paste0("A", "B")
# "AB"

df <- data.frame(id = 1:3, age = c(20, 30, 40))
names(df)

#20260211 14:43~
#11.3.2 Iteration using while





#11.4 Conditional branching
#11.4.1 Conditional Branching with if, else if, and else
#11.4.2 Conditional Branching with ifelse ()
#11.4.3 ConditionalBranching with switch ()

#11.5 Exercises




