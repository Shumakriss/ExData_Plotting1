hhpc <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 2880, skip = 66636, header = TRUE)
headers <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 1, header = TRUE)
colnames(hhpc) <- colnames(headers)

hist(hhpc$Global_active_power, col="Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")