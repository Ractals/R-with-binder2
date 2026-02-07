#20260207 20:10~
#Data stractures
#10.1 What is a data structure?
#10.2 Vector
#10.2.1 How to create vectors
myVec1 <- "R is fun!"
myVec1

myVec2 <- c(1, 3, 5, 6, 7)
myVec2

myVec3 <- c("A", "B", "C", 1, 2, 3)
myVec3
class (myVec3)

myVec4 <- c(1, 2, 4, TRUE, FALSE)
myVec4
class (myVec4)


#Vector operations
#Length of a vector
length (myVec1)

length (myVec2)

length (myVec3)

length (myVec4)


#Extracting elements
#You should see chapter 7.3
  #7.3 Extracting elements
  numeric_vec1 <- c(73, 6, 5, 3, 99, 10, 22, 9, 7)
  numeric_vec1 [5]
  numeric_vec1 [-c(1, 4)]
  numeric_vec1 [5:7]
  
  numeric_vec2 <- 1:20
  numeric_vec2 [seq (1, 20, by = 2)]

  character_vec <- c("cat", "cheetah", "lion", "tiger")
  character_vec
  character_vec [c(TRUE, FALSE, TRUE, TRUE)]
  
  (numeric_vec1 %% 2) == 0 #Checking whether a number is even
  numeric_vec1 [(numeric_vec1 %% 2) == 0] #Extracting number of even
  
  #replace values
  numeric_vec1 [2] <- 100
  numeric_vec1
  
  numeric_vec1 [(numeric_vec1 %% 2) == 0] <- 0  #Replace all even values with 0
  
  
  # Insert chap 7 fine
  
#Addition, subtraction, multiplication, and division of vectors
myVec2 +5
myVec2 -5
myVec2 *5
myVec2 /5
myVec2 ^5

myVec2 +myVec4
myVec2 -myVec4
myVec2 *myVec4
myVec2 /myVec4

(myVec5 <- c(1, 10))
(myVec6 <- myVec2 +myVec5)
#Although a warning message is displayed, the calculation itself can still be performed.
#When vectors have the same length, calculations are performed element by element at the corresponding positions.
#In this case, however, the shorter vector is repeated to match the length of the longer one.
#In the case of myVect, it is treated as c(1, 10, 1, 10, 1).


#10.3 matrix
#10.3.1 How to create a matrix





