#20260531 24:19~
#Basics of R Programming
#11.1 Basic Concepts of the R Language
#11.1.1 Objects
#omit

#11.1.2 class
#omit

#11.1.3 Function and Arguments
#omit

#11.2 R Coding Style
#omit

#11.2.1 object name
#omit

#11.2.2 newline
#omit


#11.2.3 Spases and Indentation
#omit

#11.2.4 Assignment
#omit

#11.3 
#11.3.1 Interation with for
for (i in 1:5) {
  print (i)
}



dmg_vals <- c (24, 64, 31, 46, 81, 102)
for (damege in dmg_vals) {
  x <- paste0 ("Tonnura takes ", damege, " damage!!")
  print (x)
}

paste0 ("R is ", "everyone's ", "friend.")
paste0 ("My ", "HP/PM ", "is ", "500", "/", "400.")

cities <- c ("Sapporo", "Sendai", "Tokyo", "Yokohama", "Nagoya",
             "Kyoto", "Osaka", "Kobe", "Hiroshima", "Fukuoka")
for (i in seq_along (cities))
{
  x <- paste0 ("The current value of city is ", cities[i]) 
  print (x)
}



for (city in cities)
{
  x <- paste0 ("The current value of city is ", city) 
  print (x)
}



for (i in seq_along (cities))
{
  msg <- paste0 ("The ", i, "th city is ", cities [i], ".")
  print (msg)
}

#multiple for loop

for (i in 1:9)
{
  for (j in 1:9)
  {
    print (paste (i, "*", j, "=", i*j))
  }
}

for (i in 9:1)
{
  for (j in 1:9)
  {
    print (paste (i, "*", j, "=", i*j))
  }
}


for (i in 1:9)
{
  for (j in i:9)
  {
    print (paste (i, "*", j, "=", i*j))
  }
}

download.file ("https://www.jaysong.net/RBook/Data/FIFA_Men.csv", "FIFA_Men.csv")
install.packages ("pacman")
install.packages ("tidyverse")
pacman::p_load (tidyverse)
my_df <- read_csv ("FIFA_Men.csv")
my_df <- my_df [my_df$Confederation == "OFC"]
my_df


for (i in 1:nrow (my_df))
{
  print (paste0 ("=====Information for the", i, "th team====="))
  for (j in c ("Team", "Rank", "Points")) 
  {
    print (paste0 (j, ": ", my_df [i, j]))
  }
}


for (i in 1:nrow (my_df))
{
  print (paste0 ("=====Information for the", i, "th team====="))
  for (j in c ("Team", "Confederation", "Rank", "Points"))
    print (paste0 (j, ": ", my_df [i, j]))
}


for (i in 1:nrow (my_df))
{
  print (paste0 ("=====Information for the", i, "th team====="))
  cat (paste0 (
    "Team:"  , my_df$Team   [i], "\n",
    "Rank:"  , my_df$Rank   [i], "\n",
    "Points:", my_df$Points [i], "\n"
    
  ))
}

my_list <- list (A = c ("Song", "Wickham", "Yamai"),
                 B = c ("Watanabe", "Toyoshima", "Fujii"),
                 C = c ("Abe", "Moon", "Xi")
)

for (i in 1:3)
{
  for (j in names (my_list))
  {
    print (my_list [[j]][i])
  }
  print (paste0 ("=====This is the end of Student No.", i, "====="))
}


my_list2 <- list (c ("Song", "Wickham", "Yamai"),
                  c ("Watanabe", "Toyoshima", "Fujii"),
                  c ("Abe", "Moon", "Xi")
)


for (i in 1:3)
{
  for (j in seq_along (my_list2))
  {
    print (my_list2 [[j]][i])
  }
  print (paste0 ("=====This is the end of Student No.", i, "====="))
}


#20260531 ~25:00


#11.3.2 Interation with while
#20260607 24:58~
for (i in 1:5){
  print (i)
}


i <- 1
while (i < 6) {
  print (i)
  i <- i +1
}


i <- 1
while (i < 6){
  i <- i +1
  print (i)
}


i <- 0
while (i < 5) {
  i <- i +1
  print (i)
}


total <- 0
trial <- 1
while (total < 30) {
  die <- sample (1:6, size = 1)
  total <- total + die
  print (paste0 ("Result of the ", trial, " th dice roll: ", die,
                 "(Cumulative sum so far: ", total, ") "))
  trial <- trial +1
}


total <- 0
trial <- 1
while (total < 30) {
  die <- sample (1:6, size = 1)
  total <- total + die
  Result <- sprintf ("Result of the  %d, th dice roll:  %d (Cumulative sum so far:  %d ) ", trial, die, total)
  print (Result)
  trial <- trial +1
}


total <- 0
for (trial in 1:30) {
  die <- sample (1:6, 1)
  total <- total + die
  result <- sprintf ("Result of the  %d, th dice roll:  %d (Cumulative sum so far:  %d ) ", trial, die, total)
  print (result)
  if (total >= 30) break ()
}


name <- "Song"
bowls <- 50
height <- 176.2
print (paste0 (name, " eats", bowls, " of ramen a month and is ", height,  " cm tall."))

sprintf ("%s eats %d bowls of ramen a month and is %.1f cm tall.", name, bowls, height)


#11.4 Conditional Branching
#11.4.1 Conditional Branching with if, else if, and else
name <- "Song"
if (name == "Song") {
  print ("I love ramen.")
}

name <- "Yanai"
if (name == "Song") {
  print ("I love ramen.")
}

name <- "Song"
if (name == "Song") {
  print ("I love ramen.")
}else {
  print ("I don't like ramen.")
}


name <- "Yanai"
if (name == "Song") {
  print ("I love ramen.")
}else {
  print ("I don't like ramen.")
}



name <- "Song"
if (name == "Song" | name == "Koike") {
  print ("I love ramen.")
}else if (name == "Yanai"){
  print ("I don't like ramen.")
}else {
  print ("I kind of like ramen.")
}


name <- "Song"
if (name %in% c("Song", "Koike")) {
  print ("I love ramen.")
}else if (name == "Yanai"){
  print ("I don't like ramen.")
}else {
  print ("I kind of like ramen.")
}

name <- "Koike"
if (name %in% c("Song", "Koike")) {
  print ("I love ramen.")
}else if (name == "Yanai"){
  print ("I don't like ramen.")
}else {
  print ("I kind of like ramen.")
}

name <- "Shigemura"
if (name %in% c("Song", "Koike")) {
  print ("I love ramen.")
}else if (name == "Yanai"){
  print ("I don't like ramen.")
}else {
  print ("I kind of like ramen.")
}

name <- "Hakiai"
if (name %in% c("Song", "Koike")) {
  print ("I love ramen.")
}else if (name == "Yanai"){
  print ("I don't like ramen.")
}else {
  print ("I kind of like ramen.")
}

scores <- c (58, 100, 81, 97, 71, 61, 47, 60, 73, 85)
for (i in seq_along (scores)) {
  if (scores [i] >= 60) {
    print (paste0 ("student", i, "result: pass"))
  } else {
    print (paste0 ("student", i, "result: failed"))
  }
}


scores <- c (58, 100, 81, 97, 71, 61, 47, 60, 73, 85)
for (i in seq_along (scores)) {
  if (scores [i] >= 60) {
    result <- sprintf ("student %d result: pass", i)
  } else {
    result <- sprintf ("student %d result: failed", i)
  }
  print (result)
}



scores <- c (58, 100, 81, 97, 71, 61, 47, 60, 73, 85)
pf <- rep (NA, length (scores))

for (i in seq_along (scores)) {
  if (scores [i] >= 60) {
    pf [i] <- "pass"
  } else {
    pf [i] <- "failed"
  }
}

#11.4.2 ifelse () Conditional Branching
scores <- c (58, 100, 81, 97, 71, 61, 47, 60, 73, 85)
pf <- ifelse (scores >= 60, "Pass", "Fail")
pf



Ramen <- data.frame (
  id = 1:10,
  ramen = c (1, 1, 2, 1, 3, 1, 9, 2, 1, 9)
)
Ramen

Ramen$ramen <- ifelse (Ramen$ramen == 9, NA, Ramen$ramen)
Ramen

grade <- ifelse (scores >= 90, "S",
                 ifelse (scores >= 80, "A",
                         ifelse (scores >= 70, "B",
                                 ifelse (scores >= 60, "C", "F"))))
grade


grade2 <- dplyr::case_when (scores >= 90 ~ "S",
                             scores >= 80 ~ "A",
                             scores >= 70 ~ "B",
                             scores >= 60 ~ "C",
                             TRUE         ~ "F"
                             )
grade2



#11.4.3 switch () Conditional Branching


my_calc <- function (x, y, operation) {
  switch (operation,
          "+" = x + y,
          "-" = x - y,
          "*" = x * y,
          "/" = x / y,
          stop ("Onky +, -, * and / can be used as values for operation.")
          
          )
}

my_calc2 <- function (x, y, operation = c("+", "-", "*", "/")) {
  operation <- match.arg (operation)
  if (operation == "+") {
    return (x + y)
  } else if (operation == "-") {
    return (x - y)
  } else if (operation == "*") {
    return (x * y)
  } else  {
    return (x / y)
  }
}


my_calc (5, 3, operation = "+")
my_calc2 (5, 3, operation = "+")

my_calc (5, 3, operation = "-")
my_calc2 (5, 3, operation = "-")

my_calc (5, 3, operation = "*")
my_calc2 (5, 3, operation = "*")

my_calc (5, 3, operation = "/")
my_calc2 (5, 3, operation = "/")

#11.5 Excrcies 
#OMIT
#20260607 ~26:13

