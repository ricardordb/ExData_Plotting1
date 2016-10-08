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

# Plot to PNG
png(filename = 'plot1.png')
with(household_pw, hist(Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red'))
dev.off()

