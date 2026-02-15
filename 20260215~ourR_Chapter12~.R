#20260215 14:17~



#12.4 Exercises
#12.1 Creat of Function

Result <- 0
for (i in 1:5) {
  Result <- Result +i
}
Result


myPower <- function (x) {
  x^2
}
myPower (x = 24)


#function_name <- function (argument_name) {
# processing contents
#}


#Define the mySum function with a single argumentx
mySum <- function (x) {
  # Create a vector named Result to store the outcome, and initialixe it with 0 
  Result <- 0

  #Perform a loop, assigning each element of x to i one by one
  for (i in x) {
    # Overwrite Result with the value obtained by addition i to the current value of Result
    
    Result <- Result +i
  }
  # Return Result
  Result
}
mySum (1:5)

mySum (c (1, 2, 3, NA, 5))


mySum2 <- function (x, na.rm = FALSE) {
  if (na.rm ==TRUE) {
    x <- x[!is.na (x)]
  }
  Result <- 0
  for (i in x) {
    Result <- Result +i
  }

  Result
}
mySum2 (c(1, 2, 3, NA, 5))
mySum2 (c(1, 2, 3, NA, 5), na.rm = FALSE)
mySum2 (c(1, 2, 3, NA, 5), na.rm = TRUE)
mySum2 (c(1, 2, 3, NA, 5),TRUE)


#mySum2 (TRUE, c(1, 2, 3, NA, 5))
#Error in if (na.rm == TRUE) { : the condition has length > 1
mySum2 (na.rm = TRUE, c(1, 2, 3, NA, 5))



#12.2 A little complex function


#12.3


