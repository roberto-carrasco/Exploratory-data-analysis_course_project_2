#read data files
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#plot 1
# Calculate total emissions by year
Totalemis <- aggregate(Emissions ~ year,NEI, sum)


#call plot function
barplot((Totalemis$Emissions), names.arg=Totalemis$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions from all US sources"
)

#copy plot1
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()