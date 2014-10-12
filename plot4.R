# Read and prepare data
PowerConsumption <- read.csv("subset_household_power_consumption.txt",
                             na.strings = "?",
                             sep = ";",
                             stringsAsFactors = FALSE)

Datetime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time),
                     format = "%d/%m/%Y %H:%M:%S")

PowerConsumption <- cbind(Datetime, PowerConsumption)

# Plot
par(mfrow = c(2, 2))

plot(PowerConsumption$Datetime, PowerConsumption$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(PowerConsumption$Datetime, PowerConsumption$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(PowerConsumption$Datetime, PowerConsumption$Sub_metering_1,
     col = "black",
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(PowerConsumption$Datetime, PowerConsumption$Sub_metering_2, col = "red")
lines(PowerConsumption$Datetime, PowerConsumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty= 7, lwd = 2)

plot(PowerConsumption$Datetime, PowerConsumption$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

# Generate PNG File
png(filename = "plot4.png", width = 480, height = 480, bg = "white")

par(mfrow = c(2, 2))
plot(PowerConsumption$Datetime, PowerConsumption$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(PowerConsumption$Datetime, PowerConsumption$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(PowerConsumption$Datetime, PowerConsumption$Sub_metering_1,
     col = "black",
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(PowerConsumption$Datetime, PowerConsumption$Sub_metering_2, col = "red")
lines(PowerConsumption$Datetime, PowerConsumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty= 7, lwd = 2)

plot(PowerConsumption$Datetime, PowerConsumption$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()