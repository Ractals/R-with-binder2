#20260207 20:10~
#Data stractures
#10.1 What is a data structure?
#10.2 Vector
#10.2.1 How to create a vector
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
#Method1
Matrix1 <- matrix (c (1, 5, 9, 2, 6, 10, 3, 7, 11, 4, 8, 12), nrow = 3)
Matrix1

#Methd2
Matrix2 <- matrix (c(1, 5, 9, 2, 6, 10, 3, 7, 11, 4, 8, 12), nrow = 4)
Matrix2


(matrix (c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), nrow = 3, byrow = TRUE))

(matrix (1:12, nrow = 3, byrow = T))

class (Matrix1)

#Identity matrix
(diag (4))

#10.3.2 Operating matrix
A <- matrix (c (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
             nrow = 3, byrow = T
             )
A


#Matrix size
dim (A)
nrow (A)
ncol (A)

#Extranting elements
A[2, 3]

A[2,]
A[, 3]

is.vector (A[2, 3])
is.vector (A[2,])
is.vector (A[,3])
A[1:2, 3:4]
A[c(1, 2), c(3, 4)]
class (A[1:2, 3:4])

A
(A_plus_5 <- A+5)

(A_minus_10 <- A-10)

(B <- matrix (c(3, 2, 1, 4, 5, 9, 7, 11, 6, 12, 8, 10), nrow = 3, byrow = T))

A+B

A-B
(C <- B[, 1:3])
A+C
#ERROR1
#Error in A + C : non-conformable arrays

#Matrix multiplication
A * 2
A*B
B*A

(C <- matrix (c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = T))
(D <- matrix (c(2, 7, 17, 3, 11, 19, 5, 13, 23), nrow = 3, byrow = T))
(E <- C %*% D)


#Determinant
(F <- matrix (c(2, -6, 4, 7, 2, 3, 8, 5, -1), nrow = 3, byrow = 3))
#The determinant of a matrix is generall denoted as det(A) or |A|.
det (F)

(G <- matrix (c (2, -6, 4, 1, -3, 2, 5, 9, 3), nrow = 3, byrow = 3))
det (G)

#Rank
qr (F)$rank
qr (G)$rank

#Inverse matrix
(A <- matrix (c (1, -2, 2, 0, 1, -1, 1, 0, 1), nrow = 3))
(Ap <- solve (A))
A%*%Ap


#Transpose
A <- matrix (1:9, byrow = T, nrow = 3)
A

#10.4 data.frame
#10.4.1 Create a data.frame
myDF <- data.frame (
  ID = 1:4,
  Name = c("Yanai", "Song", "Shigemura", "Tani"),
  Math = c(50, 90, 100, 80),
  Stat = c(25, 5, 100, 85)
)
myDF

class (myDF)
myDF_ID <- 1:4
myDF_Name <- c("Yanai", "Song", "Shigemura", "Tani")
myDF_Math <- c(50, 90, 100, 80)
myDF_Stat <- c(25, 5, 100, 85)
myDF2 <- data.frame (myDF_ID, myDF_Name, myDF_Math, myDF_Stat)
myDF2

myDF == myDF2

myDF3 <- data.frame (
  ID = myDF_ID,
  Name = myDF_Name,
  Math = myDF_Math,
  Stat = myDF_Stat
)
myDF3

myDF4 <- data.frame (
  ID = 1:4,
  Name = c("Yanai", "Song", "Shimura", "Tani"),
  Math = c(50, 90, 100, 80),
  State = c(25, 5, 100, 85),
  City = "Kobe",
  Food = c("Ramen", "Udon")
)
myDF4
#~21:25


#20260208 14:41~
#10.4.2 Operating data.frame
#Size of data.frame
dim (myDF4)
nrow (myDF4)
ncol (myDF4)

#Extracting elements
myDF4 [2,6]
myDF4 [3:4,]
myDF4 [c(3:4),]


myDF4 [, 6]
myDF4 [, "Name"]
myDF4$Name
myDF4$Name [2]

# Operation                Returned data type
 #Extract one row          Data frame
 #Extract multiple rows    Data frame
 #Extract one column       Vector
 #Extract multiple columns Data frame


#Modifying cells
myDF4 [3, 3] <- 0
myDF4

myDF4$City[c(1,2)] <- c("Kochi", "Kyoto")
myDF4

#Adding or modifying columns
myDF4$English <- c(95, 50, 80, 5)
myDF4
English_Score <- c(95, 50, 80, 0)
myDF4$English <- English_Score
myDF4


myDF4$English <- myDF4$English +5
myDF4
myDF04 <- myDF4
#Avoid adding or modifying rows wherenever possible
myDF4[5, ] <- c(5, "Hakiai", 50, 50, "Ashiya", "Jiro", 50)
myDF4

myDF4$Stat
class (myDF4$Stat)
#The Stat column, which should originally be of type numeric, has become a character type.
#The reason is obvious.
#This is because all elements in a vector must be of the same data type.
#When numeric and character types are mixed, they are automatically coerced to the (higher-priority) character type.
#You can understand that the following two commands are equialent.
# Case1
myDF4[5, ] <- c(5, "Hakiai", 50, 50, "Ashiya", "Jiro", 50)
class (myDF4$Stat)
# Case2
Hakiai_Data <- c(5, "Hakiai", 50, 50, "Ashiya", "Jiro", 50)
myDF4[5, ] <- Hakiai_Data
class (myDF4$Stat)

#Removing the fifth row does not solve the problem, so in the end it is necessary to forcibly change the data type of the column.
myDF4$ID <- as.numeric (myDF4$ID)
myDF4$Stat <- as.numeric (myDF4$Stat)
myDF4$Math <- as.numeric (myDF4$Math)
myDF4$English <- as.numeric (myDF4$English)
class (myDF4$Stat)


#If you really need to add a row, you can do it in the following way, 
#but this is not recommended.
myDF04[6, ] <- rep (NA, 7)  #Add the 6th row to myDF4 and assign seven missing values
myDF04$ID [6] <- 6          #Assign 6 to the 6th element of myDF4$ID
myDF04$Name [6] <- "Yukawa" #Assign "Yukawa" to the 6th element of myDF4$Name
myDF04$Math [6] <- 80       #The rest is omitted
myDF04$Stat [6] <- 30
myDF04$City [6] <- "Hiroshima"
myDF04$Food [6] <- "Ramen"
myDF04$English [6] <- 90
myDF04
class (myDF4$English)

#10.4.3 tibble
download.file ("https://www.jaysong.net/RBook/Data/Vote.csv", "Vote.csv")
VoteDF1 <- read.csv ("Vote.csv")
install.packages("tidyverse")
library (tidyverse)
#as_tibble
#VoteDF2 <- tidyverse::as_tibble (VoteDF1)
VoteDF2 <- as_tibble (VoteDF1)
class (VoteDF2)

head (VoteDF1, 5)
head (VoteDF2, 5)

VoteDF3 <- read_csv ("Vote.csv")
class (VoteDF3)

#10.5 list
#10.5.1 Create list-type data
download.file ("https://www.jaysong.net/RBook/Data/FIFA_Women.csv", "FIFA_Women.csv")
download.file ("https://www.jaysong.net/RBook/Data/FIFA_Men.csv", "FIFA_Men.csv")
Sccoer_W <- read.csv ("FIFA_Women.csv")
Sccoer_M <- read.csv ("FIFA_Men.csv")
Sccoer_W <- Scoer_W [1:10,]
Sccoer_M <- Scoer_M [1:10,]

List1 <- list (Sccoer_W, Sccoer_M)
class (List1)
List1

List2 <- list (Women = Sccoer_W, Men = Sccoer_M)
List2

#10.5.2 Operating list-type data 
#Using element indices
List1[[1]]
class (List1[[1]])
List1[[1]][3,]
#From here, to futher extract the data in the third row, append [3,] after[[]].

List1[1]
class (List1[1])
List1[1][3,]
#ERROR2
#Error in List1[1][3, ] : incorrect number of dimensions

#Using element names
List2[["Men"]]

List2$Men
class(List2[["Men"]])

List2[["Men"]][10,]
List2$Men[10,]


#10.6 array