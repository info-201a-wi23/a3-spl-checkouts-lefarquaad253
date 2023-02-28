# Chart 3: Number of checkouts for the most popular book of Fiction & Literature 

library(ggplot2)
library("plotly")
library("scales")
library("stringr")
source("summary.R")

group_month <- fic_lit %>% 
  group_by(CheckoutMonth) %>% 
  summarize(Checkouts = sum(Checkouts))

month <- c("January", "April")
checkout <- c(54189, 20391)



piechart <- pie(checkout, month, main = "Months with the most and least checkouts for Fiction & Literature", col = c("pink" ,"grey"))

legend <- legend("topright", c("Janurary: 54189 Checkouts", "April: 20391 Checkouts"), cex = 0.8, fill = c("pink", "grey"))
