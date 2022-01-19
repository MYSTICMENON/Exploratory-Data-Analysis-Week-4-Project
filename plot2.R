#Using base plotting system, have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008
library(dplyr)
#calculate total emission in the Baltimore city
TotalEmissionsBaltimore <- NEI %>% subset(fips=="24510") %>% group_by(year) %>% summarize(TotalEMbaltimore = sum(Emissions, na.rm=TRUE))
#plotting
png("plot2.png")
with(TotalEmissionsBaltimore,plot(x=year,y=TotalEMbaltimore,type= "b", ylab="Total Emissions ",xlab="Year",pch=19,cex=2, col="blue",lwd=3))
dev.off()
