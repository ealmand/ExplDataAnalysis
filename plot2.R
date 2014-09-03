## Coursera
## Exploratory Data Analysis
## Course Project 1 - plot2.R

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

## Create plot 2
plot2 <- plot(subdata$time, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

## Create png of plot 2
dev.copy(png, width = 480, height = 480, file = "plot2.png")
dev.off()

## end plot2.R