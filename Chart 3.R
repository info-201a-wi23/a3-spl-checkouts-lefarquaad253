# Number of checkouts for the most popular book of Fiction & Literature 

# Load libraries 
library(ggplot2)
library("plotly")
library("scales")
library("stringr")
source("summary.R")

# Make bar chart 
hba <- fic_lit %>% 
  filter(CheckoutYear == "2022") %>% 
  filter(Title == "The House of Broken Angels")

chartThree <- ggplot(data = hba) +
  geom_col(mapping = aes(x = CheckoutMonth,
                         y = Checkouts,
                         fill = Checkouts)) + 
  labs(title = "2022 checkouts of The House of Broken Angels",
       x = "Month",
       y = "Number of Checkouts") + 
  scale_x_continuous(breaks = seq(1, 12, 1)) + 
  scale_y_continuous(breaks = seq(0, 2950, 500))
