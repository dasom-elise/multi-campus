#Operator (연산자)

var1 <- 100
var2 <- 3
var1/var2 # in Java: 33 / in R: 33.333

#몫 구하기
var1 %/%  var2 #33
#나머지 구하기
var1 %% var2 #1


##비교연산자

var1 == var2  #FALSE
var1 != var2 # TRUE (항상 대문자)

var1 > var2
var1 < var2

# &, && 논리연산자
# 양쪽 값이 TRUE이면 TRUE 둘중하나라도 FALSE이면 FALSE반환

TRUE & TRUE # true
TRUE && FALSE #FALSE

# &&은 둘다 논리연산자 and

# or 연산자 ||, |

TRUE | TRUE  #TRUE
FALSE | FALSE # FALSE

# 변수는 1개짜리 공간
# r은 여러가지 자료구조 존재
# 가장 대표적인 자료구조(데이터를 저장하는 구조)에는 VECTOR 有
# VECTOR는 연속적인 저장공간(선형, 1차원적); 
# 다른 언어의 ARRAY와 같은 구조
# 함수를 이용해서 vector를 생성
# c() combine의 약자

c(10,20,30)
c(TRUE, 20, 3.14, FALSE) #데이터 형식을 일치시키기 위한 작업, 데이터 형식맞추기

c(TRUE,FALSE) & c(TRUE, TRUE)

c(TRUE,FALSE) && c(TRUE, TRUE)
#첫번째 요소만 & 연산 수행

c(TRUE,F,TRUE) & c(FALSE,T,F) #벡터요소의 개수가 같아야 수행가능

!c(T,F,T,F)


#수학함수
abs(-3)
round(3.1415)
sqrt(100) #루트 #제곱근
sqrt(4)













