#Read Household Power Consumption Data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#Adding new variable with Date and Time formated
powerData$DateFormated <- strptime(paste(powerData$Date,powerData$Time, sep =" "), format="%d/%m/%Y %T", tz="GMT")

#Select de especific date (01/02/2007 and 02/02/2007)
data2007_02_01 <- (powerData$DateFormated < as.Date("03/02/2007 00:00:00", format= "%d/%m/%Y %T", tz="GMT")) & (powerData$DateFormated > as.Date("31/01/2007 23:59:59", format= "%d/%m/%Y %T", tz="GMT") )
power <- powerData[data2007_02_01,]

logicalGAP <- (!is.na(power$Global_active_power)) & (power$Global_active_power != "?")
gapText <- power$Global_active_power[logicalGAP]
gap <- as.numeric(as.character(gapText))

x <- power$DateFormated

#Open device
png('plot2.png', width = 480, height = 480)
# Make plot
plot(x, gap, pch='.', ylab="Global active power (kilowatts)")
lines(x,gap)

#Close device~Save .png
dev.off()


