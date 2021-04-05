library(rvest)
library(dplyr)
library(purrr)
imdb<-'https://www.desimartini.com/hollywood-reviews/black-panther/?page=%d'

movie_review<-NULL
for (i in 1:4) {
  imdb_reviews<-read_html(sprintf(imdb,i))
  reviews<-html_text(html_nodes(imdb_reviews,'#less_review'))
  movie_review<-c(reviews,movie_review)
}


write.table(movie_review,'Black_Panther_reviews.txt',row.names = F)

movie_review<-iconv(movie_review,'UTF-8')
black_p<-get_sentences(movie_review)

black_nrc<-get_nrc_sentiment(black_p)

barplot(colSums(black_nrc),las=1,col=rainbow(10))

blackcorpus<-Corpus(VectorSource(black_p))

blackcorpus<-tm_map(blackcorpus,tolower)
blackcorpus<-tm_map(blackcorpus,removeNumbers)
blackcorpus<-tm_map(blackcorpus,removePunctuation)
blackcorpus<-tm_map(blackcorpus,removeWords,stopwords('english'))
blackcorpus<-tm_map(blackcorpus,removeWords,c('read','movie')
blackcorpus<-tm_map(blackcorpus,stripWhitespace)
inspect(blackcorpus[1:5])

tdmblack<-TermDocumentMatrix(blackcorpus)
blackmatrix<-as.matrix(tdmblack)
blackmatrix[1:10,1:20]

b<-rowSums(blackmatrix)
b<-subset(b,b>=3)
bbar<-barplot(b,las=2,col=rainbow(10))
