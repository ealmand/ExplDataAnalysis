## Coursera
## Exploratory Data Analysis
## Course Project 1 - plot3.R

## set working directory
setwd("~/Data Science/Assignments/electric_power")

## creating a data directory
if (!file.exists("data")) {
        dir.create("data")
}

## download a file and place in "data" directory
if (!file.exists("data/UCIML")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfile="data/projdata.zip"
        download.file(fileUrl, destfile=zipfile)
        unzip(zipfile, exdir="data")
}

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates rather than 
## reading in the entire dataset and subsetting to those dates.

# based on variable values
data <- read.csv2("./data/household_power_consumption.txt", header=T, as.is = TRUE)

## Convert the Date and Time variables to Date/Time class

time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$time <- time 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02") 

## Transform Global_active_power to numeric class
class(subdata$Global_active_power)="numeric"

## Create plot 3
plot(subdata$time, subdata$Sub_metering_1, ,xlab="",ylab="Energy Sub Metering",type="l",col="black")
lines(subdata$time, subdata$Sub_metering_2,type="l",pch=2,col="red")
lines(subdata$time, subdata$Sub_metering_3,type="l",pch=3,col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)

## Create png of plot 3
dev.copy(png, width = 480, height = 480, file = "plot3.png")
dev.off()

## end plot3.R