#read data files
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")



#subset data of emission from motor vehicle sources

Vehicles<-grepl("vehicles", SCC$SCC.Level.Two, ignore.case=TRUE)

Vehicles_SCC <- SCC[Vehicles,]$SCC
Vehicles_NEI <- NEI[NEI$SCC %in% Vehicles_SCC,]

# Subset the vehicles NEI data to Baltimore's fip
balt_Vehicles_NEI <- Vehicles_NEI[Vehicles_NEI$fips=="24510",]

#plot5
png("plot5.png",  height = 480, width = 480)

#call function ggplot
ggplot(balt_Vehicles_NEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()