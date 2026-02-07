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