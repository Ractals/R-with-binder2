#20260207
#13:00~

#8 Data input and output
install.packages ("pacman")
library (pacman)

#8.1 input data
#8.1.1 In the case of an CSV file
download.file ("https://www.jaysong.net/RBook/Data/FIFA_Women.csv", "FIFA_Women.csv")
my_df1 <- read.csv ("FIFA_Women.csv")
head (my_df1, 10)
tail (my_df1, n = 9) # last n (= 9) rows

#8.1.2 About encoding
download.file ("https://www.jaysong.net/RBook/Data/Vote_ShiftJIS.csv", "Vote_ShiftJIS.csv")
ShiftJIS_df <- read.csv ("Vote_ShiftJIS.csv")
#> ShifftJIS_df <- read.csv ("Vote_ShiftJIS.csv")
#Error in type.convert.default(data[[i]], as.is = as.is[i], dec = dec,  : 
#                                invalid multibyte string at '<96>k<8a>C<93><b9>'
ShiftJIS_df <- readr::read_csv ("Vote_ShiftJIS.csv")
tail (ShiftJIS_df, n = 5)


#1.Specifying the fileEncoding argument in the read.csv() function
ShiftJID_df2 <- read.csv ("Vote_ShiftJIS.csv", fileEncoding = "Shift_JIS")
head (ShiftJID_df2)
#When reading a UTF-8 file on Windows, it is recommended to specify fileEncoding = "UTF-8"

#2.Specifying the locale argument in the read_csv() function
#??locale
ShiftJIS_df3 <- readr::read_csv ("Vote_ShiftJIS.csv", locale = readr::locale (encoding = "Shift_JIS"))
head (ShiftJIS_df3)

#3.Using LibreOffice and similar tools
download.file ("https://www.jaysong.net/RBook/Data/Vote.csv", "Vote.csv")
UTF8_df <- read.csv ("Vote.csv") #For macOS User
head (UTF8_df)
UTF8_df <- read.csv ("Vote.csv", fileEncoding = "UTF-8") #For Windows User
head (UTF8_df)


#8.1.3 Other format
download.file ("https://www.jaysong.net/RBook/Data/Soccer.xlsx", "Soccer.xlsx")
#??read_xlsx
Excel_DF <- readxl::read_xlsx ("Soccer.xlsx", sheet = 1)
Excel_DF


download.file ("https://www.jaysong.net/RBook/Data/Soccer.dta", "Soccer.dta")
#??read_dta
Stata_DF <- haven::read_dta ("Soccer.dta")
tail (Stata_DF, n = 2)

#8.1.4 In the case of an RData file
#Befor loading Scores.RData, let's use the ls() function to check which objects exist in the current execution environment.
ls ()
download.file ("https://www.jaysong.net/RBook/Data/Scores.RData", "Scores.RData")
load ("Scores.RData")
ls ()
#We can see that objects named MathScore and EnglishScore have been added.


#Thus, loading an .RData file using load() is different from reading .csv or .xlsx files. The following two points are the key differences.
#An .RData file can contain multiple datasets within a single file.
#Because R objects are stored inside an .RData file, there is no need to assign names to them when loading the file.
#To confirm that the data have been loaded correctly, let's examine the contents of each object.

head (MathScore)
tail (EnglishScore)


#~14:13
#14:53~
#8.2 Output data
#8.2.1CSV file
#create data
my_data <- data.frame (
  ID = 1:5,
  Name = c("Aさん", "Bさん", "Cさん", "Dさん", "Eさん"),
  Score = c(50, 75, 60, 93, 51)
)
my_data
#??write_csv
readr::write_csv (my_data, file = "my_data.csv")


#8.2.2RData file
numeric_vec1 <- c(1, 5, 3, 6, 99, 2, 8)
numeric_vec2 <- 1:20
character_vec <- c("cat", "cheetah", "lion", "tiger")
save (my_data, numeric_vec1, numeric_vec2, character_vec, file = "my_RData.RData")

#delete files
rm (my_data)
rm (numeric_vec1)
rm (numeric_vec2)
rm (character_vec)
numeric_vec1

#Delete all at once
numeric_vec1 <- c(1, 5, 3, 6, 99, 2, 8)
numeric_vec2 <- 1:20
character_vec <- c("cat", "cheetah", "lion", "tiger")
save (numeric_vec1, numeric_vec2, character_vec, file = "my_RData.RData")
ls ()

rm (list = c("numeric_vec1", "numeric_vec2", "character_vec"))
ls ()

#create save as again
numeric_vec1 <- c(1, 5, 3, 6, 99, 2, 8)
numeric_vec2 <- 1:20
character_vec <- c("cat", "cheetah", "lion", "tiger")
save (numeric_vec1, numeric_vec2, character_vec, file = "my_RData.RData")

load (my_RData.RData)
ls ()


#15:06