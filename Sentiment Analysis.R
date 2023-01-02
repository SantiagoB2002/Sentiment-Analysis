#Sentiment Analysis
#Santiago Bohorquez 12/27/2
library(reshape2) 
library(dplyr) #Data manipulation (also included in the tidyverse package)
library(tidytext) #Text mining
library(tidyr) #Spread, separate, unite, text mining (also included in the tidyverse package)
library(widyr) #Use for pairwise correlation
library(wordcloud)
library(tm)
library(ggplot2)
###########################################
data(stop_words)
###########################################

data_1 <- read.csv(file.choose())



undesirable_words <- c("food", "bento", "coming")
#"theres", "bridge", "fe0f", "yeah", "baby",
#"alright", "wanna", "gonna", "chorus", "verse",
#"whoa", "gotta", "make", "miscellaneous", "2",
#"4", "ooh", "uurh", "pheromone", "poompoom", "3121",
#"matic", " ai ", " ca ", " la ", "hey", " na ",
#" da ", " uh ", " tin ", "  ll", "transcription",
#"repeats", "la", "da", "uh", "ah")

#############################################

################################################
clean_data_1 <- data_1 %>%
  mutate(linenumber = row_number())%>%
  unnest_tokens(word, comments) %>%
  filter(!nchar(word) <=3) %>%
  filter(!word %in% undesirable_words) %>%
    anti_join(stop_words)
##################################
text_wordcounts <- clean_data_1 %>%
  count(word, sort = TRUE)


head(text_wordcounts)

##########################################################################
text_wordcounts %>% 
  filter(n > 1000) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n)) + 
  geom_col() +
  coord_flip() +
  labs(x = "Word \n", y = "\n Count ", title = "Frequent Words In Comments \n") +
  geom_text(aes(label = n), hjust = 1.2, colour = "white", fontface = "bold") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkblue", size = 12),
        axis.title.y = element_text(face="bold", colour="darkblue", size = 12))


#####################################################################################
text_wordcounts %>%
  filter(n > 500) %>%
  with(wordcloud(word, n, max.words = 50))
#####################################################


get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc")



text_wordcounts %>%
  inner_join(get_sentiments("afinn")) %>%
  inner_join(get_sentiments("bing")) %>%
  inner_join(get_sentiments("nrc")) %>%
  anti_join(stop_words) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0)%>%
  comparison.cloud(colors = c("red", "blue"), scale = c(1,.5),
                   max.words = 1000)
  

########################################################################
sentiments <- text_wordcounts %>%
  inner_join(get_sentiments(("bing"))) %>%
  count(word, sentiment, sort = TRUE)

SentimentPos <- subset(sentiments, sentiment == "positive")
SentimentNeg <- subset(sentiments, sentiment == "negative")

#################################################################

Positive_Score <- aggregate(n ~ sentiment, data = SentimentPos, sum)
Negative_Score <- aggregate(n ~ sentiment, data = SentimentNeg, sum)

RatioPosNeg <- (Positive_Score$n/Negative_Score$n)

RatioPosNeg
# 0.6517357