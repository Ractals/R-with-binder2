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

#exercise (1)
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


#exercise (2)
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





#20260620 25:18~
#Practice ADSL dataset
adsl <- data.frame (
                    USUBJID = sprintf ("SUBJ%03d", 1:10),
                    TRT01A = rep (c ("Placebo", "Drug"), each = 5),
                    SAFFL  = c (
                                rep ("Y", 3), "N","Y", rep ("Y", 2), "N", rep ("Y", 2)
                                ),
                    AGE = c (25, 38, 72, 45, 67, 28, 51, 60, 73, 35)
                   )
adsl

#1:count up population
trt_list <- unique (adsl$TRT01A)
for (trt in trt_list) {
  n <- 0
  for (i in 1:nrow (adsl)){
    if (
      adsl$TRT01A[i] == trt &
      adsl$SAFFL[i] == "Y"
    ){
      n <- n +1
    }
  }
  cat (trt, ":", n, "\n")
}


#2:count up age category
for (i in 1:nrow (adsl)) {
  if (adsl$AGE[i] < 40) {
    adsl$AGEGRP[i] <- "<40"
  }else if (adsl$AGE [i] < 65){
    adsl$AGEGRP[i] <- "40-64"
  }else {
    adsl$AGEGRP [i] <- ">=65"
  }
}
adsl

#3:each param treatment
adlb <- data.frame (
                    USUBJID  = c (
                                  "01", "02", "03",
                                  "01", "02", "03"
                                  ),
                    PARAMCD = rep ( c ("ALT", "AST"), each = 3),
                    AVAL = c (35, 48, 120, 30, 45, 90)
                    )

adlb

param_list <- unique (adlb$PARAMCD)
for (param in param_list) {
  vals <- c ()
  for (i in 1:nrow (adsl)){
    if (adsl$PARAMCD [i] == param) {
      vals <- c (vals, adsl$AVAL [i])
    }
  }
  cat (param, mean (vals), "\n")
}


#4 Shift Table
shift <- data.frame (
                      BASE = c (20, 30, 80, 120),
                      AVAL = c (25, 90, 100, 180),
                      ULN  = c (40, 40, 40, 40)
                    )
shift

for (i in 1:nrow (shift)) {
  if (shift$BASE [i] <= shift$ULN [i]) {
    base_cat <- "Normal"
  }else {
    base_cat <- "High"
  }
  if (shift$AVAL [i]<= shift$ULN [i]){
    post_cat <- "Normal"
  }else {
    post_cat <- "Hight"
  }
  cat (base_cat, "->", post_cat, "\n")
}

#5 else if

aval <- 180
if (aval < 40){
  grade <- 0
}else if (aval < 80){
  grade <- 1
}else if (aval < 120){
  grade <- 2
}else if (aval < 200){
  grade <- 3
}else {
  grade <- 4
}
grade


#6class freqance
adsl$SEX <- c ("M", "F", "M", "F", "M", "M", " F", "M", "F", "M")
trt_list
adsl

for (trt in trt_list) {
  for (sex in c ("M", "F")) {
    n <- 0
    for (i in 1:nrow (adsl)) 
      {
      if (
          adsl$TRT01A [i] == trt &
          adsl$SEX [i] == sex &
          adsl$SAFFL [i] == "Y"
         ) {
             n <- n +1
           }
      }
    cat (trt, sex, n, "\n")
  }
}

#20260620 ~20:28
#3/8Break
for (i in 1:5){
  print (i)
}

for (i in 1:10) {
  if (i == 5) {
    break
  }
  print (i)
}

#next
for (i in 1:10) {
  if (i == 5) {
    next
  }
  print (i)
}


#nex with ADaM (1)
adlb <- data.frame (
  USUBJID = c ("01", "02", "03", "04"),
  AVAL = c (10, NA, 25, 30)
)

for (i in 1:nrow (adlb)) {
  if (is.na (adlb$AVAL [i])) {
    next
  }
  print (adlb$AVAL [i])
}


#nex with ADaM (2)
adsl <- data.frame (
  USUBJID = c ("01", "02", "03", "04"),
  SAFFL = c ("Y", "N", "Y", "N")
)

for (i in 1:nrow (adsl)) {
  if (adsl$SAFFL [i] != "Y"){
    next
  }
  print (adsl$USUBJID[i])
}


#nex with ADaM (3)
adae<- data.frame (
  USUBJID = 
    rep (c ("01", "02"), times = c (3, 2)),
  ASTDT = c (10, 20, 30, 5, 15)
)
adae


for (i in 1:nrow (adae)) {
  if (adae$USUBJID [i] == "01") {
    print (adae$ASTDT [i])
    break
  }
}


#nex with ADaM (4)
for (trt in trt_list) {
  n <- 0
  for (i in 1:nrow (adsl)) {
    if (adsl$SAFFL [i] != "Y") {
      next
    }
    if (adsl$TRT01A [i] == trt) {
      n <- n+1
    }
  }
  print (n)
}



#exercise1
age <- c (25, 30, NA, 45, NA, 60)

for (i in seq_along (age)) {
  if (is.na (age [i])){
    next
  }
  print (age [i])
}

for (i in 1:length (age)) {
  if (is.na (age [i])){
    next
  }
  print (age [i])
}


#exercise2
aval <- c (10, 15, 25, 35, 50)

for (i in seq_along (aval)) {
  if (aval [i] > 30){
    break
  }
  print (aval [i])
}


#4/8 loop
adsl <- data.frame (
  USUBJID = sprintf ("SUBJ%03d", 1:8),
  TRT01A = rep (c ("Placebo", "Drug"), each = 4),
  SEX1 =  c (
            rep (c ("M", "F"), each = 2),
            rep (c ("M", "F"), times = 2)
            ),
  SAFFL = c (rep ("Y", times = 3), "N", rep ("Y", times = 2), "N", "Y")
)
adsl


#per TRT
trt_list <- unique (adsl$TRT01A) 
for (trt in trt_list) {
  n <- 0
  for (i in 1:nrow (adsl)) {
    if (
      adsl$TRT01A [i] == trt &
      adsl$SAFFL [i] == "Y"
    ) {
      n <- n +1
    }
  }
  cat (trt, n, "\n")
}


#TRT x SEX
trt_list <- unique (adsl$TRT01A)
for (trt in trt_list) {
  for (sex in c ("M", "F")) {
    n <- 0
    for (i in 1:nrow (adsl)) {
      if (
        adsl$TRT01A [i] == trt &
        adsl$SEX [i] == sex &
        adsl$SAFFL [i] == "Y"
      ) {
        n <- n +1
      }
    }
    cat (trt, sex, n, "\n")
  }
}


#for loop with ADaM
adlb <- data.frame (
  USUBJID = c (
    rep ( c("01", "02", "03", "04"), times = 2)
  ),
  TRT01A = c (rep (c ( rep ( c("Placebo", "Drug"), each = 2)), times = 2)),
  PARAMCD = c (rep (c ("ALT", "AST"), each = 4)),
  AVAL = c (30, 40, 50, 60, 25, 35, 45, 55)
  
)
adlb


for (param in unique (adlb$PARAMCD)) {
  vals <- c ()
  for (i in 1:nrow (adsl)) {
    if (adlb$PARAMCD [i] == param) {
      vals <- c (vals, adlb$AVAL [i])
    }
  }
  cat (param, mean (vals), "\n")
}
#20260621 ~21:39


#20260627 25:36~
#part 5/8
adsl <- data.frame (
  USUBJID = c ("01", "02", "03", "04", "05"),
  TRT01A  = rep (c ("Placebo", "Drug"), times = c (2, 3)),
  SEX     = c ("M", "F", "M", "F", "M"),
  AGE     = c (25, 68, 42, 18, 72),
  SAFFL   = c (rep ( c("Y", "N"), times = c (3, 1)), "Y")
)
adsl
nrow (adsl)

for (i in 1:nrow (adsl)) {
  print  (i)
}


adsl$AGE
adsl$AGE [1]

adsl$AGE [2]

for (i in 1:nrow (adsl)) {
  print (adsl$AGE [i])
}
adsl$AGEGR1 <- ""
adsl$AGEGR1 <- NA_character_
adsl$AGEGR1 <- NA_real_
adsl
for (i in 1:nrow (adsl)){
  if (adsl$AGE [i] < 65){
    adsl$AGEGR1 [i] <- "<65"
  }else {
    adsl$AGEGR1 [i] <- ">=65"
  }
}
adsl

for (i in 1:nrow (adsl)){
  if (adsl$SAFFL [i] == "Y") {
    print (adsl$USUBJID [i])
  }
}



#exercise1
for (i in 1:nrow (adsl)) {
  if (adsl$AGE [i] < 20) {
    adsl$AGECAT [i] <- "Child"
#  }else if (adsl$(20 <= AGE [i] < 65)) {
  }else if (adsl$AGE [i] >=20  && adsl$AGE [i] < 65) {
    adsl$AGECAT [i] <- "Adult"
  }else if (adsl$AGE [i] <= 65) {
    adsl$AGECAT [i] <- "Senior"
  }
}
adsl

#exercise2
for (i in 1:nrow (adsl)) {
  if (adsl$TRT01A [i] == "Placebo") {
    adsl$TRTDISP [i] <- "PBO"
  }else if (adsl$TRT01A [i] == "Drug") {
    adsl$TRTDISP [i] <- "Active"
  }
}
adsl


#part 6/8
adlb <- data.frame (
  ALT = c (25, 35, 50),
  AST = c (18, 24, 40),
  ALP = c (80, 90, 120),
  BILI = c (0.8, 1.0, 1.5)
)
adlb


names (adlb)
for (j in names (adlb)) {
  print (j)
}

adlb$ALT

j <- "ALT"
adlb$j
adlb

j <- "ALT"
adlb [[j]]
adlb


for (j in names (adlb)) {
  cat (j, mean (adlb [[j]]), "\n")
}


for (j in names (adlb)) {
  adlb [[paste0 (j, "_2")]] <- adlb [[j]] *2
}



labvars <- c ("ALT", "AST", "ALP")
for (j in labvars) {
  adlb [[j]] <- round (adlb [[j]], 1)
}
adlb


adlb
#adlb[[ALT]][2] <- NA
#adlb[["ALT"]][2] <- NA
#adlb [cbind (c (2,3), c ("ALT", "AST"))] <- NA
#adlb [c (2,3), c ("ALT", "AST")] <- NA


adlb$ALT[2] <- NA
adlb$AST[3] <- NA
#or
adlb [c (2,3), c ("ALT", "AST")] <- list (c (NA, 50), c (24, NA))
adlb

for (j in names (adsl)) {
  cat (j, sum (is.na (adlb [[j]])), "\n")
}

#20260627 ~26:55




#20260705 23:34~
#7.lapply ()
adlb <- data.frame (
  ALT = c (25, 35, 50),
  AST = c (18, 24, 40),
  ALP = c (80, 90, 120)
)
adlb

for (v in names (adlb)) {
  print (mean (adlb [[v]]))
}

lapply (adlb, mean)


result <- lapply (adlb, mean)
class (result)
result

#(2) sapply ()
sapply (adlb, mean)


class (sapply (adlb, mean))

#(3) apply ()
apply (adlb, 2, mean) #columns mean
apply (adlb, 1, mean) #rows mean


#(4)tapply ()
adsl <- data.frame (
  TRT01A =  rep ( c ("PBO", "Drug"), times = c(2, 2)),
  AGE = c (30, 40, 50, 60)
)
adsl


for (trt in unique (adsl$TRT01A)) {
  print (mean (adsl$AGE [adsl$TRT01A == trt]))
}

tapply (adsl$AGE, adsl$TRT01A, mean)


sapply (adlb, function (x)
  sum (is.na (x)))

sapply (adlb, min)
sapply (adlb, max)
sapply (adlb, sd)
sapply (adlb, median)



sapply (adlb, function (x)
  mean (x, na.rm = TRUE))


#method        return
#adlb[1]       column1 data.frame
#adlb['ALT']   column1 data.frame
#adlb[[1]]     numeric vector c(25,35,50)
#adlb[['ALT']] numeric vector c(25,35,50)
#adlb$ALT      numeric vector c(25,35,50)


#method         return
#adlb[2,3]	    90
#adlb[,"ALT"]	  columns ALT (vactor)
#adlb["ALT"]	  column1 data.frame
#adlb[[1]]	    columns ALT (vactor)
#adlb[["ALT"]]	columns ALT  (vactor)
#adlb$ALT	      column1 ALT  (vactor)
#adlb[[1]][2]	  35




#8.purrr
for (v in names (adlb)) {
  print (mean (adlb [[v]]))
}

lapply (adlb, mean)

install.packages ("purrr")
library (purrr)

map (adlb, mean)


adlb <- data.frame (
  ALT = c (25, 35, 50),
  AST = c (18, 24, 40),
  ALP = c (80, 90, 120)
)
adlb


#map ()
map (adlb, mean)

#same as
lapply (adlb, mean)


#map_dbl ()
map_dbl (adlb, mean)


x0 <- map (adlb, mean)
typeof (x0)

x <- map_dbl (adlb, mean)
class (x)
typeof (x)


#map_chr ()
x <- map_chr (adlb, class)
x
typeof (x)


#map_int ()
map_dbl (adlb, function (x)
  mean (x, na.rm = TRUE))

#or
map_dbl (adlb, \(x) mean (x, na.rm =TRUE))

#missing
map_int (adlb, \(x) sum (is.na (x)))

#Mean DS
map_dbl (adlb, mean)


adlb
#every PARAMN
#folows AI copy (paramcd in adlb) 
adlb <- data.frame(
  USUBJID = c(
    "SUBJ001","SUBJ001","SUBJ001",
    "SUBJ002","SUBJ002","SUBJ002",
    "SUBJ003","SUBJ003","SUBJ003"
  ),
  
  TRT01A = c(
    "Placebo","Placebo","Placebo",
    "Drug","Drug","Drug",
    "Drug","Drug","Drug"
  ),
  
  PARAMCD = c(
    "ALT","AST","BILI",
    "ALT","AST","BILI",
    "ALT","AST","BILI"
  ),
  
  PARAM = c(
    "Alanine Aminotransferase",
    "Aspartate Aminotransferase",
    "Total Bilirubin",
    "Alanine Aminotransferase",
    "Aspartate Aminotransferase",
    "Total Bilirubin",
    "Alanine Aminotransferase",
    "Aspartate Aminotransferase",
    "Total Bilirubin"
  ),
  
  AVAL = c(
    25,20,0.8,
    42,38,1.2,
    55,48,1.5
  )
)

adlb


param_list <- unique (adlb$PARAMCD)
map (param_list, function (param) {
  subset (
    adlb, PARAMCD == param)
  }
)



#walk ()
walk (param_list, print)

#20260705 ~24:22
