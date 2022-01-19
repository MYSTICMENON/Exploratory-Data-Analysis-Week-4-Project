#emissions from 1999–2008 for Baltimore City w.r.t type  (point, nonpoint, onroad, nonroad) variable using ggplot2

library(ggplot2)
library(RColorBrewer)
# loading data
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

# Baltimore City, Maryland == fips
subset <- neiData[neiData$fips == "24510", ] 
subsetagg <- aggregate(Emissions ~ year + type, subset, sum)
# final results
png(filename = "plot3.png", width = 480, height = 480)
g <- ggplot(subsetagg, aes(year, Emissions, color = type))
g<- g + geom_line() + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
print(g)
dev.off()