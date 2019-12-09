
## 자동차 연비와 관련된 mpg data set을 이용해서 데이터 조작, 정제에 대한 내용 학습 ! 
# mpg data set을 이용하기 위해 특정 package를 설치

install.packages("ggplot2")
library(ggplot2)

str(mpg)
class(mpg) # tbl_df, tbl, df 자료구조
# mpg는 table data frame형태
# 출력을 용이하게 하기 위한 형태
# console크기에 맞춰서 data frame출력

df = as.data.frame(mpg); df # 원래 데이터형식/dafa frame변환 

# 사용한 데이터 프레임을 준비했음
# 컬럼명만 뽑아내기
ls(df) # column 명을 오름차순 정렬해서 추출

# mpg에 대한  documnet를 확인해서 컬럼의 의미를 먼저 파악할 필요!
tail(df,10)
View(mpg)      # view창을 통해 데이터를 확인할 수 있음
dim(df) # 데이터프레임이 몇개의 행과 열로 구성되었는지 알려줌
nrow(df) # dataframe의 행의 개수 추출
ncol(df) # dataframe의 열의 개수 추출
length(df) # df의 길이 = df의 열(col)의 개수    cf. 벡터/매트릭스의 경우는 원소의 개수
str(df) # 자료구조, 행의개수, 열의개수, 열의 이름, 데이터 타입 등을 제공

summary(df) # 기본 통계량을 보여줌 # 가장기본적인 통계 데이터
rev(df) # 벡터에 대해서 데이터를 역순으로 변환하는 기능


###########################################################

# 데이터조작 (dplyr: 디플라이알)
# 강점: 속도 빠름(C++ 구현), chaining가능(%?%)
# 원하는 데이터를 추출
library(dplyr)
# 1. tbl_df()
df = tbl_df(df)        # table data frame
df = as.data.frame(df); df # data frame

# 2. rename() column의 이름을 바꿀 수 있음
# raw data를 이용할 때 column명을 새로 명시해서 사용해야 함
# 컬럼명에 대소문자가 같이 있는 경우 모두 소문자/대문자로 변경해서 사용하면 편함
# df의 컬럼명을 모두 소문자 혹은 대문자로 변경
# rename(df, 새로운컬럼1 = 원래컬럼1)
new_df = toupper(ls(df)); new_df

names(df) = toupper(names(df))
ans_df = rename(ans_df,model = MODEL)
head(ans_df,1)
ans_df = rename(ans_df,MODEL=model)


# 3. 조건을 만족하는 행을 추출하는 함수
# filter(data frame, 조건1, 조건2, 조건3, ......)
# mpg data set에서 2008년 생산된 차가 몇개인지
head(mpg)
filter(data.frame(mpg),year==2008) %>%
  nrow()
# 모든 차량에 대해 평균 도시연비보다 도시연비가 높은 차량의 모델명을 출력하세요
filter(data.frame(mpg), cty > mean(cty)) %>%
 select(model) %>% 
  unique()

# na값이 있는 경우 처리, 함수의 속성 활용 
# na.rm = T 결측값을 통계분석 시 제외
avg_cty <- mean(df$cty, na.rm = T); avg_cty

a = unique(filter(df, 
       cty>avg_cty)$model) 
summary(a)        # 23개
length(a)

## 고속도로 연비가 상위 75% 이상인 차량을 제조하는 제조사는 몇개인지 추출하세요
summary(mpg)

b = unique(filter(df, hwy >= summary(df$hwy)[5])$manufacturer)
length(b)

# 오토 차량 중 배기량이 2500cc 이상인 차량 수는?
head(df,3)
c = filter(filter(df,
       grepl("auto",trans)),
       displ>=2.5)
nrow(c)

#문자열 처리 필요
library(stringr)
filter(df,
       displ >= 2.5,
       str_detect(trans,"auto"))        # trans 안에 auto 필요/ 있으면 true, 없으면 false

# 4. arrange(): 정렬함수
# arrange(df, column1) # 기본정렬방식: 오름차순
# arrange(df, column1, desc(colum2))     # column1 동률 생겼을 때 column2로 내림차순



# 모든 차량에 대해 평균 도시연비보다 도시연비가 높은 차량의 모델명을 출력하세요
# 위의 예제에 대해 모델명을 오름차순으로 정렬

filter(data.frame(mpg), cty > mean(cty)) %>%
  select(model) %>% 
  unique() %>%
  arrange(model)

unique(filter(df,
              cty>avg_cty)$model)


df %>% filter(cty > mean(cty)) %>%
  select(model) %>%
  unique() %>%
  arrange(model)

# 5. select() ; df에서 필요한(특정한) column만을 추춣하는 함수
# select(df, column1, column2, ...)

# 6. 새로운 column을 생성하려면 어떻게?
# mutate()
# 도시연비와 고속도로 연비로 평균연비를 만들어보기!
# mean_rate
df$mean_rate = (df$cty+df$hwy)/2

# 기본 R기능 이용해서 column을 만들 수 있다
new_df = 
  df %>% mutate(mean_rate = (cty+hwy)/2)
new_df


# 7.통계량을 구해서 새로운 칼럼으로 생성: summarise()
# model이 a4이고 배기량이 2000cc 이상인 차들에 대해 평균연비를 계산하세요

no7df <-
  df %>% filter(model == "a4",
                displ >= 2.0) %>%
  mutate(avg_rate = mean((cty+hwy)/2))


result <-
  df %>% filter(model =="a4",
                displ >= 2.0) %>%
  mutate(avg = (cty+hwy)/2) %>%
  select(avg)
mean(result$avg)


result <-
  df %>% filter(model =="a4",
                displ >= 2.0) %>%
  mutate(avg = mean(c(cty,hwy)))



summary(df$hwy)
##summarise 이용해보기
# 전체 평균이 나옴 -> 결과는 1행1열짜리 df을 얻을 수 있음
df=as.data.frame(mpg)


df %>% filter(model == "a4",
              displ >= 2.0) %>%
  summarise(avg_rate = mean(c(cty,hwy)),
            hahaha = max(cty))

# 8. group_by(): 범주형 변수에 대한 grouping

df %>% filter(displ >= 2.0) %>%
  group_by(manufacturer) %>%
  summarise(avg_rate = mean(c(cty,hwy)))

# 9.left_join(), right_join(), inner_join(), outer_join
