# Summary of data 

library("dplyr")

# Load data
df_spl <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv")

# 1. What is the subject with the most checkout? 
popular_subject <- df_spl %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  pull(Subjects)

# 2. What is the total number of books checked out that are "Fiction, Literature" 
fic_lit <- df_spl %>% 
  filter(Subjects == "Fiction, Literature")

num_checkout <- fic_lit %>% 
  summarize(count = n())

# 3. In 2022, what book(s) had the most checkout? 
book_max_checkout <- fic_lit %>%
  filter(CheckoutYear == "2022") %>%
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>%
  pull(Title)

# 4. What was the most average number of checkouts each month in 2022? 
avg_checkout <- fic_lit %>% 
  filter(CheckoutYear == "2022") %>% 
  group_by(CheckoutMonth) %>% 
  summarize(Checkouts = mean(Checkouts, na.rm = TRUE)) %>% 
  summarize(mean(Checkouts))
  

# 5. What is the difference between Audiobook and Ebook? 
num_audio <- fic_lit %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  summarize(count = n())

num_ebook <- fic_lit %>%
  filter(MaterialType == "EBOOK") %>%
  summarize(count = n())

diff_books <- num_ebook - num_audio