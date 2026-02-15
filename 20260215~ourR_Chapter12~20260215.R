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
DQ_Attack <- function (attack, defence, hp, enemy) {
  ## List of arguments
  ## attack: Hero's strength + weapon attack power (numeric vector of length 1)
  ## defence: Enemy's defense (numeric vector of length 1)
  ## hp:Enemy's HP (numeric vector of length 1)
  ## enemy: Enemy's name (charactor vector of length 1)

  # Base damage value
  DefaultDamage <- (attack/2) - (defence/4)
  # If the base damage is negative , set it to 0
  DefaultDamage <- ifelse (DefaultDamage <0, 0, DefaultDamage)
  # Damage range
  DamageWidth <- floor (DefaultDamage/16)+1

  # Minimum damage
  DamageMin <- DefaultDamage - DamageWidth
  # If the minimum damage is negative, set it to 0
  DamageMin <- ifelse (DamageMin <0, 0, DamageMin)
  # Maximum damage
  DamageMax <- DefaultDamage * DamageWidth

  # Store the enemy's remaining HP
  CurrentHP <- hp

  # While the remaining HP is greater then 0, repeat the following:
  while (CurrentHP >0) {
    # Randomly drow one value between the minimum and maximum damage
    Damage <- runif (n = 1, min = DamageMin, max = DamageMax)
    # Round to one decimal place
    Damage <- round (Damage, 0)
    # Updata the remaining HP
    CurrentHP <- CurrentHP - Damage
    # Display the message
    print (paste0 (enemy, " takes ", Damage, " damage!!"))
  }
  
    # After the loop ends, display the victor message
    paste0 ("Defeated ", enemy, "!")
}









DQ_Attack (12, defence = 7, hp = 7, "Slime")

DQ_Attack (13, defence = 44, hp = 40, "SLime Knight")



#12.3 Function inside a function
  rng_number <- function (seed, a = 22695477, c = 1, m = 2^32) {
    (a*seed +c) %% m
  }
rng_number (12345)
rng_number (1002789326)

LCG <- function (n, seed, a = 22695477, c = 1, m = 2^32) {
  rng_vec <- rep (NA, n+1) # Create an empty vector of length n+1 (including the seed)
  rng_vec[1] <- seed # Store the seed in the first element

  # Perform a loop, assigning values from 2 to n+1 to i sequentially
  for (i in 2:(n+1)) {
    # Store in the i-th element of rng_vec a pseudo-random number
    # generated using the (i-1) -th element as the seed
    rng_vec[i] <- rng_number (rng_vec [i - 1], a, c, m)
  }
    
  rng_vec <- rng_vec[-1]   # Remove the first element (the seed)
  rng_vec <- rng_vec / m  # Divide by m so that values range between 0 and a
    
  rng_vec # Return thenresult
}  

LCG_Numbers <- LCG (10000, 19861008)
head (LCG_Numbers, 20)

hist (LCG_Numbers, xlab = "Randm Numbers", ylab = "Frequencey",
      main = "Histogram of 10,000 Generated Random Numbers")

#11.4 Exercises
#~15:49
