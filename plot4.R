hhpc <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 2880, skip = 66636, header = TRUE)
headers <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 1, header = TRUE)
colnames(hhpc) <- colnames(headers)

hhpc$Date <- as.Date(strptime(hhpc$Date, "%e/%m/%Y"))

hhpc$Days <- as.factor(weekdays(hhpc$Date))

par(mfrow=c(2,2))

# Top left (plot 2)
plot(hhpc$Global_active_power, type="l", xlab='', ylab ="Global Active Power (kilowatts)", xaxt='n')
axis(side = 1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), tick = TRUE)

# Top right
plot(hhpc$Voltage, type="l", xlab='datetime', ylab ="Voltage", xaxt='n', yaxt='n')
axis(side = 1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), tick = TRUE)
axis(side = 2, at=seq(234, 246,2), label=c(234, "", 238, "", 242, "", 246), tick = TRUE)

# Bottom left (plot 3)
plot(hhpc$Sub_metering_1, type="l", xlab='', ylab ="Energy sub metering", xaxt='n', yaxt='n', ylim=c(0, 40))
lines(hhpc$Sub_metering_2, col="Red")
lines(hhpc$Sub_metering_3, col="Blue")
axis(side = 1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), tick = TRUE)
axis(side = 2, at=c(0, 10, 20, 30), tick = TRUE)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),
       lwd = rep(2.5,3), col=c("black", "red", "blue"),
       text.width = 1000, cex=0.6, bty="n")

# Bottom right
plot(hhpc$Global_reactive_power, type="l", xlab='datetime', ylab ="Global_reactive_power", xaxt='n')
axis(side = 1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), tick = TRUE)

dev.copy(png,'plot4.png', units="px",width=800, height=600)
dev.off()
