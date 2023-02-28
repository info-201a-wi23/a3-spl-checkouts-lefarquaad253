# Chart 2: Trend of Audio book vs Ebook for the popular subject: Fiction and Literature 

library(ggplot2)
library("plotly")
library("scales")
library("stringr")
library(tidyverse)
source("summary.R")

audio <- fic_lit %>%
  filter(CheckoutYear == "2022") %>% 
  filter(MaterialType == "AUDIOBOOK") %>% 
  group_by(CheckoutMonth) %>% 
  summarise(total_checkout = sum(Checkouts)) %>% 
  mutate(MaterialType = "AUDIOBOOK")

ebook <- fic_lit %>%
  filter(CheckoutYear == "2022") %>% 
  filter(MaterialType == "EBOOK") %>% 
  group_by(CheckoutMonth) %>% 
  summarise(total_checkout = sum(Checkouts)) %>% 
  mutate(MaterialType = "EBOOK")

material_type <- full_join(audio, ebook)

chartTwo <- ggplot(data = material_type, aes(x = CheckoutMonth,
                                       y = total_checkout,
                                       group_by = MaterialType,
                                       color = MaterialType)) +
  geom_point() + 
  geom_line() + 
  scale_x_continuous(breaks = seq(1, 12, 1)) + 
  scale_y_continuous(breaks = seq(0, 16454, 1000))+
  labs(title = "Number of Audiobook and Ebook checkout for Fiction & Literature in 2022",
       x = "Month",
       y = "Number of Checkouts")