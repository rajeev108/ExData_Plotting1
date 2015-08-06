### Extracting required columns

Really useful information. We can extract just the relevant columns by using colCLasses attribute. We give the relevant class for the the required columns and just say "NULL" for the unwanted ones. For example we can read the first 3 columns by using the following code:

```
x <- read.csv("household_power_consumption.txt", sep = ";",nrows=100,colClasses=c(rep("character",2),"numeric",rep("NULL",6)))
```

nrows=100 has just been used for illustration and we can omit it for reading the complete file.
