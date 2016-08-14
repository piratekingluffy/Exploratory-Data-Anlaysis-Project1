powercons <- read.table("household_power_consumption.txt",header=TRUE, sep=";",fill = TRUE, stringsAsFactors=FALSE, dec=".")
reqdata <- powercons[powercons$Date %in% c("1/2/2007","2/2/2007") ,]
timedata <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
x<-sapply(reqdata,is.factor)
reqdata[x]<-lapply(reqdata[x],function(x) as.numeric(as.character(x)))
png("plot2.png", width=480, height=480)
plot(timedata,reqdata$Global_active_power , type="l", xlab="", ylab="Global Active Power")
dev.off()