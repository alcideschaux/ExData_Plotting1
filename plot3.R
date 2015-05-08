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

# Combining date and time for plotting
library(lubridate)
datetime <- dmy_hms(paste(day2$Date, day2$Time))

# Ploting Figure 3
png(file = "plot3.png", width = 480, height = 480)
plot(datetime, day2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, day2$Sub_metering_2, type = "l", col = "red")
lines(datetime, day2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1))
dev.off()
