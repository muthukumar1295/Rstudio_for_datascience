install.packages('rvest')
install.packages('XML')
install.packages('magrittr')

library(XML)
library(rvest)
library(magrittr)

urlcode<-'https://www.amazon.in/Prestige-3-0-%E0%A4%AA%E0%A5%8D%E0%A4%B2%E0%A4%BE%E0%A4%B8%E0%A5%8D%E0%A4%9F%E0%A4%BF%E0%A4%95-%E0%A4%B5%E0%A5%87%E0%A4%9C%E0%A5%80-%E0%A4%95%E0%A4%9F%E0%A4%B0/product-reviews/B0196R1WKY/ref=cm_cr_arp_d_paging_btm_next_2?ie=UTF8&reviewerType=all_reviews&pageNumber'

chopper_reviews<-NULL
for (i in 1:24) {
  murl<-read_html(as.character(paste(urlcode,i,sep='=')))
  review_text<- murl %>%html_nodes('.review-text')%>% html_text()
  chopper_reviews<-c(chopper_reviews,review_text)
  
}

length(chopper_reviews)
write.table(chopper_reviews,'prestige_chopper_reviews.txt',row.names = F)

install.packages('syuzhet')
library(syuzhet)
library(ggplot2)
library(lubridate)
library(scales)
library(dplyr)
library(reshape2)
install.packages('tm')
library(tm)
prestige<-readLines('C:\\Users\\asus\\Documents\\prestige_chopper_reviews.txt')

prestige<-iconv(prestige,'UTF-8')

pres<-get_nrc_sentiment(prestige)
head(pres,n=6)

reviews<-get_sentences(prestige)

prestige_nrc<-get_nrc_sentiment(reviews)
prestige_nrc

barplot(colSums(prestige_nrc),las=1,col=rainbow(10))

a<-gsub(' +',' ',prestige)
strsplit(prestige, ' ')
y<-unlist(strsplit(prestige,' '))
pres1<-y[!y%in%'']

review_corpus<-Corpus(VectorSource(pres1))
inspect(review_corpus[1:5])

review_corpus<-tm_map(review_corpus,tolower)
review_corpus<-tm_map(review_corpus,removePunctuation)
review_corpus<-tm_map(review_corpus,removeNumbers)

corp<-tm_map(review_corpus,removeWords,stopwords('english'))
corp<-tm_map(corp,stripWhitespace)
inspect(corp[105:120])
corp<-tm_map(corp,removeWords,c('product','cutter','now','also','cutting','chopping','prestige'))

tdm<-TermDocumentMatrix(corp)
tdm
tdm<-as.matrix(tdm)
tdm[1:10,1:20]

#for bar plot
p<-rowSums(tdm)
p<-subset(p,p>=20)
pbar<-barplot(p,las=2,col = rainbow(50) )
