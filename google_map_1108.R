#  EDA (Exploratory Data Analysis)
#  탐색적 데이터 분석


# 구글 지도 서비스를 이용해 보아요!
# Google Map Platform
# 패키지 필요
# But, CRAN에 없음
# github에 공유되어 있음
# VCS(version Control System)

# 원본: A
# 홍길동: A1
# 최길동: A2

# 이런 공동작업에 대한 문제를 해결하기 위해 나온 cvcs
# centeralized VCS
# 소스원본을 중앙서버 1개가 들고있고 나머지 사람이 복사본을 가져다가 작업
# 서버문제에 따라서 작업에 차질

## DVCS(Distributed VCS)
# 소스원본을 여러 곳에 보관
# Git을 이용하면 공동처리가 쉬워짐
# Git repository(저장소)
# 이런 깃저장소를 서비스해주는 회사는 ## GITHUB ##

# 1. GitHub에 공유되어 있는 ggmap
# package 설치~~@@
# 버전특성을 탐/ 패키지들은 의존성을 신경써야함
# 현재 R버전을 확인해 보아욤
sessionInfo()

# 현재 버전은 3.6.1이고 사용하려는 패키지는 3.5.1에서 실행됨
# 버전을 맞추었으니 필요한 패키지를 깃헙에서 다운받아 설치해 보아용

install_github() # 이걸 설치하기 위한 패키지 다운!!
# install.packages("devtools") # 완료 ##############################################################
library(devtools)

install_github("dkahle/ggmap")
library(ggmap)

googleAPIkeys = "AIzaSyArH4QqUKgAsA5qL93WaaiaiusYGvVF3MI"
register_google(key = googleAPIkeys)

gg_seoul = get_googlemap("seoul",
                         maptype = "roadmap")
ggmap(gg_seoul)

library(dplyr)
library(ggplot2)

geo_code = geocode(enc2utf8("공덕역"))
geo_code # 위도/경도

# google map을 그리려면 위도/경도가 숫자형태의
# vector로 되어 있어야 해요

geo_data = as.numeric(geo_code)
geo_data # 숫자형 벡터로 떨어짐

get_googlemap(center = geo_data,
              maptype = "roadmap",
              zoom = 16) %>%
  ggmap() +  # 지도 위에 원하는 그림, 산점도 or 막대그래프를 올릴 수 있음          
  geom_point(data = geo_code,
             aes(x = lon,
                 y = lat),
             size=5,
             color = "red")
# # # # # # # # # #
addr = c("공덕역","역삼역")
gc = geocode(enc2utf8(addr))
df = data.frame(lon=gc$lon,
                lat=gc$lat)
df
centre = c(mean(df$lon),mean(df$lat))
centre
map = get_googlemap(center=centre,
                    maptype = "roadmap",
                    zoom = 13,
                    markers = gc)
result = ggmap(map)
ggplotly(result)

# 지하철역 주변 아파트 정보: 서울 열린 데이터 광장
# 아파트 실거래: 국토부 실거래가 공개 시스템

# interactive Graph
install.packages("plotly")
library(plotly)

# mpg data set 이용해서 배기량과
# 고속도로 연비에 대한 산점도를 그려보아요
library(ggplot2)
df = as.data.frame(mpg)
head(df)

g <- ggplot(data = df,
       aes(x=displ,
           y=hwy)) + 
  geom_point(size = 3,
             color = "blue")

ggplotly(g)


ggplotly
##### 확대, 값 확인

# 시계열 그래프
## 시간에 따른 선 그래프는 
## 단순확대만으로는 사용이 힘들어요
## 특정 구간에 대한 자세한 사항을 보기 위해서 다른 패키지 이용

install.packages("dygraphs")
library(dygraphs)

ggplot(data = economics,
       aes(x=date,
           y=psavert)) +
  geom_line()
library(xts)
save_rate = xts(economics$psavert,
                order.by = economics$date)
dygraph(save_rate) %>%
  dyRangeSelector()

unemp_rate = xts(economics$unemploy/1000,
                 order.by = economics$date)
unemp_save = cbind(save_rate,unemp_rate)

dygraph(unemp_save) %>%
  dyRangeSelector()








# 무비렌즈(정형)/로튼토마토(반정형)/패널데이터 실습(정형)/카카오API(반정형)/네이버댓글 크롤링 후 워드 클라우드(비정형)










