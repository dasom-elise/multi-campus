# R graph

# reshape2
# dplyr
# ggplot2           by 해들리 위컴

# mpg data set 사용

################################################################################!!!!
# 산점도(scatter) - 변수의 관계, 데이터의 경향

## ggplot2는 3단계로 그래프를 만듦
library(ggplot2)
library(dplyr)
df = as.data.frame(mpg)

# 1. 축을 정함/ 배경설정
# data설정: 그래프를 그리는데 필요한 데이터
# aes(axes에서x를 빼고 표현): aes(x =, y=)
# 배기량에 따른 고속도로 연비의 관계
ggplot(data=df,
       aes(x=displ, y=hwy))
#초기화
plot.new()

# 2. 그래프를 추가

ggplot(data=df,
       aes(x=displ, y=hwy)) + 
  geom_point()
#산점도그리는 함수 geom_point 활용

# 3. 축 범위, 배경 설정 # 설정 추가 가능
ggplot(data=df,
       aes(x=displ, y=hwy)) + 
  geom_point(size = 3, color="blue") + 
  xlim(3,5)+
  ylim(20,30)
##### ggplot 은 %>%대신 +를 통해 체이닝


################################################################################!!!!
# 막대그래프 - 빈도수, 집단 간 비교 ex) 여/남 , 20대/30대/40대
# 집단 간의 비교를 할 때 사용
# 구동방식(drv) F, R, 4
# 연비를 비겨헤 보아여 # 그러기 위해선 데이터를 준비
# 구동방식별 고속도로 연비 평균
df = as.data.frame(mpg)

result = df%>% group_by(drv) %>%
  summarise(avg_hwy = mean(hwy))
result = as.data.frame(result)
str(result)

ggplot(data=result,
       aes(x = drv, y = avg_hwy)) +
  geom_col(width = 0.5)

# 막대그래프의 길이에 따라 순서를 재배치하려면 ?
ggplot(data=result,
       aes(x = reorder(drv, -avg_hwy), y = avg_hwy)) +
  geom_col(width = 0.7)

# 빈도 막대 그래프
# 사용하는 함수는 geom_bar()
# raw data frame을 직접 이용해서 처리

ggplot(data=df,
       aes(x = drv)) +
  geom_bar()
#  빈도 막대 그래프 구할 때 사용하는 함수와 사용 방법 geom_bar
head(df)
# 누적 빈도 그래프 (범주형태의 column을 넣어서,,,class,trans,cyl 등)
ggplot(data=df,
       aes(x = drv)) +
  geom_bar(aes(fill=factor(class)))

# 히스토그램; 좁은 구간 간의 빈도수
ggplot(data=df,
       aes(x = cty)) +
  geom_histogram()
################################################################################!!!!
# 선 그래프 - 시간에 따라 변하는 데이터; 시계열 데이터!!
# 일반적으로 환율, 주식, 경제동향
# mpg는 시간에 대한 데이터가 없음
# line chart를 위해서 economics data set 이용

economics
tail(economics) # 1967~2015까지의 경제지표

ggplot(data=economics,
       aes(x = date,
           y = unemploy)) +
  geom_line()


ggplot(data=economics,
       aes(x = date,
           y = unemploy)) +
  geom_point(color="red") + 
  geom_line()

#월별 개인 저축률 동향 그래프
ggplot(data= economics,
       aes(x=date,
           y= psavert)) +
  geom_line()

# 산점도 (변수 간의 관계, 데이터 경향)
# 막대그래프(일반, 빈도(누적), 히스토그램)
# 선그래프(시계열 데이터 표현)
# box그래프 (데이터의 분포)


# 박스 그래프 - 데이터의 분포를 파악 ex) boxplot 
df = as.data.frame(mpg)
head(df)
# 구동 방식별 hwy(고속도로 연비)
# 상자그림을 그려보아요
ggplot(data=df,
       aes(x=drv,
           y=hwy)) +
  geom_boxplot()














