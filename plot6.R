#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)
library(RColorBrewer)
# Loading RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Baltimore & Los Angeles data
baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)
#Plotting
png("plot6.png")
g <- ggplot(baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips))
g<- g+ geom_line() + geom_point() + ggtitle("Baltimore and Los Angeles PM2.5 Motor Vehicle Emissions by Year") +labs(x = "Year", y = "PM 2.5 Motor Vehicle Emissions") +scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))
print(g)
dev.off()