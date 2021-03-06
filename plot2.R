# File: plot2.R
# Copy file household_power_consumption.txt to working directory prior to 
# running this script

# Load the data into dataframe named df
df <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract data from the days 2007-02-01 and 2007-02-02
df <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]

# Convert the date and time variables to Date/Time classes
df$Time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Instantiate a png graphics device named plot2.png at 480x480
png("plot2.png", width=480, height=480)

# Generate the chart
     plot(df$Time, df$Global_active_power,
          type="l",
          xlab="",
          ylab="Global Active Power (kilowatts)")
     
# Return the name and number of the new active device
dev.off()
