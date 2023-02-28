# Chart 1: 2022 checkouts for Fiction & Literature and Fiction & Mystery

library(ggplot2)
library("plotly")
library("scales")
library("stringr")
library(tidyverse)
source("summary.R")

fic_myst <- df_spl %>% 
  filter(Subjects == "Fiction, Mystery") %>%
  filter(CheckoutYear == "2022") %>% 
  group_by(CheckoutMonth) %>% 
  summarize(total_checkout = sum(Checkouts)) %>% 
  mutate(checkout_type = "Fiction & Mystery Checkout")

fic_lit_total <- fic_lit %>% 
  filter(CheckoutYear == "2022") %>% 
  group_by(CheckoutMonth) %>% 
  summarize(total_checkout = sum(Checkouts)) %>% 
  mutate(checkout_type = "Fiction & Literature Checkout")

combine <- full_join(fic_lit_total, fic_myst)

chartOne <- ggplot(data = combine, aes(x = CheckoutMonth,
                                       y = total_checkout,
                                       group_by = checkout_type,
                                       color = checkout_type)) +
  geom_point() + 
  geom_line() + 
  scale_x_continuous(breaks = seq(1, 12, 1)) + 
  scale_y_continuous(breaks = seq(0, 28134, 1000)) + 
  labs(title = "2022 checkouts for Fiction & Literature and Fiction & Mystery",
       x = "Month",
       y = "Number of Checkouts")

