#read file
electricity = read.table("household_power_consumption.txt",header=T, sep=";")

#create png file
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
Sys.setlocale("LC_TIME", "English")

#subsetting the dataset
electricity$Date = strptime(electricity$Date,"%d/%m/%Y")
d = c("2007-02-01","2007-02-02")
days=strptime(d, "%Y-%m-%d")
elec = electricity[electricity$Date %in% days,]

#getting the right formats for the needed columns
elec$Global_active_power = as.numeric(as.character(elec$Global_active_power))
elec$Time = strptime(paste(elec$Date,elec$Time),"%Y-%m-%d %H:%M:%S")

#Plot generation
with(elec,plot(Time,Global_active_power, type = "l",
               xlab=NA,ylab="Global Active Power (kilowatts)"))
dev.off()
