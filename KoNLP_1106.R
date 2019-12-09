## 텍스트 분석
# 형태소 분석 패키지 이용
# 자연어 처리 기능을 이용해 보세요

# KoNLP
# Korean Natural Language Process
# 해당 패키지 안에 사전이 포함되어 있음
# 총 3가지의 사전이 포함
# 시스템사전(28만), 세종사전(32만), NIADic(98만개) 사전

# Java기능 이용/시스템에 JRE필요!
# JRE를 설치했는데 R package가 JRE를 찾아써야함,,
# 그래서 R한테 내 자바 어디있는지 알려줘야함 ㅠㅠ
# JAVA_HOME 환경변수 설정해야함

# 탐색기-내PC-우클릭-속성-고급시스템정보-환경변수-시스템변수'새로만들기'-변수값: C:\Program Files\Java\jre1.8.0_231

# 참고로 영문 NLP => openNLP, snowball
# package를 많이 이용
install.packages("KoNLP")
library(KoNLP)
useNIADic()
extractNoun("이것은 소리없는 아우성")
extractNoun("올해는 꼭 취업을 해서 돈을 많이 벌 것이다!")

txt = readLines("C:/R_Lecture/data/hiphop.txt",
                encoding = "UTF-8")
View(txt)
head(txt)

# 데이터가 정상적으로 들어왔으나 특수문자가 포함되어 있음!
# 제거해주자!
library(stringr)

# 정규표현식을 이용해서 특수문자를 모두 찾아서 ""으로 변환
a = str_replace_all(txt,"\\W"," ") # 모든 특수기호 = \\W
head(a)

# 형태소를 분석할 데이터가 준비되었어요~~
# 함수를 이용해서 명사만 뽑아내요
nouns = extractNoun(a)
head(nouns)       # 자료구조 list!!!


# 명사를 추출해서 list형태로 저장
length(nouns)

# 원하는 형태로 가공
# list형태를 vector로 변환
words = unlist(nouns)

head(words)
length(words)

# 워드클라우드를 만들자!
# 자주 사용되는 명사만 추출/많이사용되는 명사만 추출

head(table(words))

wordcloud = table(words)
class(wordcloud)
df = as.data.frame(wordcloud, stringsAsFactors = F)
View(df)

# 두글자 이상으로 되어있는 데이터 중 빈도수가 높은 상위 20개의 단어들만 추출 
# 한글자짜리는 의미가 없음!
library(dplyr)
ls(df)
word_df = df %>%
  filter(nchar(words) >= 2) %>%
  arrange(desc(Freq)) %>%
  head(20)

# 데이터가 준비되었으니 워드클라우드를 만들어보자
# 패키지를 까세여

install.packages("wordcloud")
library(wordcloud)

# 워드클라우트에서 사용할 색상에 대한 팔레트 설정
# Dark2라는 색상 목록에서 8개의 색상 추출
pal = brewer.pal(8,"Dark2")

# 워드클라우드는 만들때마다 랜덤하게 만들어짐 ㅎ!
# 재현성을 확보하기 위해 랜덤함수의 시드값을 고정시켜서 항상
# 같은 워드 클라우드가 만들어지게 설정
set.seed(1)

wordcloud(words = word_df$words, # 형식은 벡터형식!
          freq = word_df$Freq,
          min.freq = 2,
          max.words = 20,
          random.order = F,  # F하면 고빈도 단어를 중앙배치
          rot.per = .1,
          scale=c(5,0,3),   # 빈도수에 따른 크기차이
          colors = pal) 

