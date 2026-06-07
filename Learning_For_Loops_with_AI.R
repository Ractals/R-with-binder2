#Learning For Loops with AI
#20260607 23:40~

for (i in 1:5){
  print (i)
}


result <- c()
for (i in 1:5) {
  result [i] <- i^2
}
result


cubed <- c ()
for (i in 1:10) {
  cubed [i] <- i^3
}
cubed

for (i in 1:10) {
  i = i ^3
  print (i)
}



for (i in 1:9) {
  for (j in 1:9) {
    cat (i, "x", j, "=", i*j, "\n")
  }
}

for (i in 1:9) {
  for (j in 1:9) {
    x <- paste0 (i, "x", j, "=", i*j)
    print (x)
  }
  
  for (i in 1:10) {
    if (i == 5) {
      brake
    }
    print (i)
  }
}

for (i in 1:10) {
  if (i %% 2 == 0) {
    next
  }
  print (i)
}


for (i in 1:10) {
  if (i %% 3 == 0 | i %% 5 == 0) {
  print ("FizzBuzz")
  }
  else if (i %% 3 == 0) {
    print ("Fizz")
  }
  else if (i %% 5 == 0) {
    print ("Buzz")
  }
  else if (i %% 3 !=0 | i %% 5 !=0) {
    print (i)
  }
}

for (i in 1:15) {
  if (i %% 3 == 0 & i %% 5 == 0) {
    print ("FizzBuzz")
  }
  else if (i %% 3 == 0) {
    print ("Fizz")
  }
  else if (i %% 5 == 0) {
    print ("Buzz")
  }
  else if (i %% 3 !=0 | i %% 5 !=0) {
    print (i)
  }
}


df <- data.frame (
  id = 1:5,
  sex = c ("M", "F", "M", "F", "M"),
  age = c (25, 34, 51, 28, 56)
)
df


df$agegrp <- ""
for (i in 1:nrow (df)) {
  if (df$age [i] < 40) {
    df$agegrp [i] <- "< 40"
  }
  else {
    df$agegrp [i] <- ">= 40"
  }
}
df


df2 <- data.frame (
  A = c (1, 2, 3),
  B = c (4, 5, 6),
  C = c (7, 8, 9)
  )
for (j in names (df2)) {
  df2 [[paste0 (j, "_2")]] <- df2 [[j]] *2
}
df2

#20260607 ~24:18