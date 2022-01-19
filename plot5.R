#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(dplyr)
#Subset motor vehicle sources in Baltimore City
NEIfipstype <- subset(NEI, fips =="24510" & type =="ON-ROAD" )
#calculate total emission  for each year
TotalEmissions <- NEIfipstype %>% group_by(year) %>% summarize(TotalEM = sum(Emissions, na.rm=TRUE))
#plotting
png("plot5.png")
with(TotalEmissions,plot(x=year,y=TotalEM,ylab="Total Emission ",xlab="Year",pch=19,cex=2, col="blue",lwd=3,main="Emissions from motor vehicle in Baltimore City",type="b"))
dev.off()