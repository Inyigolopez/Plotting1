#Read Household Power Consumption Data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#Adding new variable with Date and Time formated
powerData$DateFormated <- as.Date(paste(powerData$Date,powerData$Time, sep =" "), format="%d/%m/%Y %H:%M:%S")

#Select de especific date (01/02/2007 and 02/02/2007)
data2007_02_01 <- (powerData$DateFormated < as.Date("03/02/2007 00:00:00", format= "%d/%m/%Y %H:%M:%S")) & (powerData$DateFormated > as.Date("31/01/2007 23:59:59", format= "%d/%m/%Y %H:%M:%S") )
power <- powerData[data2007_02_01,]