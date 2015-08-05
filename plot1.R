# In the dataset missing values are coded as ? but none of the values in the required subsets have ?
# so this information is ignored in all the plots

# use dplyr for selection and filtering
library(dplyr)

# read the complete dataset storing date/time as characters
data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
                 
# stores the two dates of interest
dates <- as.Date(c("01/02/2007","02/02/2007"),format("%d/%m/%Y"))

# overwrite the existing dataset with the required dates subset in interest of saving memory (2880 observations)
# data <- data[as.Date(data$Date,format("%d/%m/%Y")) %in% dates,]
# the above works but using dplyr as the preferred method

# select the required columns and filter the rows using dplyr
reqData <- select(data,Date,Global_active_power) %>% filter(as.Date(Date,format("%d/%m/%Y")) %in% dates)

# Plot the graph on screen to test and then just create it in png device with required parameters 
png(filename="plot1.png", width=480, height=480, units="px")
hist(as.numeric(reqData$Global_active_power),xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power", col="red")
dev.off()