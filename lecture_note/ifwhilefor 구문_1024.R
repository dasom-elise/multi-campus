# R은 프로그래밍 언어
# 제어문 있음 # if for while

# if 구문
# 조건에 따라 실행되는 code block을 제어할 수 있음 

var1 = 100
var2 = 20
if(var1 > var2){ cat("참트루")} else { cat("거짓이에여여")}



# 축약형 ifelse # 3항 연산자
var1 = 30
var2 = 20
ifelse(var1>var2,"var1이 더 크다","var2가 더 크다")

ifelse(var1>var2,var1*var2,var1%%var2)


# 반복문 (for, while)
# for: 반복 횟수만큼 반복 실행
# while: 조건이 TRUE일 동안 반복 실행

for( var1 in seq(1:5)) {print(var1)}

idx = 1
mysum = 0

while(idx < 10){
  mysum = mysum + idx; idx = idx + 1}
mysum
sum(c(1:9))

# logic (제어문 이용) 1-100 사이의 3의 배수 출력
x = 1

for ( x in seq(1:100)){ if( x %% 3 == 0) {print(x)}}

# 1-100 사이의 prime number 출력


for (x in seq(2:100)) { if( x == 2){T} else if ( x %% 2 == 0){F} else if ( x %% 3 ==0){F} else if ( x %% 4 ==0){F} else if ( x %% 5 ==0){F} else {print(x)}}

# 사용자 정의 함수
# 함수명 <- 변수설정 function
# 입력 받은 숫자를 제곱해서 돌려주는 함수만들기

myFunc = function(x) {
  x = x * x
  return(x)
  }

var1 = myFunc(5)
var1

var1 = c(1:10)

# sum함수와 동일한 기능인 mySum을 만들어보쟈
# vector를 입력으로 받아서 합을 구해주는 함수

mySum = function(x) {
  result = 0
  for(t in x){
    result = result + t
  }
  return(result)
}
mySum(var1)



num = 1:100
is.prime1 <- function(num) {
  if (num == 2) {
    TRUE
  } else if (any(num %% 2:(num-1) == 0)) {
    FALSE
  } else { 
    TRUE
  }
}
is.prime1
