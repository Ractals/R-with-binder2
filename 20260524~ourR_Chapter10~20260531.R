#20260524
#24:03~


#10.1 date structure

#10.2 vector
#10.2.1 create vector
myVec1 <- "R is fun!"
myVec1

myVec2 <- c(1, 3, 5, 6, 7)
myVec2

myVec3 <- c ("A", "B", "C", 1, 2, 3)
myVec3
class (myVec3)

myVec4 <- c(1, 2, 3, TRUE, FALSE)
myVec4
class (myVec4)

#10.2.2 Vector operations
length (myVec1)

length (myVec2)

length (myVec3)

length (myVec4)

myVec2 +5
myVec2 -5
myVec2 *5
myVec2 /5
myVec2 ^5


myVec2 + myVec4

myVec2 - myVec4

myVec2 * myVec4

myVec2 / myVec4

(myVec5 <- c (1, 10))
(myVec6 <- myVec2 + myVec5)



#10.3 matrix
#10.3.1 create matrix
Matrix1 <- matrix (c(1, 5, 6, 2, 6, 10, 3, 7, 11, 4, 8, 12), nrow = 3)
Matrix1

Matrix2 <- matrix (c(1, 5, 6, 2, 6, 10, 3, 7, 11, 4, 8, 12), ncol = 4)
Matrix2

Matrix3 <- matrix (c(1, 5, 6, 2, 6, 10, 3, 7, 11, 4, 8, 12), nrow = 3, byrow = TRUE)
Matrix3

Matrix4 <- matrix (1:12, nrow = 3, byrow = TRUE)
Matrix4
class (Matrix4)

(diag (4))

(diag (5))

#10.3.2 matrix operations
A <- matrix (c(1:12, nrow = 3, byrow = TRUE))
dim (A)
A <- matrix (1:12, nrow = 3, byrow = TRUE)
A <- matrix (c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), nrow = 3, byrow = TRUE)
A <- matrix (c(1:12), nrow = 3, byrow = TRUE)
dim (A)
nrow (A)
ncol (A)


A
A [2, 3]
A [2, ]
A [ , 3]
is.vector (A [2, 3])
is.vector (A [2,])
is.vector (A [, 3])


A [1:2, 3:4]
class (A [1:2, 3:4])


(A_plus_5 <- A + 5)
(A_mainus_10 <- A - 10)

(B <- matrix (c (3, 2, 1, 4, 5, 9, 7, 11, 6, 12, 8, 10),
              nrow = 3, byrow = TRUE))
A + B
A - B
A * B

(C <- B [, 1:3])
A + C


A * 2
A * B

(C <- matrix (c (1:6), nrow = 2, byrow = TRUE))
(D <- matrix (c (2, 7, 17, 3, 11, 19, 5, 13, 23), nrow = 3, byrow = TRUE))

(E <- C %*%D)

(F <- matrix (c(2, -6, 4, 7, 2, 3, 8, 5, -1), nrow = 3, byrow = TRUE))
det (F)


(G <- matrix (c (2, -6, 4, 1, -3, 2, 5, 9, 3), nrow = 3, byrow = TRUE))
det (G)



qr (F)$rank
qr (G)$rank

(A <- matrix (c (1, -2, 2, 0, 1, -1, 1, 0, 1), nrow = 3, byrow = TRUE))

(Ainv <- solve (A))


A %*% Ainv

A <- matrix (1:9, byrow = TRUE, nrow = 3)
A
(At <- t (A))

#20260524~25:01



#20260530 24:39~
#10.4 data.frame
#10.4.1 create data.frame
myDF <- data.frame (
                    ID = 1:4,
                    Name = c ("Yanai", "Song", "Shigemura", "Tani"),
                    Math = c (50, 90, 100, 80),
                    Stat = c (25,  5, 100, 85)
                    )
class (myDF)


myDF_ID <- 1:4
myDF_Name <- c ("Yanai", "Song", "Shigemura", "Tani")
myDF_Math <- c (50, 90, 100, 80)
myDF_Stat <- c (25,  5, 100, 85)
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

myDF2 == myDF3

myDF4 <- data.frame (
                      ID = 1:4,
                      Name = c ("Yanai", "Song", "Shigemura", "Tani"),
                      Math = c (50, 90, 100, 80),
                      Stat = c (25,  5, 100, 85),
                      City =    "Kobe",
                      Food = c ("Ramen", "Udon")
                    )
myDF4
myDF2 == myDF4



#10.4.2 data.frame operation
dim (myDF4)


nrow (myDF4)


ncol (myDF4)


#Extraction of elements
myDF4 [2, 6]
myDF4 [3:4, ]
myDF4 [, 6]
myDF4 [, "Name"]
myDF4$Name
myDF4$Name [2]


# Modify a cell
myDF4_2 <- myDF4
myDF4_2
myDF4_2 [3, 3] <- 0
myDF4 == myDF4_2

myDF4_3 <-myDF4_2
myDF4_3$City [c (1, 2)] <- c ("Kochi", "Kyoto")
myDF4_3
myDF4_2 == myDF4_3

#add or modify columns
myDF4_4 <- myDF4_3
myDF4_3$English <- c (95, 50, 80, 5)
English_Score <- c (95, 50, 80, 5)
myDF4_5 <- myDF4_4
myDF4_5$English <- English_Score
myDF4_5

myDF4_6 <- myDF4_5
myDF4_6$English <- myDF4_5$English +5
myDF4_6

#Avoid adding or odifying rows whenever possible.
myDF4_7 <- myDF4_6
myDF4_7 [5, ] <- c (5, "Hakiai", 50, 50, "Ashiya", "Jiro", 50)
myDF4_7


myDF4_7$Stat

class (myDF4_7$Stat)

myDF4_8 <- myDF4_7
myDF4_8 [5, ] <- c (5, "Hakiai", 50, 50, "Ashiya", "Jiro", 50)

myDF4_9 <- myDF4_7
Hakiai_Data <- c (5, "Hakiai", 50, 50, "Ashiya", "Jiro", 50)
myDF4_9 [5, ] <- Hakiai_Data

myDF4_9 == myDF4_8

myDF4_10 <- myDF4_7
myDF4_10$ID <- as.numeric (myDF4_10$ID)
myDF4_10$Math <- as.numeric (myDF4_10$Math)
myDF4_10$Stat <- as.numeric (myDF4_10$Stat)
myDF4_10$English <- as.numeric (myDF4_10$English)
class (myDF4_10$Math)



myDF4_11 <- myDF4_10
myDF4_11$Name [6] <- "Yukawa"
myDF4_11$Math [6] <- 80
myDF4_11$Stat [6] <- 30
myDF4_11$City [6] <- "Hiroshima"
myDF4_11$Food [6] <- "Ramen"
myDF4_11$English [6] <- 90
myDF4_11

myDF4_12 <- myDF4_10
myDF4_12 [6, ] <-rep (NA, 7)
myDF4_12$Name [6] <- "Yukawa"
myDF4_12$Math [6] <- 80
myDF4_12$Stat [6] <- 30
myDF4_12$City [6] <- "Hiroshima"
myDF4_12$Food [6] <- "Ramen"
myDF4_12$English [6] <- 90
myDF4_12

myDF4_11 == myDF4_12


class (myDF4_12$English)



#10.4.3 tibble

download.file ("https://www.jaysong.net/RBook/Data/Vote.csv", "Vote.csv")
VoteDF1 <- read.csv ("Vote.csv")
#??as_tibble
install.packages ("dplyr")
library (dplyr)
VoteDF2 <- as_tibble (VoteDF1)
class (VoteDF1)
class (VoteDF2)

VoteDF1
VoteDF2

#??read_csv
install.packages ("readr")
#library (readr)
#library (read_dlim)
VoteDF3 <- read_csv ("Vote.csv")
class (VoteDF3)


#10.5 list
#10.5.1 create list data.
download.file ("https://www.jaysong.net/RBook/Data/FIFA_Women.csv", "FIFA_Women.csv")
download.file ("https://www.jaysong.net/RBook/Data/FIFA_Men.csv", "FIFA_Men.csv")
Soccer_W <- read.csv ("FIFA_Women.csv")
Soccer_M <- read.csv ("FIFA_Men.csv")
Soccer_W_1 <- Soccer_W
Soccer_M_1 <- Soccer_M
Soccer_W_1 <- Soccer_W_1 [1:10, ]
Soccer_M_1 <- Soccer_M_1 [1:10, ]

List1 <- list (Soccer_W_1, Soccer_M_1)
List1


List2 <- list (Women = Soccer_W_1, Men = Soccer_M_1)
List2

#10.5.2 list operation
List1 [[1]]
class (List1 [[1]])
List1 [1]

class (List1[1])


List1 [1] [3, ]

# Using Element Names
List2 [["Men"]]


class (List2 [["Men"]])


class (List2$Men)


List2[["Men"]][10, ]
List2$Men [10, ]



#20260530 ~25:58


#20260531 23:57~
#10.6 array
Mat1 <- matrix (sample (1:12, 12, replace = TRUE), byrow = TRUE, nrow = 3)
Mat2 <- matrix (sample (1:12, 12, replace = TRUE), byrow = TRUE, nrow = 3)
Mat3 <- matrix (sample (1:12, 12, replace = TRUE), byrow = TRUE, nrow = 3)
Mat4 <- matrix (sample (1:12, 12, replace = TRUE), byrow = TRUE, nrow = 3)
Mat1
Mat2
Mat3
Mat4

Array1 <- array (c (Mat1, Mat2, Mat3, Mat4),dim = c (3, 4, 4))
class (Array1)
Array1


#10.6.2 array operation

Array1 [, , 3] == Mat3


Array1 [3, 1, 2] == Mat2 [3, 1]

Array1 [2, , ]

Array1 [1:2, 1:2, ]

Array2 <- array (c (Mat1, Mat2, Mat3, Mat4), dim = c (3, 4, 4),
                 dimnames = list (
                                  NULL,
                                  NULL,
                                  c ("M1", "M2", "M3", "M4")
                                  )
                 )
Array2


Array2 [, , "M4"]

Array2 [, , 4]



#Naming Rows and Columns
#20260531 ~24:16