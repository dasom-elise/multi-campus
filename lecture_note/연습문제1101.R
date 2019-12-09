# 1101 연습문제

# movieLens Data set
# 평점은 !~5점
# rating/moive 두개
library(xlsx)
install.packages("dplyr")
library(dplyr)
library(plyr)
rating = read.csv(file.choose())
movies = read.csv(file.choose())
head(ratings)


# 1. 사용자가 평가한 모든 영화의 전체평균 평점
t = mean(rating$rating); t
               # [1] 3.501557

# 2. 각 사용자별 평균평점

######
rating %>%
  group_by(userId) %>%
  summarise(avg = mean(rating))

######
#####


# 3. 각 영화별 평균 평점

myVar %>%
  group_by(movieId,title) %>%
  summarise(avg = mean(rating))

# 4. 평균평점이 가장높은 영화의 제목을 내림차순으로 정렬

myVar = left_join(movies,rating, by = "movieId")
View(myVar)

t = myVar %>%
  group_by(movieId,title,genres,timestamp) %>%
  summarise(avg = mean(rating))

View(t)

arrange(filter(t,
       avg == 5), desc(title))




# 5. comedy영화 중 가장 평점이 닞은 영화의 제목을 오름차순으로 출력(동률는경우모두출력)


nnnn = filter(t,
       grepl("Comedy", genres),
       avg == 0.5) %>%
  arrange(avg,title)

View(nnnn)



# 6. 2015년 평가된 모든 로맨스 영화 평균 평점 출력
filter(t,
       timestamp >= 1420070400 & timestamp < 1451606400,
       grepl("Romance", genres)) %>%
  select(title,avg)


# 1420070400 (2015-01-01)
# 1451606400 (2016-01-01)











