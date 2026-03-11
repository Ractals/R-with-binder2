library(dplyr)

set.seed(123)

dose_levels <- c(100,100,100,
                 200,200,200,
                 400,400,400,400,
                 600,600,600,600,
                 800,800,800,800,800)

n_subj <- length(dose_levels)

ADSL <- data.frame(
  STUDYID="RAS2410-01",
  USUBJID=paste0("SUBJ",sprintf("%03d",1:n_subj)),
  TRT01A=paste0(dose_levels," mg"),
  DOSE=dose_levels,
  AGE=round(rnorm(n_subj,60,8)),
  SEX=sample(c("Male","Female"),n_subj,replace=TRUE),
  HEIGHT=round(rnorm(n_subj,165,8),1),
  WEIGHT=round(rnorm(n_subj,65,10),1),
  SMOKE=sample(c("Yes","No"),n_subj,replace=TRUE)
)

ADSL$BMI <- round(ADSL$WEIGHT/((ADSL$HEIGHT/100)^2),1)

dose_labels <- c("100 mg","200 mg","400 mg","600 mg","800 mg")

dose_n <- ADSL %>%
  count(TRT01A) %>%
  arrange(match(TRT01A,dose_labels))

dose_n_vec <- paste0("N=",dose_n$n)

num_summary <- function(var){
  
  res <- ADSL %>%
    group_by(TRT01A) %>%
    summarise(
      N=n(),
      Mean=mean(.data[[var]]),
      SD=sd(.data[[var]]),
      Median=median(.data[[var]]),
      Min=min(.data[[var]]),
      Max=max(.data[[var]])
    )
  
  res <- res[match(dose_labels,res$TRT01A),]
  
  rbind(
    c("N",as.character(res$N)),
    c("Mean (SD)",sprintf("%.1f (%.1f)",res$Mean,res$SD)),
    c("Median",sprintf("%.1f",res$Median)),
    c("Min-Max",sprintf("%.1f - %.1f",res$Min,res$Max))
  )
}

cat_summary <- function(var,levels){
  
  tab <- table(ADSL$TRT01A,ADSL[[var]])
  tab <- tab[match(dose_labels,rownames(tab)),]
  
  out <- matrix("",nrow=length(levels),ncol=6)
  out[,1] <- levels
  
  for(i in 1:length(levels)){
    out[i,2:6] <- as.character(tab[,levels[i]])
  }
  
  out
}

make_block <- function(title,mat){
  
  out <- matrix("",nrow=nrow(mat)+1,ncol=6)
  out[1,1] <- title
  out[2:(nrow(mat)+1),] <- mat
  out
}

age <- num_summary("AGE")
height <- num_summary("HEIGHT")
weight <- num_summary("WEIGHT")
bmi <- num_summary("BMI")

sex <- cat_summary("SEX",c("Male","Female"))
smoke <- cat_summary("SMOKE",c("Yes","No"))

tab <- rbind(
  make_block("Age (Year)",age),
  matrix("",1,6),
  make_block("Sex",sex),
  matrix("",1,6),
  make_block("Height (cm)",height),
  matrix("",1,6),
  make_block("Weight (kg)",weight),
  matrix("",1,6),
  make_block("BMI (kg/m^2)",bmi),
  matrix("",1,6),
  make_block("Smoke",smoke)
)

rtf <- "{\\rtf1\\ansi\n"
rtf <- paste0(rtf,"\\fs19\n")

# -----------------------------
# ②'罫線修正：Characteristic列を除外
# -----------------------------
make_row <- function(vec,bottom=FALSE,top=FALSE){
  
  border_b <- ""
  if(bottom) border_b <- "\\clbrdrb\\brdrs\\brdrw10"
  
  top1 <- ""
  top2 <- ""
  if(top){
    top2 <- "\\clbrdrt\\brdrs\\brdrw10"
  }
  
  paste0(
    "\\trowd",
    border_b,top1,"\\cellx3000",
    border_b,top2,"\\cellx4200",
    border_b,top2,"\\cellx5400",
    border_b,top2,"\\cellx6600",
    border_b,top2,"\\cellx7800",
    border_b,top2,"\\cellx9000",
    "\\intbl\\ql ",vec[1],"\\cell",
    "\\intbl\\qc ",vec[2],"\\cell",
    "\\intbl\\qc ",vec[3],"\\cell",
    "\\intbl\\qc ",vec[4],"\\cell",
    "\\intbl\\qc ",vec[5],"\\cell",
    "\\intbl\\qc ",vec[6],"\\cell",
    "\\row\n"
  )
}

make_line_full <- function(){
  paste0(
    "\\trowd",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx3000",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx4200",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx5400",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx6600",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx7800",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx9000",
    "\\intbl \\cell\\cell\\cell\\cell\\cell\\cell\\row\n"
  )
}

make_line_partial <- function(){
  paste0(
    "\\trowd",
    "\\cellx3000",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx4200",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx5400",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx6600",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx7800",
    "\\clbrdrb\\brdrs\\brdrw15\\cellx9000",
    "\\intbl \\cell\\cell\\cell\\cell\\cell\\cell\\row\n"
  )
}

make_line_top <- function(){
  paste0(
    "\\trowd",
    "\\clbrdrt\\brdrs\\brdrw15\\cellx3000",
    "\\clbrdrt\\brdrs\\brdrw15\\cellx4200",
    "\\clbrdrt\\brdrs\\brdrw15\\cellx5400",
    "\\clbrdrt\\brdrs\\brdrw15\\cellx6600",
    "\\clbrdrt\\brdrs\\brdrw15\\cellx7800",
    "\\clbrdrt\\brdrs\\brdrw15\\cellx9000",
    "\\intbl \\cell\\cell\\cell\\cell\\cell\\cell\\row\n"
  )
}

make_title <- function(){
  
  paste0(
    "\\trowd",
    "\\cellx3000",
    "\\cellx4200",
    "\\cellx5400",
    "\\cellx6600",
    "\\cellx7800",
    "\\cellx9000",
    "\\intbl \\cell",
    "\\intbl \\cell",
    "\\intbl \\cell",
    "\\intbl\\qc \\b RAS2410-01 \\b0\\cell",
    "\\intbl \\cell",
    "\\intbl \\cell",
    "\\row\n"
  )
}

rtf <- paste0(rtf,make_line_full())
rtf <- paste0(rtf,make_title())

rtf <- paste0(rtf,make_row(c("",dose_labels),top=TRUE))

rtf <- paste0(rtf,make_row(c("",dose_n_vec),TRUE))

for(i in 1:nrow(tab)){
  rtf <- paste0(rtf,make_row(tab[i,]))
}

rtf <- paste0(rtf,make_line_top())

rtf <- paste0(rtf,"}")

writeLines(rtf,"RAS2410-01_adsl_20260309_31_2.rtf")