#Read Household Power Consumption Data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#Adding new variable with Date and Time formated
powerData$DateFormated <- strptime(paste(powerData$Date,powerData$Time, sep =" "), format="%d/%m/%Y %T", tz="GMT")

#Select de especific date (01/02/2007 and 02/02/2007)
data2007_02_01 <- (powerData$DateFormated < as.Date("03/02/2007 00:00:00", format= "%d/%m/%Y %T", tz="GMT")) & (powerData$DateFormated > as.Date("31/01/2007 23:59:59", format= "%d/%m/%Y %T", tz="GMT") )
power <- powerData[data2007_02_01,]

logicalESM1 <- (!is.na(power$Sub_metering_1)) & (power$Sub_metering_1 != "?")
ESM1Text <- power$Sub_metering_1[logicalESM1]
energySM1 <- as.numeric(as.character(ESM1Text))

logicalESM2 <- (!is.na(power$Sub_metering_2)) & (power$Sub_metering_2 != "?")
ESM2Text <- power$Sub_metering_2[logicalESM2]
energySM2 <- as.numeric(as.character(ESM2Text))

logicalESM3 <- (!is.na(power$Sub_metering_3)) & (power$Sub_metering_3 != "?")
ESM3Text <- power$Sub_metering_3[logicalESM3]
energySM3 <- as.numeric(as.character(ESM3Text))

x <- power$DateFormated

png('plot3.png', width = 480, height = 480)

plot( x, energySM1, type='l', ylab="Energy sub metering")
lines(x, energySM2, col="blue")
lines(x, energySM3, col ="red")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "blue", "red"))

dev.off()
