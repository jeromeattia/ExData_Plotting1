library("dplyr")

dataSet <- read.csv("household_power_consumption.txt",sep=';',stringsAsFactors=FALSE)
dataSet$Date1 <- as.POSIXct(strptime(paste(dataSet$Date , dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
dataSet <- filter(dataSet, Date1 >= "2007-02-01" & Date1 <= "2007-02-02" )

png(filename = "plot2.png", width = 480, height = 480)

r <- as.POSIXct(range(dataSet$Date1))
plot(dataSet$Global_active_power~dataSet$Date1, type="l", ylab = "Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1,at=seq(r[1], r[2], by="day"), labels = weekdays(r, abbreviate = TRUE) )

dev.off()

