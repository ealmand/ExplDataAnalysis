## Coursera
## Exploratory Data Analysis
## Course Project 1 - plot1.R

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

## read data
data <- read.csv2("./data/household_power_consumption.txt", header=T, as.is = TRUE)

## Convert Date to "Date" class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02") 

## Transform Global_active_power column to numeric class
class(subdata$Global_active_power)="numeric"

## Create plot1 histogram
plot1 <- hist(subdata$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Create png of plot1
dev.copy(png, width = 480, height = 480, file = "plot1.png")
dev.off()

## end plot1.R