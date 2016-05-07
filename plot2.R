hhpc <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 2880, skip = 66636, header = TRUE)
headers <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 1, header = TRUE)
colnames(hhpc) <- colnames(headers)

hhpc$Date <- as.Date(strptime(hhpc$Date, "%e/%m/%Y"))

hhpc$Days <- as.factor(weekdays(hhpc$Date))

par(mfrow=c(1,1))

plot(hhpc$Global_active_power, type="l", xlab='', ylab ="Global Active Power (kilowatts)", xaxt='n')

axis(side = 1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), tick = TRUE)

dev.copy(png,'plot2.png', units="px",width=800, height=600)
dev.off()