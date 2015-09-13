library("dplyr")

dataSet <- read.csv("household_power_consumption.txt",sep=';',stringsAsFactors=FALSE)
dataSet$Date1 <- as.POSIXct(strptime(paste(dataSet$Date , dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
dataSet <- filter(dataSet, Date1 >= "2007-02-01" & Date1 <= "2007-02-02" )

png(filename = "plot4.png", width = 480, height = 480)

r <- as.POSIXct(range(dataSet$Date1))
par(mfrow=c(2,2))

plot(dataSet$Global_active_power~dataSet$Date1, type="l", ylab = "Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1,at=seq(r[1], r[2], by="day"), labels = weekdays(r, abbreviate = TRUE) )

plot(dataSet$Voltage~dataSet$Date1, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(side=1,at=seq(r[1], r[2], by="day"), labels = weekdays(r, abbreviate = TRUE) )

plot(dataSet$Sub_metering_1~dataSet$Date1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(dataSet$Sub_metering_2~dataSet$Date1, type="l", xaxt="n" ,col="red")
lines(dataSet$Sub_metering_3~dataSet$Date1, type="l", xaxt="n" , col="blue")
axis(side=1,at=seq(r[1], r[2], by="day"), labels = weekdays(r, abbreviate = TRUE) )
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")


plot(dataSet$Global_reactive_power ~dataSet$Date1, type="l", xaxt="n" ,col="red", ylab="Global Reactive Power",  xlab="datetime")
axis(side=1,at=seq(r[1], r[2], by="day"), labels = weekdays(r, abbreviate = TRUE) )


dev.off()

