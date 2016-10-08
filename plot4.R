# Set working directory

setwd("~/Cursos/Coursera/Data Science/Exploratory/assignment1/ExData_Plotting1")

# First download the data zip file if it doesn't exists
fname <- 'exdata_data_household_power_consumption.zip' 
if (!file.exists(fname)) {
        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', fname , method = 'curl')        
}

# Unzip file if dir not exists
if (!file.exists('household_power_consumption.txt')) {
        unzip(fname)
}

# Read the Dataset 
household_pw <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?")

# Filter dates between 2007-02-01 and 2007-02-02.
household_pw <- household_pw[(household_pw$Date == '1/2/2007') | (household_pw$Date == '2/2/2007'),]

# Create a new column with Date and Time
household_pw$DateTime <- strptime(with(household_pw, paste(Date,Time)), '%d/%m/%Y %H:%M:%S')

# Divide the canvas in 2x2 plots
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# 1st Plot
with(household_pw, plot(DateTime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))

# 2nd Plot 
with(household_pw, plot(DateTime, Voltage, type = 'l', xlab = 'datetime'))

# 3rd Plot
with(household_pw, plot(DateTime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering'))
with(household_pw, lines(DateTime, Sub_metering_2, type = 'l', xlab = '', col = 'red'))
with(household_pw, lines(DateTime, Sub_metering_3, type = 'l', xlab = '', col = 'blue'))
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), 
       lty = 1, bty = 'n', pt.cex = 1, cex = 0.9)

# 4th Plot 
with(household_pw, plot(DateTime, Global_reactive_power, type = 'l', xlab = 'datetime'))

# Copy to PNG
dev.copy(png, file = 'plot4.png')
# Close device
dev.off()




