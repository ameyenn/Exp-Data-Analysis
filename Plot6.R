####Q6 How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City v's LAC?

####Step 1: Initialise

setwd("C:/Users/ameye/OneDrive/R/Coursera/Principles of Analtytic Graphics/Week4Proj")
library(data.table)
library(dplyr)
library(ggplot2)

####Step 2: Load Data

nei <- as.data.table(readRDS("summarySCC_PM25.rds"))
scc <- as.data.table(readRDS("Source_Classification_Code.rds"))

####Step 4: Create a subset based on matches form nei to B and LAC, select year and emissions and sum values

mVB<-nei %>%
  filter(type == "ON-ROAD", fips == "24510") %>% 
  group_by(year)  %>% summarise(y = sum(Emissions)) 

mVLAC<-nei %>%
  filter(type == "ON-ROAD", fips == "06037") %>% 
  group_by(year)  %>% summarise(y = sum(Emissions)) 

####Step 4: Plot to PNG
png("plot6.png", width=480, height=480)                                                             #open the png ploting

plot(x=mVB$year,pch=19, y=mVB$y, type="b", main="Motor Vechile Emissions\n Baltimore and LAC", 
     xlab="Year", ylab="Emissions", col="blue")

par(new=TRUE)                                                                                       #enable plot on top in same plot

plot(x=mVLAC$year, pch = 3, y=mVLAC$y, type="b", ann=FALSE, axes= FALSE, col="red")                 #NOTE: not axes

legend("topright", legend=c("Baltimore","LAC"), pch=c(19,3), title="Group", col=c("blue","red"))    #add legend

dev.off()                                                                                           #close




