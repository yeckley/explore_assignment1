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

# open the png device, create a line plot per project specifications, and close the device
png(file = "plot2.png", bg = "white", width = 480, height = 480, units = "px")
plot(obs2plot$DateTime,obs2plot$Global_active_power,
     type="l",main="",ylab="Global Active Power (Kilowatts)",xlab="")
dev.off()
