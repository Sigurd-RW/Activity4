install.packages("tidyverse")
library(tidyverse)
data <- read.csv("nobel-prize-winners-1.csv", stringsAsFactors = FALSE,fileEncoding = "UTF-8")
data <- data[!duplicated(data), ]
colnames(data) <- tolower(gsub(" ", "_", colnames(data)))
data$name <- gsub("[[:punct:]]", "", data$name)
data <- data %>% select(-c(bornlocation, diedlocation, borncoordinates, diedcoordinates, 
                           borncountry_now, borncity_now, diedcountry_now, diedcity_now))
data <- data %>% rename(
  borncountry = borncountry_original,
  borncity = borncity_original,
  diedcity = diedcity_original,
  diedcountry = diedcountry_original
)
data[data == ""] <- NA
data <- drop_na(data)
data[] <- lapply(data, function(x) if (is.character(x)) iconv(x, from = "UTF-8", to = "ASCII//TRANSLIT") else x)
write.csv(data, "nobel_prize_winners_cleaned.csv", 
          row.names = FALSE, fileEncoding = "UTF-8")
