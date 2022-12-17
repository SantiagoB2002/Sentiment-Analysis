
library(data.table)
library(rvest)
library(tidyverse)

url = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-oviedo?osq=bento+oviedo"

page <- read_html(url)

df_final <- list()



#number of pages

pageNums <- page %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence <- seq(from = 0, to = (pageNums *10)-10, by=10)

#loop for code to run

for (i in pageSequence) 
  
{
  
  url = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-oviedo?start=%d", i)
  
  page <- read_html(url)
  #review date
  
  dates <- page %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings <- page %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment <- page %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new <- list( dates = dates,
                  reviews = review_ratings,
                  comments = comment)
  
  df_new_table <-  as.data.frame(df_new)
  
  df_final <- rbindlist(list(df_final, df_new_table))
  
}

write_csv(df_final, "Bento Oviedo Yelp Review.csv", na = "")

