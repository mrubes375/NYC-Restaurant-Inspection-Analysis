# NYC-Restaurant-Inspection-Analysis

Using NYC Restaurant Inspection Data from [Socrata NYC Open Data](https://nycopendata.socrata.com/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/xx67-kt59),
I subsetted the CSV file in R to obtain a list of all restaurants in New York City. I then created a frequency plot that models frequency versus grade across each of the five boroughs. In addition, I created a function that querys my data frame of unique restaurants and returns a new data frame of restaurants containing the name searched for with optional zipcode parameter.
