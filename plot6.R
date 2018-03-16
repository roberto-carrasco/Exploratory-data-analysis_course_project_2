#read data files
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")



#subset data of emission from motor vehicle sources

Vehicles<-grepl("vehicles", SCC$SCC.Level.Two, ignore.case=TRUE)

Vehicles_SCC <- SCC[Vehicles,]$SCC
Vehicles_NEI <- NEI[NEI$SCC %in% Vehicles_SCC,]

# Subset Baltimore's vehicles NEI data 
balt_Vehicles_NEI <- Vehicles_NEI[Vehicles_NEI$fips=="24510",]
balt_Vehicles_NEI$city <- "Baltimore City"

# Subset Los Angeles County vehicles NEI data
LA_Vehicles_NEI <- Vehicles_NEI[Vehicles_NEI$fips=="06037",]
LA_Vehicles_NEI$city <- "Los Angeles County"

#combine both subsets

balt_LA <- rbind(balt_Vehicles_NEI,LA_Vehicles_NEI)

#plot6
png("plot6.png", height = 480, width = 480)

#call function ggplot
ggplot(balt_LA, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("Motor Vehicle Emissions in Baltimore and LA, 1999-2008"))
dev.off()

