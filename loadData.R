hhpc <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 2880, skip = 66636, header = TRUE)
headers <- read.delim(file="household_power_consumption.txt", sep=";", nrows = 1, header = TRUE)
colnames(hhpc) <- colnames(headers)

barplot(table(cut(hhpc$Global_active_power, seq(0,6, by=.5))), 
        main = "Global Active Power", ylab = "Frequency", 
        xlab = "Global Active Power", col="Red", space=0, axes=FALSE)
