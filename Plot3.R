library(data.table)

# Load data
file <- "household_power_consumption.txt"
data <- fread(file, na.strings = "?", 
              colClasses = c("character", "character", rep("numeric", 7)))

# Convert Date and Time into Datetime
data[, Datetime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

# Filter data for dates 2007-02-01 and 2007-02-02
filtered_data <- data[as.Date(Datetime) >= "2007-02-01" & as.Date(Datetime) <= "2007-02-02"]

# Plot 3: Energy Sub-Metering
png("plot3.png", width = 480, height = 480)
plot(filtered_data$Datetime, filtered_data$Sub_metering_1, 
     type = "l", col = "black", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(filtered_data$Datetime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$Datetime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
