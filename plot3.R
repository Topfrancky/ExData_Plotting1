power <- read.table("household_power_consumption.txt", header = T,  sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
power <-na.omit(power)
powernew <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
power$datetime <- strptime( paste (powernew$date, powernew$time), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(levels(powernew$Sub_metering_1)[powernew$Sub_metering_1])
Sub_metering_2 <- as.numeric(levels(powernew$Sub_metering_2)[powernew$Sub_metering_2])
png("plot3.png", width = 480, height = 480, units = "px")
plot(dateTime,powernew$Sub_metering_1,type="l",xlab=" ",ylab="Energy Sub Metering",ylim=c(0,40))
lines(dateTime,y=powernew$Sub_metering_2,ylim=c(0,40),col="red")
lines(dateTime,y=powernew$Sub_metering_3,ylim=c(0,40),col="blue")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .75
)
dev.off()

