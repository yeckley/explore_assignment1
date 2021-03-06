# Assignment 1 for JHU Coursera course Exploratory Data Analysis, demonstrating 
# various plotting techniques

# load the household power consumption dataset into a data frame
hpcData <- read.table("household_power_consumption.txt", 
                      stringsAsFactors = FALSE, header = TRUE, 
                      sep = ";", na.strings= "?")

# subset by date range 2007-02-01 to 2007-02-02
obs2plot <- subset(hpcData, Date %in% c("1/2/2007","2/2/2007"))

# reformat dates and times by creating a POSIXlt column that combines them
obs2plot$DateTime <- paste(obs2plot$Date,obs2plot$Time)
obs2plot$DateTime <- as.POSIXlt(obs2plot$DateTime,format="%d/%m/%Y %H:%M:%S")

# open PNG device
png(file = "plot4.png", bg = "white", width = 480, height = 480, units = "px")

# set up 2 by 2 plot matrix
par(mfrow = c(2, 2))

# first plot
plot(obs2plot$DateTime,obs2plot$Global_active_power,
     type="l",main="",ylab="Global Active Power (Kilowatts)",xlab="")

# second plot
plot(obs2plot$DateTime,obs2plot$Voltage,
     type="l",main="",ylab="Voltage",xlab="datetime")

# third plot
# set the range to allow room for the series with the highest values
yrange = range(c(obs2plot$Sub_metering_1,obs2plot$Sub_metering_4,obs2plot$Sub_metering_3))
# plot three lines per project specifications, a add a legend and then close the device

plot(obs2plot$DateTime,obs2plot$Sub_metering_1,
     type="l",main="",ylab="Energy sub metering",xlab="",ylim = yrange)
lines(obs2plot$DateTime,obs2plot$Sub_metering_2,col="red",type="l",ylim=yrange)
lines(obs2plot$DateTime,obs2plot$Sub_metering_3,col="blue",type="l",ylim=yrange)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","blue","red"),lty=1,bty="n")

# fourth plot
plot(obs2plot$DateTime,obs2plot$Global_reactive_power,
     type="l",main="",ylab="Global_reactive_power",xlab="datetime")

dev.off()
