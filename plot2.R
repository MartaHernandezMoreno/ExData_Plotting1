setwd("C:/Users/Marta/Desktop/Data Science Course/04. Exploratory Data Analysis/Project1")

consum <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?",
                     colClasses = c('character','character','numeric','numeric','numeric',
                                    'numeric','numeric','numeric','numeric'))

# Format date to Type Date
consum$Date <- as.Date(consum$Date, "%d/%m/%Y")

#  Filter Dates for 2007-02-01 and 2007-02-02
consum <- subset(consum,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Create datetime variable
datetime <- paste(consum$Date, consum$Time) # Combine Date and Time column
datetime <- setNames(datetime, "datetime") # Name the vector
consum <- cbind(datetime, consum) # Add DateTime column
consum$datetime <- as.POSIXct(datetime) # Format dateTime Column

# Create plot
png("plot2.png", width=480, height=480)

plot(consum$Global_active_power~consum$datetime, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

