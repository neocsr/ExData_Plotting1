# Read and prepare data
PowerConsumption <- read.csv("subset_household_power_consumption.txt",
                             na.strings = "?",
                             sep = ";",
                             stringsAsFactors = FALSE)

Datetime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time),
                     format = "%d/%m/%Y %H:%M:%S")

PowerConsumption <- cbind(Datetime, PowerConsumption)

# Plot
plot(PowerConsumption$Datetime, PowerConsumption$Global_active_power,
     type = "l",
     main = "Global Active Power",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Generate PNG File
png(filename = "plot2.png", width = 480, height = 480, bg = "white")

plot(PowerConsumption$Datetime, PowerConsumption$Global_active_power,
     type = "l",
     main = "Global Active Power",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
