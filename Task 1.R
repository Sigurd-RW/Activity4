install.packages("tidyverse")
library(tidyverse)
data <- read.csv("/cloud/project/nobel-prize-winners-1.csv", stringsAsFactors = FALSE,fileEncoding = "UTF-8")
data <- read.csv("/cloud/project/nobel-prize-winners-1.csv", stringsAsFactors = FALSE, fileEncoding = "UTF-8")
data <- data[!duplicated(data), ]
colnames(data) <- tolower(gsub(" ", "_", colnames(data)))
data$name <- gsub("[[:punct:]]", "", data$name)
@@ -25,11 +26,9 @@ data <- data %>% rename(
  diedcity = diedcity_original,
  diedcountry = diedcountry_original
)
data[data == ""] <- NA
data <- drop_na(data)
data[is.na(data)] <- "Unknown"
data[] <- lapply(data, function(x) if (is.character(x)) iconv(x, from = "UTF-8", to = "ASCII//TRANSLIT") else x)
write.csv(data, "/cloud/project/nobel-prize-winners-1_cleaned.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
write.csv(data, "/cloud/project/nobel-prize-winners-1_cleaned.csv", row.names = FALSE, fileEncoding = "UTF-8")
