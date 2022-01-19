#Q4 :Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library(dplyr)
#fetch all records involving coal
coal_SCC <- SCC[grepl("Coal",SCC$Short.Name),]
coal_NEI <- NEI[NEI$SCC %in% coal_SCC$SCC,]
# Sum up total emissions
CoalEmissions <- coal_NEI %>% group_by(year) %>% summarize(Total = sum(Emissions, na.rm=TRUE))
# plotting
png("plot4.png")
with(CoalEmissions, plot(x=year, y=Total,ylab="Total Emissions",xlab="Year",pch=2,cex=2,col="red",lwd=3,main="Coal Related Emissions of PM2.5 in US from 1999-2008",type="b"))
dev.off()