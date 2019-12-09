## 네이버 영화 댓글 사이트
## 특정 영화에 대한 review를 크롤링해서
## 워드클라우드를 작성해보자

library(rvest)
library(stringr)

url = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=53152&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page="
request_url = str_c(url,2)
hp = read_html(request_url); hp
nodes = html_nodes(hp,'#_filtered_ment_0'); nodes
review <- html_text(nodes, trim = TRUE); review




result = vector(mode="character")

for (idx in 0:9) {
  review = vector(mode="character",length = 10)
  request_url = str_c(url,idx+1)
  hp = read_html(request_url);
  for (t in 0:9) {
    myPath = str_c('#_filtered_ment_',
                   t)
    nodes = html_nodes(hp,
                       myPath)
    myTxt <- html_text(nodes, trim = TRUE);
    review[t+1] = myTxt
  }
  result = c(result,review)
  
}

View(result)




# 페이지 당 리뷰 10개만 저장

for(idx in 0:9){
  myPath = str_c('#_filtered_ment_',
                 idx)
  nodes = html_nodes(hp,
                     myPath)
  myTxt <- html_text(nodes, trim = TRUE);
  review[idx] = myTxt
}

class(review)



# NLP
# install.packages("rJava")
library(rjava)
library(dplyr)
# install.packages("wordcloud")
library(wordcloud)
# install.packages("KoNLP")
library(KoNLP)

useNIADic()

myWord = extractNoun(result)
head(myWord)

myWord = unlist(myWord)
myWordCloud = table(myWord)

myDf = as.data.frame(myWordCloud, stringsAsFactors = F)
ls(myDf)

myWord_df = myDf %>%
  filter(nchar(myWord) >= 2) %>%
  arrange(desc(Freq)) %>%
  head(30)

set.seed(1)
pal = brewer.pal(5,"Pastel1")
wordcloud(words = myWord_df$myWord, # 형식은 벡터형식!
          freq = myWord_df$Freq,
          min.freq = 2,
          max.words = 80,
          random.order = T,  # F하면 고빈도 단어를 중앙배치
          rot.per = .1,
          scale=c(8,0,3),   # 빈도수에 따른 크기차이
          colors = pal) 









