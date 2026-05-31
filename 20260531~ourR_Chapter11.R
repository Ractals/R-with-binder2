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



