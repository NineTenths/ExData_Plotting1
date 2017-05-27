# Read the data into R.
# Note: Ths script assumes that the file is located in a folder called 'data' within the working
# directory.
powerUse <- read.table("./data/household_power_consumption.txt", header = T, sep = ';')

# Create a subset of the data for 02/01/2007 and 02/02/2007 only
focusDates <- powerUse[powerUse$Date %in% c("1/2/2007", "2/2/2007"),]

# Extract and convert the three sub-metering columns
sm1 <- as.numeric(focusDates$Sub_metering_1)
sm2 <- as.numeric(focusDates$Sub_metering_2)
sm3 <- as.numeric(focusDates$Sub_metering_3)

png('./figure/plot3.png')

# Create the plot
plot(datetime, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sm2, col = "red")
lines(datetime, sm3, col = "blue")

# Add the legend
legend("topright", col = c("black","red","blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()