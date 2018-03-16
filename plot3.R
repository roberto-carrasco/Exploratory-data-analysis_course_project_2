#read files
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#subset Baltimore's NEI data

baltimore_NEI <- NEI[NEI$fips=="24510",]

#package ggplot2

library(ggplot2)

#plot3

png("plot3.png", height = 480, width = 480)

ggplot(baltimore_NEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type) + 
  labs(x="Year", y=expression("Total PM2.5 Emission (Tons)")) +
  labs(title=expression("PM2.5 Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()