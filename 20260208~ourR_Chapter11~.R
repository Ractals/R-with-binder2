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
  favorite = c("noodle", "Cat",  "R"),
  gender   = c("Male",  "Male", "Male")
)
#Bad example
data.frame (
  name = c("Song", "Yanai", "Hadley"),
  favorite = c("noodle", "Cat","R"),
  gender = c("Male", "Male", "Male")
)


#An evil example
data.frame (name = c("Song", "Yanai", "Hadley"), favorite = c("noodle", "Cat","R"), gender = c("Male", "Male", "Male"))

#Good example
data.frame (
  name     = c("Song", "Yanai", "Wickham"),
  favorite = c("noodle", "Cat",  "R"),
  gender   = c("Male",  "Male", "Male")
)

#Bad example
data.frame (
  name     = c("Song", "Yanai", "Wickham"),
  favorite = c("noodle", "Cat",  "R"),
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
#I had troble updating the token.
#Did need to check "repo" in the sast as well?
#15:47~
#11.3.2 Iteration using while
  # while (condition)
    #  Procssing to be performed when then condition is not safisfied
  # }
for (i in 1:5) {
  print (i)
}

i <- 1
while (i < 6) {
  print (i)
  i <- i+1
}

i<-1
while (i < 6) {
  i <- i+1
  print (i)
}

i<- 0
while (i <5) {
  i <- i +1
  print (i)
}

#When the objective is defined but the number of repetitions required to achieve that objective is unknown, a while loop should be used insted of a for loop.
#For example, consider the case of rolling a six^sided die. Suppose we record the outcome of each roll and wish to stop rolling once the cumulative total reaches 30 o morley
#How should this be implemented?
#It the number of rolls required is not known in advance, a, for loop cannot be used.
#If six appears consecutively, five folls may be sufficient; however, if one continues to appear, it may be necessary to roll the die thirty times.
#In this manner, when we perform an iterative process without knowing how many repetitions are required, 
#but we do now the stopping condition, a while loop is appropriate.
total <- 0
trial <- 1
while (total < 30) {
  die <- sample (1:6, size = 1)
  total <- total +die
  print (paste0 (trial , "Result of the %d-th dice roll: ", die,
                 " (Cumulative total so far: ", total, ") "))
  #The print () function can also be written as follows:
  #Result <- sprintf ("Result of the %d-th dice roll: %d (Cumulative total so far: %d)"
  # trial, die, total)
  trial <- trial +1
}


#This iterative process can also be reproduced using a for loop. 
#It may be implemented as follows

total <- 0
for (trail in 1:30) {
  die <- sample (1:6, 1)
  total <- total +die
  #It is also possible to sue sprintf () insted of print ()
  result <- sprintf ("Result of the %d-th dice roll: %d (Cumulative total so far: %d) ",
  trial,die, total)
  print (result)
  if (total >= 30) break () #you can omit ()
}

name <- "Sont"
bowls <- 50
height <- 176.2
print (paste0 (name, " consumes ", bowls, " bowls of noodle per month, and he height is ", height, " cm."))
#Stire bane ub %s, bowls in %d, and height in %.1f (rounded to one decimal place), then output
sprintf ( "%s consumes %d bowls of noodle per month, and he height is %.1f cm.", name, bowls, height)

#~16:46

#17:44~
#11.4 Conditional branching
#11.4.1 Conditional Branching with if, else if, and else
 # if (condition) {
  #  Procssing to be performed when then condition is not safisfied
 # }
name <- "Song"
if (name == "Song") {
  print ("I love noodles")
}

name <- "Yanai"
if (name == "Song") {
  print ("I love nodles")
}


  # if (condition) {
    # Procssing to be performed when then condition is  safisfied
  # } else {
    #  Procssing to be performed when then condition is not safisfied
  #}

#The esle statement may also be written on a new line, as shown below

 # if (condition) {
  # Procssing to be performed when then condition is  safisfied
 # } 
 #else {
  #  Procssing to be performed when then condition is not safisfied
 #}

#However, this style is not recommended. Since else is always used in conjunction with if,
#the standard coding convention is to place it immediately after the closing brace } of the corresponding if black, separated by a single spece.

name <- "Song"
if (name == "Song") {
  print ("I love a noodle")
} else {
  print ("I hate a noodle")
}
name <- "Yanai"
if (name == "Song") {
  print ("I love a noodle")
} else {
  print ("I hate a noodle")
}

#if (conditiona) {
  #Processing to be performed when condition1 is satisfied
#} else if (condition2) {
 #Processing to be performed when condition1 is not satisfied but condition2 is satisfied
#} else if (condition3) {
 #Processing to be performed when neither condition 1 nor condition2 is satisfied but condition3
#} else {
 #Processing to be performed when none of the conditions are satisfied
#}

name <- "Song"
if (name =="Song" | name =="Koike") {
  #The aboe condition may also be written as (name %in% c ("song", "Koike"))
  print ("I love noodles")
} else if (name =="Yanai") {
  print ("I hate noodles") 
} else {
  print ("Moderately fond on noodles")
}


name <- "Yanai"
if (name %in% c("Song", "Koike")) {
  print ("I love noodles")
} else if (name == "Yanai") {
  print ("I hate noodles")
} else {
  print ("Moderately fond no noodles")
}


name <- "Koike"
if (name %in% c("Song", "Koike")) {
  print ("I love noodles")
} else if (name == "Yanai") {
  print ("I hate noodles")
} else {
  print ("Moderately fond no noodles")
}



name <- "Shigemura"
if (name %in% c("Song", "Koike")) {
  print ("I love noodles")
} else if (name == "Yanai") {
  print ("I hate noodles")
} else {
  print ("Moderately fond no noodles")
}



name <- "Hakiai"
if (name %in% c("Song", "Koike")) {
  print ("I love noodles")
} else if (name == "Yanai") {
  print ("I hate noodles")
} else {
  print ("Moderately fond no noodles")
}



scores <- c(58, 100, 81, 97, 71, 61, 60, 73, 85)
for (i in seq_along (scores)) {
  if (scores[i] >= 60) {
    print (paste0 ("Student", i, "Evaluation Result: Pass"))
  } else {
    print (paste0 ("Student", i, "Evaluation Result: Fail"))
  }
}

scores <- c(58, 100, 81, 97, 71, 61, 47, 60, 73, 85)
for (i in seq_along (scores)) {
  if (scores [i] >= 60) {
    result <- sprintf ("Student%d Evaluation Result:Pass", i )
  } else {
    result <- sprintf ("Student%d Evaluation Result:Fail", i )
  }
  print (result)
}


score <- c(58, 100, 81, 97, 71, 61, 47, 60, 73, 85)
pf <- rep (NA, length (scores))
for (i in seq_along (scores)) {
  if (scores [i] >= 60) {
    pf[i] <- "Pass" 
  } else {
    pf[i] <- "Fail" 
  }
}

pf
#~18:18

#11.4.2 Conditional Branching with ifelse ()
#11.4.3 ConditionalBranching with switch ()

#11.5 Exercises





