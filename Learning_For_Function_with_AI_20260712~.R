#20260712 25:40~
#step1
square <- function (x) {
  x^2
}
square (5)


my_mean <- function (x) {
  mean (x)
}
x <- c (1, 2, 3,　4, 5)
my_mean (x)

my_mean2 <- function (x) {
  mean (x, na.rm = TRUE)
}
x2 <- c (1, 2, NA, 4, 5)
my_mean2 (x2)
#Step2
#ex1
x3 <- c (10, 20, 30, 40, 50)
zscore <- function (x3) {
  m <- mean (x3)
  s <- sd (x3)
  (x - m) / s
}
zscore (x3)


#ex2
summary2 <- function (x) {
  c (
    N    = length (x),
    Mean = mean (x),
    SD   = sd (x),
    Min  = min (x),
    Max  = max (x)
  )
}
summary2 (x3)





#ex3
calc_mean <- function (x) {
  mean (x, na.rm = TRUE)
}
calc_sd <- function (x) {
  sd (x, na.rm = TRUE)
}


calc_mean (x3)
calc_sd (x3)

summary3 <- function (x3) {
  c (
    mean = calc_mean (x3),
    SD   = calc_sd (x3)
  )
}
summary3 (x3)

#step3
adlb <- data.frame (
  USUBJID = rep (c("01", "02", "03"), each = 2)
  , AVISIT = rep (c ("BASELINE", "WEEK4"), time = 3)
  , AVAL = c (100, 90, 120, 100, 110, 95)
)
adlb

#ex1
calc_chg <- function (base, post) {
  post - base
}
calc_chg (100, 90)

#ex2
calc_pchg <- function (base, post) {
  100 * (post - base) / base
}
calc_pchg (100, 90)



#ex3
make_chg <- function (df) {
  base <- df$AVAL [df$AVISIT == "BASELINE"]
  post <- df$AVAL [df$AVISIT == "WEEK4"]
  
  data.frame (
    CHG = post - base,
    PCHG = 100 * (post - base) / base
  )
}
split (adlb, adlb$USUBJID)

lapply (
  split (adlb, adlb$USUBJID),
  make_chg
)


#step4
create_summary <- function (data, var, digits = 1) {
  x <- data [[var]]
  sprintf (
    paste0 ("%.", digits, "f +/- %.", digits, "f"),
    mean (x, na.rm = TRUE),
    sd (x, na.rm = TRUE)
  )
}
create_summary (
  adlb, 
  "AVAL"
)
#20260712 ~26:12


