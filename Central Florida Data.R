#Data Scraping Reviews for Bento in Central Florida data scraping
#Santiago Bohorquez
#12/25/2022

################################################################################
################################################################################
library(data.table)
library(rvest)
library(tidyverse)


##############################################
##############################################
#Downtown Orlando 
url_1 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-5"

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
  
  url_1 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-5?start=%d", i)
  
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
#Dr. Phillips
url_2 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-6"

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
  
  url_2 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-6?start=%d", i)
  
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
#Lake Nona
url_3 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-11"

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
  
  url_3 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-11?start=%d", i)
  
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
#Curry Ford Rd
url_4 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-10"

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
  
  url_4 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-10?start=%d", i)
  
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
#UCF
url_5 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-8"

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
  
  url_5 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-orlando-8?start=%d", i)
  
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

###############################################################################
###############################################################################
#Kissimie
url_6 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-kissimmee-3"

page_6 <- read_html(url_6)




#number of pages

pageNums_6 <- page_6 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_6 <- seq(from = 0, to = (pageNums_6 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_6) 
  
{
  
  url_6 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-kissimmee-3?start=%d", i)
  
  page_6 = read_html(url_6)
  #review date
  
  dates_6 <- page_6 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_6 <- page_6 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_6 <- page_6 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_6 <- list( dates = dates_6,
                    reviews = review_ratings_6,
                    comments = comment_6)
  
  df_new_table_6 <-  as.data.frame(df_new_6)
  
  df_final <- rbindlist(list(df_final, df_new_table_6))
  
}

###############################################################################
###############################################################################
#Oviedo
url_7 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-oviedo"

page_7 <- read_html(url_7)




#number of pages

pageNums_7 <- page_7 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_7 <- seq(from = 0, to = (pageNums_7 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_7) 
  
{
  
  url_7 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-oviedo?start=%d", i)
  
  page_7 = read_html(url_7)
  #review date
  
  dates_7 <- page_7 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_7 <- page_7 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_7 <- page_7 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_7 <- list( dates = dates_7,
                    reviews = review_ratings_7,
                    comments = comment_7)
  
  df_new_table_7 <-  as.data.frame(df_new_7)
  
  df_final <- rbindlist(list(df_final, df_new_table_7))
  
}
###############################################################################
###############################################################################
#WinterPark
url_8 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-winter-park-2"

page_8 <- read_html(url_8)




#number of pages

pageNums_8 <- page_8 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_8 <- seq(from = 0, to = (pageNums_8 *10)-10, by=10)

#loop for code to run

for (i in pageSequence_8) 
  
{
  
  url_8 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-winter-park-2?start=%d", i)
  
  page_8 = read_html(url_8)
  #review date
  
  dates_8 <- page_8 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//span[@class = ' css-chan6m'])[1]") %>%
    html_text() 
  
  #review rating
  
  review_ratings_8 <- page_8 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//div[contains(@aria-label, 'star rating')])[1]") %>%
    html_attr("aria-label") %>%
    str_remove_all(" star rating") %>%
    as.numeric()
  
  # comments
  
  comment_8 <- page_8 %>%
    html_elements(xpath = "//div[starts-with(@class, ' review')]") %>%
    html_elements(xpath = "(.//p[starts-with(@class, 'comment')])[1]") %>%
    html_text() 
  
  #turns my values into a list
  
  df_new_8 <- list( dates = dates_8,
                    reviews = review_ratings_8,
                    comments = comment_8)
  
  df_new_table_8 <-  as.data.frame(df_new_8)
  
  df_final <- rbindlist(list(df_final, df_new_table_8))
  
}




write_csv(df_final, "Bento Central Florida Yelp Review.csv", na = "")