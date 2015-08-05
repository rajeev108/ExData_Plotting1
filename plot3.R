# use dplyr for selection and filtering
library(dplyr)
# need date & time together so use lubidate
library(lubridate)

# read the complete dataset storing date/time as characters
data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
                 
# stores the two dates of interest
dates <- as.Date(c("01/02/2007","02/02/2007"),format("%d/%m/%Y"))

# select the required columns and filter the rows using dplyr
reqData <- select(data,Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3) %>% 
  filter(as.Date(Date,format("%d/%m/%Y")) %in% dates)

# Plot the graph on screen to test and then just create it in png device with required parameters 
png(filename="plot3.png", width=480, height=480, units="px")
plot(dmy_hms(paste(reqData$Date,reqData$Time)), as.numeric(reqData$Sub_metering_1),
      xlab="",ylab="Energy sub metering",pch="")
lines(dmy_hms(paste(reqData$Date,reqData$Time)), as.numeric(reqData$Sub_metering_1))
lines(dmy_hms(paste(reqData$Date,reqData$Time)), as.numeric(reqData$Sub_metering_2),col="red")
lines(dmy_hms(paste(reqData$Date,reqData$Time)), as.numeric(reqData$Sub_metering_3),col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
dev.off()