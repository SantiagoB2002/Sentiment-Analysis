#Binding all the data I collected from Bento Reviews
#Santiago Bohorquez
#12/25/2022

###############################################
###############################################
library(data.table)
library(rvest)
library(tidyverse)
df_final <- list()
###############################################
###############################################

CF <- read.csv("Bento Central Florida Yelp Review.csv")
df_final <- rbindlist(list(df_final, CF))

GA <- read.csv("Bento Gainesville Yelp Review.csv")
df_final <- rbindlist(list(df_final, GA))

JA <- read.csv("Bento Jacksonville Yelp Review.csv")
df_final <- rbindlist(list(df_final, JA))

SF <- read.csv("Bento South Florida Yelp Review.csv")
df_final <- rbindlist(list(df_final, SF))

TL <- read.csv("Bento Tallahassee Florida Yelp Review.csv")
df_final <- rbindlist(list(df_final, TL))

TA <- read.csv("Bento Tampa Area Yelp Review.csv")
df_final <- rbindlist(list(df_final, TA))

write_csv(df_final, "All Bento Yelp Reviews.csv", na = "")
