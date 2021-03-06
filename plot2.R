## Coursera - Data Science - Universidad Johns Hopkins
## Exploratory Data Analysis - Week 1
## Construct plot 2, "Global Active Power trough 3 days"
## José Mª Sebastián Carrillo

##########
## Step 1.- Read the data from file.
##########

# Author <- "José Mª Sebastián Carrillo"

# Variable that contains the name of the file
dataFile <- "household_power_consumption.txt"

# Define the classes of the data columns
dataFile_colClasses	<- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

## Read from file and stores it in a dataframe
data <- read.table(dataFile, header=TRUE, sep=";", dec=".",
                   stringsAsFactors=FALSE, na.strings="?",
                   colClasses = dataFile_colClasses)

## Create a new column with the date and time merged.
CompleteTimestamp <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, CompleteTimestamp)

## Change the date column to the correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


##########
## Step 2.- Process the data.
##########

# Generate the subset data from 2007-02-01 to 2007-02-02
targetData <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")


##########
## Step 3.- Generate the plot.
##########

## Plot the global active power for those 2 days
with(targetData, plot(CompleteTimestamp, Global_active_power, type="l",
                      xlab="Day", ylab="Global Active Power (kilowatts)"))

# Copy the result to file (png format, dimensions as in webpage)
dev.copy(png, filename="plot2.png", width=504, height=504)

# Close the device
dev.off ()
