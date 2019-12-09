
# 데이터 조작
# 데이터 분석업무에서 Raw data를 얻은 다음,
# "머신러닝 모델링"이나 "시각화"를 위해 적절한 형태로 변형
# 데이터 변환/필터링/전처리 필요

# 이런 작업(데이터 조작)에 특화된 package 존재
# plyr => pliers + R => 패키지를 구현한 언어
# dplyr => data frame + pliers + R (디플라이알)
# vector나 data frame에 적용할 수 있는 기본 함수

# 실습 data 필요 # IRIS

iris # 붓꽃의 종류와 크기에 대해 측정한 데이터 # 통계학자 피셔가 측정해서 제공
View(iris) 
# Species: 3개 (setosa, virginica, versicolor)
# Sepal.Length: 꽃받침 길이 # Sepal.Width: 꽃받침 너비 # Petal.Lenth:꽃잎 길이 # Petal.Width:꽃잎 너비

# 기본함수
# 1. head(): 데이터 셋의 앞에서 부터 데이터 추출/defaul = 6/DF아니어도 수행 가능
head(iris)
var1 = 1:10; head(var1)
head(iris,10)
# 2. tail(): 데이터 셋의 뒤에서 부터 데이터 추출/tail(df,n = numeric)
tail(iris,10)

# 3. View(): view창에 데이터를 출력
# 4. dim(): data frame의 행과 열의 개수
dim(iris)
# 선형자료 구조(vector, iris)
dim(var1) # 사용 불가능

# 5. nrow(): data frame의 행의 개수
# 6. ncol(): 열의 개수

# 7. str(): 데이터 프레임에 대한 일반적인 정보추출
str(iris)
# 8. summary(): data frame의 요약 통계량을 보여줌
summary(iris)
# 9. Min, Max, 사분위, 평균(mean), 중간값(Median)
# 10. ls(): 컬럼명을 벡터로 뽑음
ls(iris)
# 11. rev():  벡터로 추출, 선형자료구조 데이터의 순서를 거꾸로 만듦
rev((iris))
# 12. length(): 길이를 구하는 함수 - dataframe의 경우 column개수를 반환
length(iris) 
var2 = matrix(1:12, ncol = 3); length(var2) # matrix의 경우에는 원소의 개수를 반환

###########################


# plyr패키지

install.packages("plyr")
library(plyr)

# key 값을 이용해서 두 개의 데이터 프레임을 병합(세로/열방향으로 결합)
# data.frame 두개 생성
x = data.frame(id = 1:5,
               height = c(150,170,190,180,160))
y = data.frame(id = c(1,2,3,7),
               weight = c(50,100,80,90))

join(x,y,by="id",type="inner")  # inner join: 공통된 키 값만
join(x,y,by="id",type="left")   # left join # 디폴트
join(x,y,by="id",type="right")  # right join
join(x,y,by="id",type="full")   # full join: 전부


# 두 개 이상의 키를 이용해서 결합해보기
x = data.frame(id = 1:5,
               gender = c("M","F","F","M","F"),
               height = c(150,170,190,180,160)
               )
y = data.frame(id = c(1,2,3,7),
               gender = c("F","F","F","M"),
               weight = c(50,100,80,90))

join(x,y,by=c("id","gender"),type="inner")  # 두개의 키값 기준으로 이너조인 # 키값이 일치하는 결과만 반환


# dplyr에서는 join() => left_join()으로 사용

# 2. 범주형 변수를 통해서 그룹별 통계량 구하기
str(iris)
unique(iris$Species)  # 중복제거하고 반환환
# iris의 종별 꽃잎 길이의 평균
# tapply(대상 column, 범주형 변수의 column, 적용할 함수)
tapply(iris$Petal.Length,
       iris$Species,
       FUN = mean)
tapply(iris$Petal.Length,
       iris$Species,
       FUN = max)    # 한 번에 하나만 구할 수 있음


# 여러개의 통계량 한번에 구하기 # 평균/표준편차
# ddpply(): 한번에 여러개의 통계치를 구할 수 있음
df = ddply(iris,
      .(Species),
      summarise,
      avg=mean(Petal.Length),
      sd = sd(Petal.Length))
class(df)

########################################################
## plyr에서는 join과 통계값 구하는 함수 2개만 알아두면 됨.

# 실제로 data frame을 다룰 때는 plyr을 개량한 dplyr을 이용
# dplyr은 C++으로 구현되서 속도가 빠름
# dplyr은 코딩시 chaining을 사용할 수 있음

var1 = 1:5
var2 = var1 * 2
var3 = var2 + 5
# chainig
var4 = (1:5)*2+5
var4

# 패키지 설치
install.packages("dplyr")
library(dplyr)

# 주요 함수
# 1. tbl_df: 현재 콘솔 크기에 맞추어서 data frame을 추출하라는 함수
tbl_df(iris)


install.packages("xlsx")
library(xlsx)
excel = read.xlsx(file.choose(),
           sheetIndex =1,
           encoding = "UTF-8")
excel
str(excel)
ls(excel)

# 2. rename(): 이해하고 인식하기 쉽도록 컬럼명 바꿈.
# rename(data frame,
#         바꿀 컬럼명1 = 이전컬럼명1,
#         바꿀 컬럼명2 = 이전컬렴명2 ........,)
# 제공된 excel파일을 읽어들여서 data frame을 생성 후 column명을 보니
# AMT17: 2017 이용금액, Y17_CNT: 2017년 이용횟수

# data frame 컬럼명을 바꿀 수 있어요
df = rename()
df = rename(excel,
            CNT17 = Y17_CNT,
            CNT16 = Y16_CNT)

# 3. 하나의 data frame에서 하나 이상의 조건을 이용해서 데이터를 추출하려면?
# filter(df, 조건1, 조건2, ......)
filter(excel, 
       SEX == "M" &  AREA == "서울") # 콤마나 연산자&|| 이용가능
# 지역이 서울 혹은 경기 혹은 제주 남성중 40 이상의 사람들 정보 출력!

filter(excel,
       AREA %in% c("서울","경기","제주"),  #조건이 많은 경우 축약
       SEX == "M" & AGE >=40)


# 4. arrange(df, column, column2, ..)  # 정렬하기
# default = 오름차순 # 내림차순 = desc()

# 서울/남자/2017 처리금액 400,000이상/나이 많은 순으로 출력

arrange((filter(excel,
       AREA == "서울",
       SEX == "M",
       AMT17 >= "400000")), desc(AGE))
# 체이닝을 통해 한번에 하기; 체이닝 기호 %>%
filter(excel,
       AREA == "서울",
       SEX == "M",
       AMT17 >= "400000") %>%
  arrange(desc(AGE))

# 5. select(df, column1, column2, .....)
# 추출하기 원하는 column을 지정해서 해당 컬럼만 추출할 수 있음
# 서울/남자/2017 금액 40만이상/나이 내림차순/ID/나이/17처리건수 만 출력

filter(excel,
       AREA == "서울",
       SEX == "M",
       AMT17 >= "400000") %>%
  arrange(desc(AGE)) %>%
  select("ID":"AGE", Y17_CNT)

filter(excel,
       AREA == "서울",
       SEX == "M",
       AMT17 >= "400000") %>%
  arrange(desc(AGE)) %>%
  select(-SEX)       # 성별 제외 다뽑기


# 6. 새로운 column을 생성
excel
# 17년도 처리금액을 기준으로 등급 50만 이상 - VIP , 나머지 - NORMAL로 생성할것!
excel$GRADE = ifelse(excel$AMT17 >= 500000,
                     "VIP", 
                     "NORMAL") 
# df의 컬럼을 생성하는 기본 기능
# dplyr은 새로운 column을 생성하기 위한 함수를 제공!
# mutate
# 경기사는 여자를 기준으로 2017 처리금액을 이용하여 처리금액의 10%를 가산한 값으로 새로운 컬럼 추가 AMT17_REAL만들고
# AMT_REAL이 45만원 이상인경우 VIP컬럼을 만들어 TRUE/FALSE 입력
help(mutate)

mutate(excel, AMT17_REAL = ifelse(excel$SEX == "F" & excel$AREA == "경기",
                             AMT17*1.1,
                             AMT17)) %>%
  mutate(VIP = ifelse(AMT17_REAL >= 450000,
                      "TRUE",
                      "FALSE")) %>%
  filter(SEX =="F", AREA =="경기")


### 모범답안

filter(excel,
       AREA == "경기" & SEX == "F") %>%
  mutate(AMT17_REAL = AMT17 * 1.1,
         VIP = ifelse(AMT17_REAL >= 450000,
                      TRUE,
                      FALSE))

# 7. group_by & summarize
filter(excel,
    AREA == "서울" & AGE > 30) %>%
  group_by(SEX) %>%
  summarise(sum = sum(AMT17), cnt=n())

# 8. plyr package의 join함수가 각 기능별로 독립적인 함수로 제공

# left_join()
# right_join()
# inner_join()
# full_join()


# 9. bind_rows(df1,df2) # 가로방향으로 붙임. # 컬럼이 같아야~
df1 = data.frame(x=c("a","b","b"))
df2 = data.frame(y=c("d","e","f"))
bind_rows(df1,df2) # 컬럼 다른 경우 따로 붙음(key없는 full join) # 같은 경우 아래로 붙음 
bind_cols(df1,df2)


