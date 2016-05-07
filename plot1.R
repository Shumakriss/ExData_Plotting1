hhpc <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 2880, skip = 66636, header = TRUE)
headers <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 1, header = TRUE)
colnames(hhpc) <- colnames(headers)

par(mfrow=c(1,1))

hist(hhpc$Global_active_power, col="Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png,'plot1.png', units="px",width=400, height=350)
dev.off()