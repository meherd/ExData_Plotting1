library(dplyr)

## Read Data
newFile <- read.table("~/Coursera/Course 4 Week 1 Assignment/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)

newFile$DateTime <- paste(newFile$Date, newFile$Time)
newFile$DateTime <- as.Date(newFile$DateTime, format = "%d/%m/%Y %H:%M:%S")

## subset data by date
subsetted <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

### Plot Histogram, open plot window on mac
quartz()
## Drawing a histogram, using the Global_active_power variable
hist(subsetted$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

## Copy to png file

dev.copy(png, filename ="plot1.png", width = 480, height = 480)
dev.off()




