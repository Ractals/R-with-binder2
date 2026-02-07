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
ShifftJIS_df <- read.csv ("Vote_ShiftJIS.csv")
#> ShifftJIS_df <- read.csv ("Vote_ShiftJIS.csv")
#Error in type.convert.default(data[[i]], as.is = as.is[i], dec = dec,  : 
#                                invalid multibyte string at '<96>k<8a>C<93><b9>'
ShifftJIS_df <- readr::read_csv ("Vote_ShiftJIS.csv")
tail (ShifftJIS_df, n = 5)


