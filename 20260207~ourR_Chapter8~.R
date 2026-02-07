#20260207
#13:00~

#8 Data input and output
install.packages ("pacman")
library (pacman)

#8.1 input data
#8.1.1 In the case of an CSV file
download.file ("https://www.jaysong.net/RBook/Data/FIFA_Women.csv", "FIFA_Women.csv")

my_df1 <- read.csv ("FIFA_Women.csv")
head (my_df1)