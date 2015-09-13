library("dplyr")

dataSet <- read.csv("household_power_consumption.txt",sep=';',stringsAsFactors=FALSE)
dataSet$Date1 <- as.POSIXct(strptime(paste(dataSet$Date , dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
dataSet <- filter(dataSet, Date1 >= "2007-02-01" & Date1 <= "2007-02-02" )

png(filename = "plot1.png", width = 480, height = 480)

hist(as.numeric(dataSet$Global_active_power), main="Global Active Power", col ="red", xlab = "Global Active Power (kilowatts)")

dev.off()

