library(dplyr)
# read each of the two files using the readRDS() function 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Using base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
#calculate total emission from all sources for each year
TotalEmissions <- NEI %>% group_by(year) %>% summarize(TotalEM = sum(Emissions, na.rm=TRUE))
#plotting
png("plot1.png")
with(TotalEmissions,plot(x=year,y=TotalEM,type= "b", ylab="Total Emission ",xlab="Year",pch=19, col="blue",lwd=4))
dev.off()