power <- read.table("household_power_consumption.txt", header = T,  sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
power <-na.omit(power)
powernew <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
power$datetime <- strptime( paste (powernew$date, powernew$time), "%d/%m/%Y %H:%M:%S")
png("plot1.png", width=480, height=480)
hist(powernew$Global_active_power, 
     breaks = 12,     
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col = "red")
dev.off()