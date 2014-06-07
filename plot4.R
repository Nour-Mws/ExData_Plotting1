#read file
electricity = read.table("household_power_consumption.txt",header=T, sep=";")

#create png file
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
Sys.setlocale("LC_TIME", "English")

#subsetting the dataset
electricity$Date = strptime(electricity$Date,"%d/%m/%Y")
d = c("2007-02-01","2007-02-02")
days=strptime(d, "%Y-%m-%d")
elec = electricity[electricity$Date %in% days,]

#getting the right formats for the needed columns
elec$Global_active_power = as.numeric(as.character(elec$Global_active_power))
elec$Global_reactive_power = as.numeric(as.character(elec$Global_reactive_power))
elec$Voltage = as.numeric(as.character(elec$Voltage))
elec$Sub_metering_1 = as.numeric(as.character(elec$Sub_metering_1))
elec$Sub_metering_2 = as.numeric(as.character(elec$Sub_metering_2))
elec$Sub_metering_3 = as.numeric(as.character(elec$Sub_metering_3))
elec$Time = strptime(paste(elec$Date,elec$Time),"%Y-%m-%d %H:%M:%S")

#Plot generation
par(mfrow=c(2,2))
#1st plot
with(elec,plot(Time,Global_active_power, type = "l",
               xlab=NA,ylab="Global Active Power"))

#2nd plot
with(elec,plot(Time,Voltage, type = "l",
               xlab="datetime"))

#3rd plot
with(elec,plot(Time,Sub_metering_1, type = "l", 
               xlab=NA,ylab="Energy sub metering"))
with(elec,lines(Time,Sub_metering_2, type = "l", col="red"))
with(elec,lines(Time,Sub_metering_3, type = "l", col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1),col=c("Black","red","blue"), bty = "n")

#4th plot
with(elec,plot(Time,Global_reactive_power, type = "l", xlab="datetime"))

dev.off()

