### Extracting required columns/rows

Really useful information. We can extract just the relevant columns by using colCLasses attribute. We give the relevant class for the the required columns and just say "NULL" for the unwanted ones. For example we can read the first 3 columns by using the following code:

```
x <- read.csv("household_power_consumption.txt", sep = ";",nrows=100,colClasses=c(rep("character",2),"numeric",rep("NULL",6)))
```

nrows=100 has just been used for illustration and we can omit it for reading the complete file.

The other great alternative is to use the sqldf package. This provide the full flexibility of SQL and we can restrict rows andcolumns as desired. For example to extract just date and time for the date = 2/2/2007;

```
myData <- read.csv.sql(file="household_power_consumption.txt",sep=";",sql="select Date,Time from file where Date='2/2/2007'", eol = "\n")
```
Now that we have the full flexibility of SQL we can change the select statement to meet our any need.

