library(ggplot2)
library(plotrix)
library(tidyverse)
library(ggsci)
library(ggpubr)

# Company wise Placements at NMAMIT 2021-22
data <- read.csv("2020-21company-wise-Placements.csv")
ggplot(data, aes(Companies, No.of.Offers)) +
  geom_bar(stat="identity", width=0.8, fill="turquoise3") +
  scale_y_continuous(limits = c(0,190)) +
  theme(axis.text.x = element_text(angle=90, size=6)) +
  labs(title = "Company wise Placements at NMAMIT 2021-22")

# Graph 2 - Company wise Internships
data3 <- c(2,1,2,1,1,2,5,3,1,8,4,1,7,2)
x <- c("Sony India", "Dell Technologies", "Inscripts", "LeadSquared", "Aptean India Pvt Ltd", "Juniper Networks", "ACI worldwide", "Laurus Infosystems", "Mobivezy", "Diya Systems (Glotouch)", "Krishi Tantra", "Bang Design Private Limited", "Climber Knowledge & Careers Private Limited", "Ibrium Technologies")
barplot(data3, names.arg=x, ylab="Internship offers", col=heat.colors(6), cex.names=0.55, las=1)
title(main="Company wise Internship opportunities at NMAMIT (2020-21)", border="black")

# Graph 3 - Branch wise Placements
df <- data.frame(
  offers=c(356,25,219,68,109,19,214,121),
  branch=c("CSE", "CIVIL", "ISE", "E&E", "ME", "BIOTECH", "E&C", "MCA")
)
df2 <- df %>%
  mutate(offers = rev(cumsum(rev(offers))), pos = offers/2 + lead(csum, 1), pos = ifelse(is.na(pos), offers/2, pos))

ggplot(df, aes(x = "", y = offers, fill = fct_inorder(branch))) +
  geom_col(width = 1, color = 1) +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Pastel1") +
  geom_label_repel(data = df2, aes(y = pos, label = paste0(offers, "%")), size = 4.5, nudge_x = 1, show.legend = FALSE) +
  guides(fill = guide_legend(title = "Branch")) +
  theme_void() +
  labs(title = "Company wise Placements at NMAMIT 2021-22")
