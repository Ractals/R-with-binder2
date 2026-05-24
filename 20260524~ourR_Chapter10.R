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



#10.4