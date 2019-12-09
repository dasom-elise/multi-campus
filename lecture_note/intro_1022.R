# R은 통계계산을 위한 프로그래밍 언어/소프트웨어
# R의 장점: 무료(Free) => 오픈소스 생태계
# R & Python
# R download: R studio -> script 작성
# R 프로그램의 기본
# 주석활용 #statement의 종료 ;생략가능
# R은 대소문자 구분 case-sensitive
# 값 부여 방법: =, ->, <-

my_var = 100
print(my_var)
cat("변수 값은:", my_var)
var1 = seq(1,100,3)
var1
 
#기본적인 연산자 Operator

var1 = 100 #numeric
var2 = 3

result = var1/var2

result
result2 = var1 %% var2 #나머지
result3 = var1 %/% var2  #몫

options(digits = 5)
#디폴트 값은 7

sprintf("%.9f",result) # 결과는 문자열로 출력됨 #character

#비교연산자

var1 == var2 #논리연산 T/F
var1 != var2 #같지않다

# and와 or연산 && || 활용

# data type (기본4, 특수4)
# numeric, character, logical, complex(복소수)
# NULL, NaN(Not Available Number), NA(결측치 Not Available), Inf(양의 무한대)

# data type을 판단 해주는 함수

mode(result)
mode("4차산업 머신러닝 수업")
mode(4+3i)

# T/F로 판단 해주는 is 함수 
is.character(result)

# 데이터 타입에 따른 우선순위: character > complex > numeric > logical

# R은 as함수를 통해 데이터 타입을 바꿀 수 있음

t = "3.141592"
mode(as.double(t) #numeric

t = TRUE
as.numeric(t)
t=100
as.logical(100)
t= 0
as.logical(t)








