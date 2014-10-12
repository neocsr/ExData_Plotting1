# Read and prepare data
PowerConsumption <- read.csv("subset_household_power_consumption.txt",
                             na.strings = "?",
                             sep = ";",
                             stringsAsFactors = FALSE)

Datetime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time),
                     format = "%d/%m/%Y %H:%M:%S")

PowerConsumption <- cbind(Datetime, PowerConsumption)

# Plot
hist(PowerConsumption$Global_active_power,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

# Generate PNG File
png(filename = "plot1.png", width = 480, height = 480, bg = "white")

hist(PowerConsumption$Global_active_power,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()
