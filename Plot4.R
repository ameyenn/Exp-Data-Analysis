####Q4 Across the United States, how have emissions from coal combustion-related sources 
####changed from 1999-2008?


####Step 1: Initialise

setwd("C:/Users/ameye/OneDrive/R/Coursera/Principles of Analtytic Graphics/Week4Proj")
library(data.table)
library(dplyr)
library(ggplot2)

####Step 2: Load Data

nei <- as.data.table(readRDS("summarySCC_PM25.rds"))
scc <- as.data.table(readRDS("Source_Classification_Code.rds"))

####Step 3: Create coal list and set as character from factor

coalList<-scc %>%
  filter(str_detect(EI.Sector, "Coal")) %>%
     select(SCC)

coalList <- data.frame(lapply(coalList, as.character), stringsAsFactors=FALSE)

####Step 4: Create a subset based on matches form nei to coallist, select year and emissions and sum values
p<-subset(nei, SCC %in% coalList[,1]) %>%
  select(year, Emissions) %>% 
    group_by(year) %>% summarise(x = sum(Emissions))

####Step 4: Plot to PNG
png("plot4.png", width=480, height=480) #open the png ploting
plot(x=p$year, y=p$x, typ="l", main="Emissions Level USA", xlab="Year", ylab="Emissions")
dev.off() 
