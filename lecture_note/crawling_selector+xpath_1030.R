# web crawling: 인터넷 상에서 필요한 정보를 읽어와서 수집하는 일련의 작업(과정)


# web scraping: 하나의 웹페이지에서 내가 원하는 부분을 추출
# web crawling(web spidering): 자동화 봇인 crawler가 정해진 규칙에 따라 복수개의 웹페이지를 browsing하는 행위

# scraping을 할 때 CSS(jquery) selector를 이용해서 필요한 정보를 추출
# 추가적으로 xpath도 이용

# 특정 사이트에 접속해서 내가 원하는 데이터를 추출


# 네이버 영화댓글
# 프로그램 처리하기 위해 객체화 --> html -- 자료화
# 1. 서버로부터 받은 HTML 태그로 구성된 문자열을 자료구조화 시키는 패키지를 이용
install.packages("rvest")
library(rvest)
library(stringr)
# 2. url 준비
url = "https://movie.naver.com/movie/point/af/list.nhn"
page <- "page="
request_url = str_c(url,"?",page,1); request_url
# 3. 준비된 url로 서버에 접속해서 html을 읽어온 후 자료구조화 시킴
hp = read_html(request_url); hp
class(hp)
# 4. selector를 이용해 원하는 node만/추출하기 원하는 요소 선택
nodes = html_nodes(hp,
                   "td.title>a.movie"); nodes
# 5. tag사이에 들어있는 text를 추출
title = html_text(nodes,trim = TRUE); title

# 6. selector를 선택해 element 선택
# : html을 구조적으로 만들어 줘야함// span태그// 
nodes = html_nodes(hp,
                  "td.title"); nodes
review <- html_text(nodes, trim = TRUE); review    # trim을 통해 앞뒤 공백 제거
class(txt); # vector

# 7. 필요없는 문자들을 제거
review = str_remove_all(review, "\t")
review = str_remove_all(review, "\n")
review = str_remove_all(review, "신고")
View(review)

# 8. 영화제목과 리뷰에 대한 내용을 추출
df = cbind(title,review)
View(df)

# 9. 구축한 데이터를 파일에 저장
write.csv(df,
          file = "C:/R_Lecture/Data/naver_review.csv")


#####################################################################

url = "https://movie.naver.com/movie/point/af/list.nhn"
page <- "page="
request_url = str_c(url,"?",page,1); request_url
hp = read_html(request_url); hp
class(hp)
nodes = html_nodes(hp,
                   "td.title>a.movie"); nodes
title = html_text(nodes,trim = TRUE); title


# Review는 xpath로 가져오기
nodes = html_nodes(hp,
                   xpath = '//*[@id="old_content"]/table/tbody/tr[3]/td[2]/text()'); nodes
review <- html_text(nodes, trim = TRUE); review
review[3]

# for문을 활용하여 각 review를 xpath로 뽑아내기
review = vector(mode="character",length = 10)  # 빈 vector를 만들어 안에 저장



for(idx in 1:10){
  myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                 idx,
                 ']/td[2]/text()')
  nodes = html_nodes(hp,
                     xpath = myPath)
  myTxt <- html_text(nodes, trim = TRUE); review
  review[idx] = myTxt[3]
}

review

# 제목/리뷰 합치기
naver = cbind(title,review)

# 저장
write.csv(naver,
          file = "C:/R_Lecture/Data/xpath_review.csv")








