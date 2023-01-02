#Data Scraping Reviews for Bento Jacksonville data scraping
#Santiago Bohorquez
#12/19/2022

library(data.table)
library(rvest)
library(tidyverse)





################################################################################
################################################################################




url_1 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-jacksonville-4"

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

for (i in pageSequence_1) {

  url_1 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-jacksonville-4?start=%d",i)
  
  page_1 <- read_html(url_1)
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
  Sys.sleep(60)
}



###############################################################################
###############################################################################



#Jacksonville Big Island Dr
url_2 = "https://www.yelp.com/biz/bento-asian-kitchen-sushi-jacksonville-5"

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

for (i in pageSequence_2) {
  
  url_2 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-sushi-jacksonville-5?start=%d",i)
  
  page_2 <- read_html(url_2)
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
  Sys.sleep(60)
}






###################################################################
###################################################################




#Jacksonville Beach Blvd
url_3 = "https://www.yelp.com/biz/bento-asian-kitchen-and-sushi-jacksonville-3"

page_3 <- read_html(url_3)

#number of pages

pageNums_3 <- page_3 %>%
  html_elements(xpath = "//div[@aria-label='Pagination navigation']")%>%
  html_text() %>%
  str_extract('of \\d+') %>%
  str_remove('of') %>%
  as.numeric()

#Sequence for pages
pageSequence_3 <- seq(from = 0, to =10, by=10)

#loop for code to run

for (i in pageSequence_3) {
  
  url_3 = sprintf("https://www.yelp.com/biz/bento-asian-kitchen-and-sushi-jacksonville-3?start=%d",i)
  
  page_3 <- read_html(url_3)
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



##########################3
url_4 = "https://www.yelp.com/biz/bento-asian-kitchen-and-sushi-jacksonville-3?start=10"

page_4 <- read_html(url_4)
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
beach_final <- rbindlist(list(df_new_table_4, df_new_table_3))
################################
df_final <- rbindlist(list(df_final, beach_final))

################################
write_csv(df_final, "Bento Jacksonville Yelp Review.csv", na = "")
