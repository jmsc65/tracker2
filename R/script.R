##libraries
library(curl)
library(tidyverse)
library(dplyr)
library(lubridate)
library(plyr)                                     
library(readr)   


## PHS Cancelled Planned operations

## 1. Cancelled operations by health board

temp <- tempfile()
source <- "https://www.opendata.nhs.scot/dataset/479848ef-41f8-44c5-bfb5-666e0df8f574/resource/0f1cf6b1-ebf6-4928-b490-0a721cc98884/download/cancellations_by_board_february_2022.csv"
temp <- curl_download(url=source, destfile=temp, quiet=FALSE, mode="wb")

CBHB <- read.csv(temp)

## write csv cancelled ops by health board, new data scraped after automation will be appended

write.table(data, "data/CBHB.csv", 
            sep = ",", col.names = !file.exists("CBHB.csv"),
            append = T, row.names = F)
