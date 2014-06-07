# Assignment 1 for JHU Coursera course Exploratory Data Analysis, demonstrating 
# various plotting techniques

# load the household power consumption dataset into a data frame
hpcData <- read.table("household_power_consumption.txt", 
                      stringsAsFactors = FALSE, header = TRUE, 
                      sep = ";", na.strings= "?")

# subset by date range 2007-02-01 to 2007-02-02
obs2plot <- subset(hpcData, Date %in% c("1/2/2007","2/2/2007"))

# open the png device, plot histogram per project specifications, and close the device
png(file = "plot1.png", bg = "white", width = 480, height = 480, units = "px")
hist(obs2plot$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
