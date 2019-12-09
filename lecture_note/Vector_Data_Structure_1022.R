# DATA STRUCTURE

# Data Type: 저장된 데이터의 성격(Numeric, Character, Logical)
# Data Structure: 변수에 저장된 데이터의 메모리 구조

# 6개기억/2개분류

# Vector (1차원 자료구조; 선형; 같은 data type;)
# Matrix (2차원 자료구조; 행열; 같은 data type;)
# Array (3차원 이상의 자료구조; 같은 data type;)
# List (1차원; 다른 data type; 중첩자료구조;)
# Data Frame (2차원; 다른 data type;)
# Factor (범주형 자료구조;)

# 1. vector
# vector는 scalar의 확장, 1차원 선형구조
# 같은 data type으로 구성
# vector는 첨자(index)형태로 access 가능
# 첨자(Index)의 시작은 1
# vector 생성
# 1) combination 함수 사용(C() )
# 일반적으로 규칙성이 없는 데이터를 이용해서 vector를 생성할 때 이용

var1 = c(1,2,6,9,10)
mode(var1)

var2 = c(TRUE,FALSE, TRUE)

var3 = c("홍길동","김길동","최길동")

var4 = c(200, TRUE,"아우성")

mode(var4)

var5 = c(var1,var2) # 1,2,6,9,10,1,0,1 #vector의 결합

# 2. : 을 이용해서 vector를 생성할 수 있음.
# numeric에서만 사용가능, 1씩 증가하거나 감소하는 숫자와의 집합을 vector 로 만들 때 사용
var1 = 1:5; var1
var2 = 5:1; var2
var3 = 3.4:10; 
var3

x <- c (1,2,3,4,5,6)
matrix(x,nrow = 3, ncol = 2)

# 3. seq()를 시용해서 vector를 생성
# :의 일반형으로 등차수열을 생성해서 vector화 할 때
var1 = seq(from=1, to=10, by=3)
var1
var1 = seq(1,10,3)
var1
# 4. rep()를 이용해서 vector 생성 가능
# replicate의 약자
# 지정된 숫자만큼 반복해서 vector 생성
var1 = rep(1:3, times=3)
var2 = rep(1:3, each=3)
var1

# vector의 데이터 타입을 확인
mode(var1)

# vector의 원래 데이터 개수는?

var1 = c(1:10)
length(var1)         #30

#length()를 다른 의미를 사용?
var1 = seq(1,100, length=7)
var1

#Vector에서 데이터 추출
#vector의 사용은 []를 이용해서 데이터 추출
var1 = c(67, 80, 87, 90, 50, 100)

var1[1]
var1[length(var1)] #vector의 제일 마지막 추출
var1[2:4] #vector를 만들기 위해 사용한 :, c(), rep(), seq()를 활용해 vector 요소에 접근하기 위한 용도로 사용가능 
var1[c(1,5)]
var1[seq(1,4)]

var1[7] #NA 존재 하지 않는 값에 대한 access
var1[-1] #첫번째 인덱스를 제외하고 값을 불러옴

var1[-c(1:3)]

var2 = c("h","e","l","l","o",'w','o','r','l','d')
var2[1:length(var2)]


# vector 데이터의 이름
var1 = c(67, 90, 50)
names(var1) # 각 데이터에 부여된 이름 無
names(var1) = c("국어","영어","수학")
names(var1)
var1[2]
var1["영어"] #이름을 통해 해당 데이터에 access 가능

# vector의 연산
# 수치형 vector는 scalar를 이용하여 사칙연산을 할 수 있음/ vector & vector 간의 연산도 수행 가능
var1 <- 1:3
var2 <- 4:6
var1; var2

var1 * 2
var1 * var2
var1 + var2 #같은 위치끼리

var3 = 5:10

var1 + var3
# 1 2 3 1 2 3              -> 6 8 10 9 11 13
# 5 6 7 8 9 10         recycling rule

var4 = 5:9
var1 + var4

# vector간의 집합 연산
# union(): 합집합 / intersect(): 교집합 / setdiff(): 차집합

var1 = c(1:5)
var2 = c(3:7)
union(var1,var2)
intersect(var1,var2)
setdiff(var1,var2)

# vector 간의 비교(같은지 다른지)
# identical: 비교하는 두 vector 의 요소가 개수, 순서, 내용 완전히 같아야 logical 값 반환

var2 = c(1:5)
var1 = 1:5
var3 = c(1,3,2)
identical(var1,var2)
identical(var1, var3)

# setequal: 비교하는 두 vector 요소의 크기, 순서와 상관없이 내용만을 비교
# 데이터만 같으면 됨(중복 상관 없음)
setequal(var1,var2)
setequal(var1, var3)


# 요소가 없는 vector
var1 = vector(mode="character",length=10)
var1
# logical = FALSE, numerical = 0  character = "" 



















