# quiz 4

setwd("C:/Users/dsbmac/Documents/Professional Development/Getting and Cleaning Data/Quiz 4")

# question 1 

# download file
if(!file.exists("data")) {
  dir.create("data")
}

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile="./data/idaho_housing.csv")
list.files("./data")

# Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
# What is the value of the 123 element of the resulting list?
housingData = read.csv("./data/idaho_housing.csv")
str(housingData)


splitNames = strsplit(names(housingData), "wgtp")

splitNames[123]


# Question 2
# Remove the commas from the GDP numbers in millions of dollars and average them. 

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url, destfile="./data/gdp.csv")
list.files("./data")

gdpData = read.csv("./data/gdp.csv")
str(gdpData)

gdpValues = gdpData$X.3[5:194]
gdpValues = gsub("\\s|,", "", gdpValues)
gdpValues = as.numeric(as.character(gdpValues))


# What is the average? 
mean(gdpValues)

# Question 3
# what is a regular expression that would allow you to count the number of countries whose name begins with "United"? Assume that the variable with the country names in it is named countryNames. 
# How many countries begin with United?

countryNames = levels(gdpData$X.2)
countryNames

grep("United$",countryNames) # doesn't work
grep("^United",countryNames)
grep("*United",countryNames)
grep("^United",countryNames)

countryNames[grep("^United",countryNames)]


# Question 4

# download gdp data
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url, destfile="./data/gdpQuestion4.csv")
list.files("./data")

gdpData4 = read.csv("./data/gdpQuestion4.csv")
str(gdpData4)

# download education data
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url, destfile="./data/educational.csv")
list.files("./data")

edu = read.csv("./data/educational.csv")
str(edu)
str(gdpData4)
names(edu)

match = grep(tolower("Fiscal year end: June"), tolower(edu$Special.Notes))
x = edu$Special.Notes[match]
length(x)

# Question 5
# stocks
# How many values were collected in 2012? 
# How many values were collected on Mondays in 2012?

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
sampleTimes
class(sampleTimes)

# values collected in 2012
match =sampleTimes[format(sampleTimes, "%Y") == "2012"] 
length(match)

# values collected on Mon 2012
length(match[weekdays(match)=="Monday"])
