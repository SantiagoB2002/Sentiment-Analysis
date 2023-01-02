#Data Scraping Reviews for Bento in South Florida data scraping
#Santiago Bohorquez
#12/25/2022

################################################################################
################################################################################
library(data.table)
library(rvest)
library(tidyverse)


##############################################
##############################################
#Boca Raton
url_1 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-boca-raton-2"

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
  
  url_1 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-boca-raton-2?start=%d", i)
  
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
###############################################################################
###############################################################################
#Fort lauderal
url_2 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-davie-4"

page_2 <- read_html(url_2)




#number of pages

pageNums_2 <- page_2 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_2 <- seq(from = 0, to = (pageNums_2 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_2) 
  
{
  
  url_2 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-davie-4?start=%d", i)
  
  page_2 = read_html(url_2)
  #review date
  
  dates_2 <- page_2 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_2 <- page_2 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_2 <- page_2 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_2 <- list( dates = dates_2,
                    reviews = review_ratings_2,
                    comments = comment_2)
  
  df_new_table_2 <-  as.data.frame(df_new_2)
  
  df_final <- rbindlist(list(df_final, df_new_table_2))
  
}

###############################################################################
###############################################################################
#Dania Beach
url_3 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-dania-beach"

page_3 <- read_html(url_3)




#number of pages

pageNums_3 <- page_3 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_3 <- seq(from = 0, to = (pageNums_3 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_3) 
  
{
  
  url_3 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-dania-beach?start=%d", i)
  
  page_3 = read_html(url_3)
  #review date
  
  dates_3 <- page_3 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_3 <- page_3 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_3 <- page_3 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_3 <- list( dates = dates_3,
                    reviews = review_ratings_3,
                    comments = comment_3)
  
  df_new_table_3 <-  as.data.frame(df_new_3)
  
  df_final <- rbindlist(list(df_final, df_new_table_3))
  
}

###############################################################################
###############################################################################
#Pembroke Pines
url_4 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-pembroke-pines-2"

page_4 <- read_html(url_4)




#number of pages

pageNums_4 <- page_4 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_4 <- seq(from = 0, to = (pageNums_4 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_4) 
  
{
  
  url_4 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-pembroke-pines-2?start=%d", i)
  
  page_4 = read_html(url_4)
  #review date
  
  dates_4 <- page_4 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_4 <- page_4 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_4 <- page_4 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_4 <- list( dates = dates_4,
                    reviews = review_ratings_4,
                    comments = comment_4)
  
  df_new_table_4 <-  as.data.frame(df_new_4)
  
  df_final <- rbindlist(list(df_final, df_new_table_4))
  
}

################################################################################
################################################################################
#Miami Gardens
url_5 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-miami-gardens"

page_5 <- read_html(url_5)




#number of pages

pageNums_5 <- page_5 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_5 <- seq(from = 0, to = (pageNums_5 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_5) 
  
{
  
  url_5 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-miami-gardens?start=%d", i)
  
  page_5 = read_html(url_5)
  #review date
  
  dates_5 <- page_5 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_5 <- page_5 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_5 <- page_5 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_5 <- list( dates = dates_5,
                    reviews = review_ratings_5,
                    comments = comment_5)
  
  df_new_table_5 <-  as.data.frame(df_new_5)
  
  df_final <- rbindlist(list(df_final, df_new_table_5))
  
}
write_csv(df_final, "Bento South Florida Yelp Review.csv", na = "")