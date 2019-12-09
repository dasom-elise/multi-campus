# List
# 1차원 선형구조/다른 데이터타입 가능/중첩 자료구조
# key/value의 쌍으로 저장 - 1차선형
# 지금까지 했던 자료구조들을 생성해서 list 안에 저장해보기 
# 

var_scalar = 100; var_scalar #scalar
var_vector = c(10, 20, 30) ;var_vector  #vector
var_matrix = matrix(c(1:12), nrow=4, ncol=3, byrow=T); var_matrix
var_array = array(c(1:12),dim=c(2,2,3)); var_array

# Dataframe만들기
# id/name/age 등은 column
var_df = data.frame(id = 1:4,name = c("홍길동","김길동","이길동","최길동"), age = c(30, 40, 20,10)); var_df

myList = list(var_scalar,var_vector,var_matrix,var_array,var_df)

myvector = c(10,20,30)
myvector[2:3]
myList[1]

# key/value로 저장되는 자료구조이고 데이터를 출력할 때 key값도 같이 출력
# key = name/ c() = value
mylist = list(name=c("홍길동","김길동"), 
              age = c(20,30), 
              address = c("서울","부산"))
mylist["name"]
mylist$name[2]
mylist[[1]] # 이형태도 가능

# data frame

# matrix와 같은 2차원 형태의 자료구조
# 다른 데이터 타입을 사용가능
# column명을 이용
# database의 table과 유사

# vector로 data frame만들기

no = c(1,2,3)
name = c("홍길동","김길동","최길동")
age = c(10,20,30)

df = data.frame(s_no=no,s_name=name,s_age=age)
df

df[1] # 첫번째 열을 지칭
df$s_name # 범주도 함께/범주형 자료제공
df["s_name"]

var_matrix
df_mat = data.frame(var_matrix)

#data frame의 함수
str(df) # 전체 내용의 3 obs(records), 3var(3col), data type 등 구조 보여줌

summary(df) # 요약 통계

# APPLY 행단위/열단위로 함수적용
apply(X,MARGIN,FUN)
df = data.frame(x = c(1:5),
                y = seq(2,10,2),
                z = c("a","b","c","d","e"))
length(df$x)

# ex) 주어진 df의 1,2번째 컬럼에 대해서 각각 합계를 구하세요

apply(X = df[-3] , MARGIN = 2 , FUN = sum)
apply(X = df[,c(1:2)] , MARGIN = 2 , FUN = sum)
apply(X = df[1:2] , MARGIN = 2 , FUN = sum)


apply(X = df["x"] , MARGIN = 2 , FUN = sum)
df["x"]
df[-3]
apply(X = df[1,2] , MARGIN = 2 , FUN = sum)
df[1:2]

# subset()
# data frame에서 조건에 맞는 행을 추출해서 독립적인 data frame 생성

subset(df, x>3)

# x가 3보다 작고 y가 4보다 큰 데이터를 추출하세요
df_sub <- subset(df, x<3 & y >=4)
