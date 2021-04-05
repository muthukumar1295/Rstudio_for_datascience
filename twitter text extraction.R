install.packages('twitteR')
library(twitteR)

install.packages('ROAuth')
library(ROAuth)

install.packages('base64enc')
library(base64enc)

install.packages('httpuv')
library(httpuv)

cred<- OAuthFactory$new(consumerKey='yKg4qxnqtfU82Vpq9pqZNSpKJ',
                        consumerSecret='PWN6xx4I5dbrLi8JBGdDYZeN4ubYMkKrfUbxaGCsPhuhm0NNK1',
                        requestURL='https://api.twitter.com/oauth/request_token',
                        accessURL='https://api.twitter.com/oauth/access_token',
                        authURL='https://api.twitter.com/oauth/authorize')
setup_twitter_oauth('yKg4qxnqtfU82Vpq9pqZNSpKJ',
                    'PWN6xx4I5dbrLi8JBGdDYZeN4ubYMkKrfUbxaGCsPhuhm0NNK1',
                    '169890579-KFcyRcGFd6SifWfWJEd6gAW0SXrkYcWEU7yPpMPb',
                    'UIy8OEH1bNZE1bBn0iqvgm91rMcZMs8Ti5NPbrUK92LCP')
tweets<-userTimeline('pbhushan1',n=1000)
tweetsdf<-twListToDF(tweets)
write.csv(tweetsdf,'Prashant_Bhushan.csv')



library(syuzhet)
library(ggplot2)
library(lubridate)
library(scales)
library(dplyr)
library(reshape2)
library(tm)

tweettxt<-Prashant_Bhushan[,2]

gov<-iconv(tweettxt,'UTF-8')
gov<-get_sentences(gov)

tweetgov<-get_nrc_sentiment(gov)
head(tweetgov,n=5)

barplot(colSums(tweetgov),las=2,col=rainbow(10))
