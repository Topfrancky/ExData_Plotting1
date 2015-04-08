power <- read.table("household_power_consumption.txt", header = T,  sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
power <-na.omit(power)
powernew <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
power$datetime <- strptime( paste (powernew$date, powernew$time), "%d/%m/%Y %H:%M:%S")

dateTime  <- as.POSIXlt(paste(as.Date(powernew$Date, format="%d/%m/%Y"), powernew$Time, sep=" "))
png("plot2.png", width=480, height=480)
plot(dateTime,powernew$Global_active_power,
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()