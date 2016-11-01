
## Getting all the data
epcAll <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

## Changing the Date column to Date class
epcAll$Date <- as.Date(epcAll$Date, format="%d/%m/%Y")

## Subset so we have only the data used to make the plots
epc <- subset(epcAll, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert to POSIX
dateandtime <- paste(as.Date(epc$Date), epc$Time)
epc$dateandtime <- as.POSIXct(dateandtime)

## Plot 2

plot(epc$dateandtime, epc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Save file as .png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()




