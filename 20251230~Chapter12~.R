#2025123015:12~
#pacman::p_load (rio, here, kableExtra, tidyverse)
#install.packages ("rio")
#install.packages ("here")
#install.packages ("kableExtra")
#install.packages ("tidyverse")

library (rio)
library (here)
library (kableExtra)
#library (tidyverse)

install.packages ("pacman")
pacman::p_load (rio, here, kableExtra, tidyverse)

download.file ("https://github.com/appliedepi/epiRhandbook_eng/raw/master/data/malaria_facility_count_data.rds", "malaria_facility_count_data.rds")
count_data <- readRDS ("malaria_facility_count_data.rds")
head (count_data, 5)


ggplot (count_data) +
  geom_col (aes (x = data_date, y = malaria_tot), width = 1)

data <- count_data |>
  pivot_longer (
    cols = 
  )
