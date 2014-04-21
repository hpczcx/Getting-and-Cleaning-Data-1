setwd("C:/Users/dsbmac/Documents/Professional Development/Getting and Cleaning Data/Quiz 1")

# Question 1
fileUrl1 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl1,destfile="./housing.csv",mode="wb")
housing = read.csv("housing.csv")
housing$FES[1:100]

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

# Question 4
library(XML)

fileUrl4 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc4 = xmlTreeParse(fileUrl4, useInternal=TRUE)
rootNode <- xmlRoot(doc4)

# extract menu item names
zipcodes = xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcodes)
table(zipcodes==21231)

# Question 5
install.packages("data.table")
library("data.table")
DT = fread("getdata-data-ss06pid.csv")
str(DT)

DT[,mean(pwgtp15),by=SEX]

