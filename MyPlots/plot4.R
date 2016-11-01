
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
par(mar = c(4,4,2,2))
plot(epc$dateandtime, epc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(epc$dateandtime, epc$Sub_metering_2, col = "red")
lines(epc$dateandtime, epc$Sub_metering_3, col = "blue")

legend(x="topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"))


## Save file as .png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
