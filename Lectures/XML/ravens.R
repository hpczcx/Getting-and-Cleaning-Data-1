setwd("C://Users//dsbmac//Documents//Professional Development//Getting and Cleaning Data//Lectures//XML")
library(XML)

fileURL <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileURL, useInternal=TRUE)
scores <- xpathSApply(doc,"//li[@class='score']", xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']", xmlValue)
scores
teams

doc.tabs <- readHTMLTable(doc)
doc.tabs
length(doc.tabs)

# examine which table you want
index = 2
head(doc.tabs[[index]])
tail(doc.tabs[[index]])

doc.table.scores <- doc.tabs[[index]]
doc.table.scores 

doc.table.scores.df = data.frame(matrix(doc.table.scores, nrow=5, byrow=18))
doc.table.scores.df 