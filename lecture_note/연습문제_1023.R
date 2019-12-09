# 연습문제
# 1,4,6,5,7,10,9,4 를 이용해서 숫자형 vector를 생성하세요
var1 = c(1,4,6,5,7,10,9,4) ; var1

# 아래 두 벡터 연산의 결과는?
x1 = c(3,5,6,8)
y1 = c(3,3,4)
x1+y1
x1*y1

# data frame을 이용하여 다음의 결과를 도출하세요
Age = c(22,25,18,20)
Name = c("James","Mathew","Olivia","Stella")
Gender = c("M","M","F","F")
## 원하는 출력형태: 
##           Age, Name Gender
## 1         22   James  M
## 2         25   Mathew M

df = data.frame(Age = Age, Name = Name, Gender = Gender)

B = subset(df,Age>20)
A = subset(df,Gender == "M")
C = subset(df,Gender != "C")

# 구문 실행 결과
x = c(1,2,3,4,5)
(x*x)[!is.na(x)& x >2]     #9 16 25  # Fancy Indexing (길이가 같은 벡터 T만 매칭)

# 다음 계산 결과는?
x = c(2,4,6,8)
y = c(T,T,F,T)
sum(x[y])


# 제공된 vector에서 결측치(NA)의 개수를 구하는 코드를 작성하세요
var1 = c(34,55,89,45,NA,22,12,NA,99,NA,100)
sum(is.na(var1))

# 결측치를 제외한 평균을 구하세요
mean(var1[!is.na(var1)])

# 두 개의 벡터를 결합
x1 <- c(1,2,3)
x2 <- c(4,5,6)
x3 = c(x1,x2); x3

# vector를 결합해서 matrix만들기

y1 = rbind(x1,x2); y1 # 2행3열(row bind)
y2 = cbind(x1,x2); y2 # 3행2열

# 실행결과는?
x = c("Blue", 10, TRUE, 20)
is.character(x)   # TRUE # 상위타입으로 통합