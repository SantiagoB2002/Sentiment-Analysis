#Data Scraping Reviews for Bento in Tallahassee Florida data scraping
#Santiago Bohorquez
#12/25/2022

################################################################################
################################################################################
library(data.table)
library(rvest)
library(tidyverse)


##############################################
##############################################
#Tallahassee
url_1 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-tallahassee-2?osq=bento+Asian+Kitchen"

page_1 <- read_html(url_1)

df_final <- list()



#number of pages

pageNums_1 <- page_1 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_1 <- seq(from = 0, to = (pageNums_1 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_1) 
  
{
  
  url_1 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-tallahassee-2?osq=bento+Asian+Kitchen?start=%d", i)
  
  page_1 = read_html(url_1)
  #review date
  
  dates_1 <- page_1 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_1 <- page_1 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_1 <- page_1 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_1 <- list( dates = dates_1,
                    reviews = review_ratings_1,
                    comments = comment_1)
  
  df_new_table_1 <-  as.data.frame(df_new_1)
  
  df_final <- rbindlist(list(df_final, df_new_table_1))
  
}
write_csv(df_final, "Bento Tallahassee Florida Yelp Review.csv", na = "")