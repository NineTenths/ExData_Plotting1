# Read the data into R.
# Note: Ths script assumes that the file is located in a folder called 'data' within the working
# directory.
powerUse <- read.table("./data/household_power_consumption.txt", header = T, sep = ';')

# Create a subset of the data for 02/01/2007 and 02/02/2007 only
focusDates <- powerUse[powerUse$Date %in% c("1/2/2007", "2/2/2007"),]

# Extract and convert Global_active_power to a number
pow <- as.numeric(focusDates$Global_active_power)

png('./figure/plot1.png')

# Create the histogram
hist(pow, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()