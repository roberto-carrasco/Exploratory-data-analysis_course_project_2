
# read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset Baltimore's NEI data.
baltimore_NEI <- NEI[NEI$fips=="24510",]

# Calculate total Baltimore emissions data by year
TotalsBaltimore <- aggregate(Emissions ~ year, baltimore_NEI,sum)

barplot(
  TotalsBaltimore$Emissions,
  names.arg=TotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions from all Baltimore sources"
)

#copy plot2
dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()