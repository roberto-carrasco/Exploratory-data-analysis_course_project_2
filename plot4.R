#read data files
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")



#Coal & combustion data related in NEI

combust<- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombust <- (combust & coal)
combust_SCC <- SCC[coalCombust,]$SCC
combust_NEI <- NEI[NEI$SCC %in% combust_SCC,]


#plot4
png("plot4.png", height = 480, width = 480)

#call ggplot function
ggplot(combust_NEI,aes(x = factor(year),y = Emissions)) +
  geom_bar(stat="identity") +
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("PM2.5 Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()