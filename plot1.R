#read file
electricity = read.table("household_power_consumption.txt",header=T, sep=";")

#create png file
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

#subsetting the dataset
electricity$Date = strptime(electricity$Date,"%d/%m/%Y")
d = c("2007-02-01","2007-02-02")
days=strptime(d, "%Y-%m-%d")
elec = electricity[electricity$Date %in% days,]

#getting the right formats for the needed columns
elec$Global_active_power = as.numeric(as.character(elec$Global_active_power))
nrow(elec)

#Plot generation
with(elec,hist(Global_active_power,xlim=c(0,6),  ylim=c(0, 1200), 
               breaks=12, col="red", main="Global Active Power", 
               xlab="Global Active Power (kilowatts)"))
dev.off()
