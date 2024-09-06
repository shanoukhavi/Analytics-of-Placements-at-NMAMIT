# Load necessary libraries
library(ggplot2)
library(plotrix)
library(tidyverse)
library(ggsci)
library(ggpubr)

# Company-wise placements NMAMIT  year (2021-22)
data <- read.csv("cwp.csv")
ggplot(data, aes(Companies, No.of.Offers)) +
  geom_bar(stat="identity", width=0.8, fill="turquoise3") +
  scale_y_continuous(limits = c(0,270)) +
  theme(axis.text.x=element_text(angle=90, size=6)) +
  labs(title = "Company wise Placements at NMAMIT 2021-22")
# Load necessary libraries ggplot and plotrix
library(ggplot2)
library(plotrix)

# All year placements Line Graph
data1 <- read.csv("avg.csv")
ggplot(data=data1, aes(x=YEAR, y=placement_offers)) +
  geom_point(size=5) +
  geom_line(colour="red") +
  labs(title = "Placements at NMAMIT (2015-2022)")

# All year Internship Line Graph
data2 <- read.csv("yi.csv")
ggplot(data=data2, mapping=aes(x=YEAR, y=Internship_offers)) +
  geom_point(size=5) +
  geom_line(colour="red") +
  labs(title = "Internship at NMAMIT (2018-2022)")

# Branch wise Internship 3D Pie Chart
data3 <- read.csv("bwi.csv")
id1 <- paste0(data3$Number.of.Selections / sum(data3$Total.Number.of.Selections) * 100, "%")
pie3D(data3$Total.Number.of.Selections, main = "Branch-wise Internships at NMAMIT (2021-22)", 
      col = rainbow(9), labels = id1, border="black")

# Branch wise Placements 3D Pie Chart
data4 <- c(219, 356, 68, 109, 19, 25, 214, 121)
label <- paste0(round(data4 / sum(data4) * 100, 2), "%")
pie3D(data4, col = rainbow(8), labels = label, lab.cex = 0.5, theta=0.8,
      main="Branch-wise Placements at NMAMIT (2021-22)")
legend(0.7, 1.05, c("CSE", "E&E", "ME", "BIOTECH", "E&C", "ISE", "CIVIL", "MCA"), cex=0.6, fill=rainbow(8))

# Branch-wise Internships Bar Graph
data5 <- c(4, 1, 1, 4, 1, 2)
x <- c("Nutanix", "Robert Bosch", "ACI Worldwide", "Inforica", "Jupiter Networks", 
       "Amazon", "Laurus Systems", "Uthunga Tech", "Mobivezy", "TripHase Tech", 
       "All State", "Yokogawa", "Krishi Yech", "Prodigy Tech", "NextFort", "Tayana Software Solutions")
barplot(data5, names.arg=x, ylab="Internship offers", col=rainbow(8), cex.names=0.55, las=3)
title(main="Company-wise Internship opportunities at NMAMIT (2021-22)", border="black")
