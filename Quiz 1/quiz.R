setwd("C:/Users/dsbmac/Documents/Professional Development/Getting and Cleaning Data/Quiz 1")


# Question 3
if(!file.exists("data")) {dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,destfile="./data/ngap.xlsx",mode="wb")
dateDownloaded <- date()

library(xlsx)

colIndex <- 6:14
rowIndex <- 18:23
dat <- read.xlsx("./data/ngap.xlsx",sheetIndex=1,
 colIndex=colIndex,rowIndex=rowIndex, header=TRUE)

dat

 sum(dat$Zip*dat$Ext,na.rm=T)

