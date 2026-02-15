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



#12.2 A slightly more complex function
#Define the DQ_Attack function
  ## List of arguments
  ## attack: Hero's strength + weapon attack power (numeric vector of length 1)
  ## defence: Enemy's defense (numeric vector of length 1)
  ## hp:Enemy's HP (numeric vector of length 1)
  ## enemy: Enemy's name (charactor vector of length 1)

  # Base damage value

  # If the base damage is negative , set it to 0

  # Damage range

  # Minimum damage

  # If the minimum damage is negative, set it to 0

  # Maximum damage

  # Store the enemy's remaining HP

  # While the remaining HP is greater then 0, repeat the following:

    # Randomly drow one value between the minimum and maximum damage

    # Round to one decimal place

    # Updata the remaining HP

    # Display the message

    print (paste0 (enemy " takes ", Damege, " damage!!"))
    
    # After the loop ends, display the victor message
    paste0 ("Defeated ", enemy, "!")

    
    #Slime Knight
#12.3 Function inside a function

  # Create an empty vector of length n+1 (including the seed)
  # Store the seed in the first element
# Perform a loop, assigning values from 2 to n+1 to i sequentially
    # Store in the i-th element of rng_vec a pseudo-random number
    # generated using the (i-1) -th element as the seed
    
    
    # Remove the first element (the seed)
    # Divide by m so that values range between 0 and a
    
    # Return thenresult

    
    
hist (LCG_Numbers, xlab = "Randm Numbers", ylab = "Frequencey",
      main = "Histogram of 10,000 Generated Random Numbers")