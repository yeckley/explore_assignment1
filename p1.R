# load the household power consumption dataset into a data frame
hpcData <- read.table("household_power_consumption.txt", 
                      stringsAsFactors = FALSE, header = TRUE, 
                      sep = ";", na.strings= "?")

# subset by date range 2007-02-01 to 2007-02-02
obs2plot <- subset(hpcData, Date %in% c("1/2/2007","2/2/2007"))

# reformat dates
obs2plot$Date <- as.Date(obs2plot$Date,format="%d/%m/%Y")
obs2plot$Time <- strptime(obs2plot$Time,format="%T")
