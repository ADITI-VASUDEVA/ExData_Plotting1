library(data.table)

# Load data
file <- "household_power_consumption.txt"
data <- fread(file, na.strings = "?", 
              colClasses = c("character", "character", rep("numeric", 7)))

# Convert Date and Time into Datetime
data[, Datetime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

# Filter data for dates 2007-02-01 and 2007-02-02
filtered_data <- data[as.Date(Datetime) >= "2007-02-01" & as.Date(Datetime) <= "2007-02-02"]

# Plot 1: Global Active Power Histogram
png("plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
