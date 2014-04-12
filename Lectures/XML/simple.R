library(XML)

fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL, useInternal=TRUE)
str(doc)
doc
rootNode <- xmlRoot(doc)
str(rootNode)
xmlName(rootNode) 

names(rootNode)

# reference certain elements of the rootNode
rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[1]][[4]]

xmlSApply(rootNode, xmlValue)

# extract menu item names
xpathSApply(rootNode,"//name",xmlValue)

# extract menu item price
xpathSApply(rootNode, "//price", xmlValue)

xpathSApply(rootNode, "//description", xmlValue)

