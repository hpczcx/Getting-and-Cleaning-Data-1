setwd("C:/Users/dsbmac/Documents/Professional Development/Getting and Cleaning Data/Lectures/Baltimore Traffic")

if(!file.exists("data")) {dir.create("data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.xlsx", mode="wb")
dateDownloaded <- date()

library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)