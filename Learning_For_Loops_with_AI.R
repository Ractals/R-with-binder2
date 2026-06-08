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






#20260608 25:25~
x <- 10
if (x > 5) {
  print (">5")
}

x <- 3
if (x >5) {
  print (">5")
}

x <- 10
if (x == 10) {
  print ("it's 10")
}

x <- 3
if (x > 5) {
  print (">5")
}else {
  print ("<5")
}

score <- 75
if (score >= 90) {
  print ("A")
} else if (score >= 70) {
  print ("B")
}else {
  print ("C")
}

score <- 95
if (score >= 70) {
  print ("B")
}else if (score >= 90) {
  print ("A")
}

age <- 25
if (age >= 20 & age < 30) {
  print ("20 <= age < 30")
}


x <- 100
if (x < 0 | x > 50) {
  print ("out of range")
}


x <- 5
if (! (x > 10)) {
  print ("<10")
}


age <- 43
if (age < 20) {
  grp <- "child"
}else if (age < 40) {
  grp <- "Adult"
}else{
  grp <- "Senior"
}
grp


for (i in 1:10) {
  if (i %% 2 ==0)
    print (i)
}


x <- NA
if (is.na (x)) {
  print ("missing")
}


score <- 82
if (score > 90) {
  print ("A")
}else if (score > 80) {
  print ("B")
}else if (score > 70) {
  print ("C")
}else {
  print ("D")
}



age <- c (15, 22, 35, 47, 68)
range <- NULL
if (age < 20) {
  range <- paste0 (range, "Minor")
}else if (age < 65) {
  range <- paste0 (range,"Adult")
}else {
  range <- paste0 (range, "Senior")
}
range


age <- c (15, 22, 35, 47, 68)
if (age < 20) {
  range <-"Minor"
}else if (age < 65) {
  range <- "Adult"
}else {
  range <- "Senior"
}
range

for (i in 1:length (age)) {
  if (age[i] < 20) {
    print ("Minor")
  }else if (age[i] < 65) {
    print ("Adult")
  }else {
    print ("Senior")
  }
}


#20260608 ~25:49