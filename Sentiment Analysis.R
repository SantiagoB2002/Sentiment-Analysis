#Sentiment Analysis
#Santiago Bohorquez 12/27/2022
library(rlang)
library(tidytext)
library(textdata)
library(readxl)
library(dplyr)
library(stringr)
library(tibble)
library(ggplot2)
library(data.table)
############################3
############################

get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc")

data2 <- fread("All Bento Yelp Reviews.csv",
               select = c("comments"))

Data_By_Word <- data2 %>%
  mutate(linenumber = row_number()) %>%
  unnest_tokens(word, comments)

data(stop_words)

Cleansed_Data <- Data_By_Word
Cleansed_Data <- Cleansed_Data %>%
  anti_join(stop_words)

Cleansed_Data %>%
  count(word, sort = TRUE)


P <- Cleansed_Data %>%
  count(word, sort = TRUE) %>%
  filter(n >13) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab("Words") +
  ylab("Count") +
  coord_flip()
P + ggtitle("Most Popular Words")
  