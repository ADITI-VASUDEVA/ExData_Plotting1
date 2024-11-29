# Load required library
library(data.table)

# Read the dataset
file <- "household_power_consumption.txt"  # Replace with the actual path to your dataset
data <- fread(file, na.strings = "?", sep = ";")

# Filter data for the required dates
data_filtered <- data[Date %in% c("1/2/2007", "2/2/2007")]

# Convert Date and Time columns to a POSIXct Datetime column
data_filtered[, Datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Convert Global Reactive Power to numeric for plotting
data_filtered[, Global_reactive_power := as.numeric(Global_reactive_power)]

# Plot 4: Global Reactive Power over time
png("plot4.png", width = 480, height = 480)
plot(data_filtered$Datetime, data_filtered$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global Reactive Power",
     main = "")
dev.off()
