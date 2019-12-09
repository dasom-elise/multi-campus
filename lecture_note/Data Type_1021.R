
# DATA TYPE
# 
# R의 데이터 타입: 기본/특수 데이터타입

#기본데이터타입:
# 1. 숫자형_numeric(정수/실수)
# ex. 실수형 100, 2, 3 / 정수형: 100L , 3L (#L이 붙으면 정수형)
# 2. 문자열_character(하나 혹은 둘 이상 문자의 집단)
# '', "" 이상 문자의 집합
# ex) "홍길동" '홍길동' '홍' 
# 3. 논리형_logical(TRUE as T,FALSE as F)
# 4. 복소수형_complex
# EX. 4-3i

# 특수데이터타입
# 1. NULL: 객체가 존재하지 않음을 지칭하는 개체
var1 = NULL
# 2. NA: NOT AVAILABLE 유효하지 않음~
# 결측치를 표현할 때 사용

# 3. NAN: Not availavble number, NOT A NUMBER
sqrt(-3)

# 4. Inf: 양의 무한대
# 5. -Inf: 음의 무한대


var1 = 100
var2 = 100L
var3 = "Hello"
var4 = TRUE
var5 = 4-3i
var6 = NULL
var7 = sqrt(-3)

#데이터 타입을 조사하기 위해 제공된
#함수는 mode()

mode(var1)  #numeric
mode(var2)  #numeric
mode(var3)  #character
mode(var4)  #logical
mode(var5)  #complex
mode(var6)  #NULL
mode(var7)  #numeric


# is계열의 함수가 제공
is.numeric(var1)
is.numeric(var2)
is.numeric(var3)

is.integer(var1) # FALSE 100은 정수가 아닌 실수 인티저는 정수만 의미
is.integer(var2) 

is.null(var5)

#is 계열의 함수 多

#데이터 타입의 우선순위 존재
# 기본 데이터 타입 4개에 대해서 우선수위가 가장 높은 것은 "Character"
#그 다음은 복소수 "complex"
# "numeric""
# 가장 우선순위가 낮은 것은 "logical"

myvector = c(TRUE, 10, 30)
myvector
#우선 순위가 가장 높은 것으로 통일

my = c(TRUE, 10, "Hello Wolrd")

#데이터 타입을 다른 데이터 타입으로 바꿀 수 있음
# type casting

var1 <- 3.14159265358979
var2 <- 0
var3 <- "3.14159265358979"
var4 <- "Hello"


#데이터 타입을 변경할 떄는 as 계열의 함수를 활용
#데이터 타입 확인은 is

as.character(var1)
as.integer(var1)  #3
as.logical(var2) #FALSE
as.double(var3)



######################################################

# 자료구조 (내일)
# data structure~~~ 10/22




























