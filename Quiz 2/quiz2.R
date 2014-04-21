### Quiz 2

setwd("C:/Users/dsbmac/Documents/Professional Development/Getting and Cleaning Data/Quiz 2")

### API
library("httr")
library("jsonlite")

BROWSE("https://api.github.com/users/jtleek/repos",authenticate("598c2699137b575103826f35a8c5a8661af91a26
","x-oauth-basic","basic"))

jsonStuff <-GET("https://api.github.com/users/jtleek/repos",authenticate("598c2699137b575103826f35a8c5a8661af91a26","x-oauth-basic","basic"))
cat(content(stuff, "text"), "\n") 

json1 = content(jsonStuff)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]
head(jsonStuff)
names(jsonStuff)
names(jsonStuff$content)
names(jsonStuff$config)

jsonStuff$headers



parsedHtml 

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

install.packages("sqldf")
library("sqldf")

acs <- read.csv("./data/getdata-data-ss06pid.csv")

a1 = sqldf("select pwgtp1 from acs where AGEP < 50")
a2 = sqldf("select * from acs where AGEP < 50 and pwgtp1")
a3 = sqldf("select * from acs")
str(a2$AGEP)
max(a2$AGEP)
a3
head(a1)

# Question 3
# Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)

# this returns unique age values for the field
q3x = unique(acs$AGEP)

q3a1 = sqldf("select AGEP where unique from acs") == q3x

q3a2 = sqldf("select distinct pwgtp1 from acs")
q3a3 = sqldf("select distinct AGEP from acs")

q3a3 == q3x

### Question 5
t = read.fwf("./data/getdata-wksst8110.for", widths=c(10,5,4,4,5,4,4,5,8,5,4,4), as.is = FALSE, skip=4)
head(t)
sum(t$V6)

q()

