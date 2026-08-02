#20260802 25:09~

adsl <- data.frame (
  USUBJID = sprintf ("SUBJ%03d", 1:20),
  TRT01A = rep (c ("Plocebo", "Drub"), each = 10),
  SEX = sample (c ("M", "F"), 20, replace = T),
  AGE = sample (30:80, 20, replace = T),
  RACE= sample (c ("Asian", "White"), 20, replace = T),
  SAFFL = "Y"
)
adsl


trt_list <- unique (adsl$TRT01A)
#modify (prompt)
#chap1
adsl <- data.frame (
  USUBJID = sprintf ("SUBJ%03d", 1:20),
  TRT01A = rep (c ("Placebo", "Drug"),
                each = 10
                ),
  SEX = sample (c ("M", "F"),
                20,
                replace = T),
  AGE = sample (30:80,
                20,
                replace = TRUE),
  RACE = sample (c ("Asian", "White"),
                 20,
                 replace = TRUE),
  SAFFL = "Y"
)
adsl


#chap2
adsl_saf <- adsl |>
  filter (SAFFL == "Y")
adsl_saf   


#chap3
trt_list <- unique (adsl_saf$TRT01A)
trt_list


#chap4
for (trt in trt_list){
  df <- adsl_saf |>
    filter (TRT01A == TRT01A)
  print (df)
}


#chap5
calc_mean_sd0 <- function (data, var) {
  x <- data [[var]]
  sprintf ("%.1f (%.2f)",
          mean (x),
          sd (x))
}
calc_mean_sd0 (adsl,"AGE")


#chap6
for (trt in trt_list) {
  df <- adsl_saf |>
    filter (TRT01A == trt)
  result <- calc_mean_sd (df, "AGE")
  print (result)
}

#chap7
calc_freq <- function (data, var) {
  table (data[[var]])
}

calc_freq (adsl, "SEX")

#chap8
result <- data.frame ()
for (trt in trt_list) {
  df <- adsl_saf |>
    filter (TRT01A == trt)
  tmp <-data.frame (
    TRT01A = trt,
    AGE = calc_mean_sd (df, "AGE")
  )
  result <- bind_rows (result, tmp)
}
result
#20260802~25:51


library(dplyr)

set.seed(123)

adsl <- data.frame(
  USUBJID = sprintf("SUBJ%03d",1:120),
  
  TRT01A = sample(c("Placebo","Drug"),
                  120,
                  replace=TRUE),
  
  SEX = sample(c("M","F"),
               120,
               replace=TRUE),
  
  AGE = sample(20:85,
               120,
               replace=TRUE),
  
  SAFFL = sample(c("Y","N"),
                 120,
                 replace=TRUE,
                 prob=c(0.95,0.05))
)

adsl