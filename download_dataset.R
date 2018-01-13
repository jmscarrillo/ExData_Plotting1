## Coursera - Data Science - Universidad Johns Hopkins
## Exploratory Data Analysis - Week 1
## Check and download "Individual household electric power consumption Data Set"
## José Mª Sebastián Carrillo

##########
## Step 1.- Check if the downloaded data already exists.
##########

# Author <- "José Mª Sebastián Carrillo"

currentFolder <- getwd()
dataFileZip <- "household_power_consumption.zip"

# Verify the file downloaded
if (!file.exists(dataFileZip)){
    dataFileZipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(dataFileZipUrl, dataFileZip, method="curl")
}

# Verify the file with the data uncompressed
dataSetName <- "household_power_consumption.txt"
dataSet <- file.path(currentFolder, dataSetName)
if (!dir.exists(dataSet)) {
    unzip(dataFileZip)
}
