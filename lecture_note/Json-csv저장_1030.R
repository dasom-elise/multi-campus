# R에서 JSON 데이터 처리
# network를 통해서 JSON데이터를 받아서 DataFrame으로 만들기 위해 새로운 package를 이용

# 1. package 설치 및 package를 사용하기 위한 로딩작업
install.packages("jsonlite")
library(jsonlite)      #require()
install.packages("httr")
library(httr)
# 2. 문자열을 처리하기 위한 패키지: stringr
install.packages("stringr")
library(stringr)

url = "http://localhost:8080/bookSearch/search?keyword="

request_url = str_c(url,
                    scan(what = character()))
request_url = URLencode(request_url)  # 한글처리를 위한 과정
request_url


# 주소 완성
df = fromJSON(request_url);   df
View(df)
str(df)  #df에 대한 정보 12행4열/이미지라는 키값/타이틀/price ...    #str: 현재 df의 구조를 파악하는데 도움

names(df)  #컬럼 이름을 알아보는 함수

# 찾은 도서 제목만 console에 출력
for (idx in 1:nrow(df)){
  print(df$title[idx])
}

# JSON을 이용해서 DataFrame을 생성!!
# data frame을 csv형식으로 file에 저장
write.csv(df,
          file = "C:/R_Lecture/Data/book.csv",
          row.names = FALSE,
          quote = FALSE)
# DF을 JSON으로 변환하려면?
df_json = toJSON(df)
l = prettify(df_json)
write(l,
      file = "C:/R_Lecture/Data/book_json.txt")  # 용량/구조에 따라 사용하기 쉽게 prettify해도되고 그냥 json으로 저장해도됨




# 연습문제
# 2018/10/30 박스오피스 순위를 알아내서 제목/누적관람객 수 csv파일로저장


url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt="

request_url = str_c(url,
                    scan(what = numeric())) ; request_url

a = df$boxOfficeResult; a
b = df$boxOfficeResult$dailyBoxOfficeList;

movie = df$boxOfficeResult$dailyBoxOfficeList$movieNm; movie
audi_num = df$boxOfficeResult$dailyBoxOfficeList$audiAcc; audi_num

m <- rbind(movie,audi_num)
View(m)

m <- cbind(movie,audi_num)
View(m)

Nice = b[,c("movieNm", "audiAcc")]; Nice
t = data.frame(movie,audi_num)
t

write.csv(Nice,
          file = "C:/R_Lecture/Data/movie.csv",
          row.names = FALSE,
          quote = FALSE)
for(idx in 1:nrow(b)){
  print(b$movieNm[idx])
  print(b$audiAcc[idx])}









