library(ggplot2)
library(dplyr)

# Branch-wise Placements at NMAMIT (2019-20)
df <- data.frame(
  offers = c(20, 88, 31, 158, 230, 114, 9),
  branch = c("Civil", "Mechanical", "E&E", "E&C", "CSE", "ISE", "Biotechnology")
)
hsize <- 2.2
df <- df %>%
  mutate(x = hsize)

ggplot(df, aes(x = hsize, y = offers, fill = branch)) +
  geom_col(color = "black") +
  geom_text(aes(label = offers), position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  labs(title = "Branch-wise Placements at NMAMIT (2019-20)") +
  scale_fill_manual(values = c("red", "blue", "green", "yellow", "coral", "pink", "mediumorchid")) +
  xlim(c(0.2, hsize + 0.5)) +
  theme(
    panel.background = element_rect(fill = "white"),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_blank()
  )

# Company-wise Internships at NMAMIT (2019-2020)
df2 <- data.frame(
  companies = c("DELL", "RBEI", "Vlinder Labs", "Mercedes Benz", "Juniper", "Mobivezy", "Yokogawa", "Laurus", "AIBOD", "Ritsumeikan", "L&T"),
  offers = c(2, 1, 3, 3, 6, 2, 2, 3, 2, 3, 3)
)
df2

theme_set(theme_bw())

ggplot(df2, aes(x = companies, y = offers)) +
  geom_bar(stat = "identity", width = 0.5, fill = "royalblue2") +
  labs(title = "Company-wise Internships at NMAMIT (2019-2020)") +
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6))

# Branch-wise Internships at NMAMIT (2019-20)
library(plotrix)

data3 <- c(1, 1, 2, 7, 1, 5)
lab <- paste(round(data3 / sum(data3) * 100, 2), "%")
pie3D(
  data3, col = rainbow(7), labels = lab, explode = 0.05, labelcex = 1, theta = 0.8,
  main = "Branch-wise Internships at NMAMIT (2019-20)", border = "black"
)
legend(
  0.7, 1.05, c("CIVIL", "ME", "E&E", "E&C", "CS", "IS", "MCA"), cex = 0.6,
  fill = rainbow(7)
)
