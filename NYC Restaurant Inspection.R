#Download and Choose Where NYC Restaurant Health Inspections from NYC Open Data Is Located On Your Local Computer
csv.data <- read.csv(file.choose())

#Change Data in "GRADE.DATE" column to be of the "Date" Class and Sort by most recent 
csv.data$GRADE.DATE <- as.Date(csv.data$GRADE.DATE, "%m/%d/%y")
ordered_by_date <- csv.data[order(csv.data$GRADE.DATE, decreasing = TRUE),]

#Narrow Data to Contain No Duplicates and Most Recent Grade
unique_restaurants <- ordered_by_date[!duplicated(ordered_by_date[2:5]),]
unique_restaurants <- unique_restaurants[!duplicated(unique_restaurants[4:7]),]
unique_restaurants <- unique_restaurants[,c("DBA", "BUILDING", "STREET", "ZIPCODE", "PHONE", "INSPECTION.DATE", "CUISINE.DESCRIPTION", "GRADE", "SCORE", "BORO")]

#Frequency Plot that Shows Distribution of Grades over New York City Boroughs
library(plyr)
library(ggplot2)
library(RSvgDevice)
counts <- count(unique_restaurants, c("GRADE", "BORO"))
counts <- counts[order(counts$GRADE, counts$BORO),]
ggplot(counts, aes(x=GRADE, y=freq)) +geom_point(aes(color=BORO))


#Function that Takes Name and Optional Parameter Zipcode as Input and Returns a Data Frame that is a Subset of "unique_restaurants"
restaurant_inspections <- function(name, zipcode=NULL){
  name <- toupper(name)
  query <- subset(unique_restaurants, grepl(name, unique_restaurants$DBA))
  if(!(is.null(zipcode))){
    query <- query[which(query$ZIPCODE==zipcode),]
  }
  return(query[c("DBA", "BUILDING", "STREET", "GRADE")])
}

