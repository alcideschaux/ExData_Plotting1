# Downloading the dataset
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfil = "EPC.zip", method = "wget")

# Unzipping the dataset
unzip("EPC.zip")

# Loading the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting data from the dates 2007-02-01 and 2007-02-02
library(dplyr)
day2 <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Ploting Figure 1
png(file = "plot1.png", width = 480, height = 480)
hist(day2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
