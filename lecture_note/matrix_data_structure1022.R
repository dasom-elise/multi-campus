# Data Structure 
# Matrix: 동일한 data type을 가지는 2차원 형태의 자료구조

# matrix 생성

var1 = matrix(c(1:9)) # matrix 생성기준은 행(row)
var1 
var1 = matrix(c(1:10),nrow=2)
var1 #2행 5열

var1 = matrix(c(1:10),nrow=3)
var1 #3행 4열

var1 = matrix(c(1:10),nrow=2, byrow = T) # 행기준데이터 채움(왼->오)
var1

# vector를 연결해서 matrix를 만들 수 있음
# vector를 가로방향/세로방향으로 붙여서 2차원 형태로 만들 수 있음

var1 = 1:4
var2 = 5:8

mat1 = rbind(var1,var2) # 행단위로 붙임 row; rbind
mat1
mat2 = cbind(var1,var2) # 열단위로 col; cbind
mat2

var = matrix(c(1:21), nrow=3, ncol=7)
var

var[1,4]

var[2,] # 2행의 모든 열

var[,3] # 3열의 모든 행

# 11 12 14 15 의 값을 가져오려면?

var[2:3,4:5]
var[c(2,3),c(4,5)]

length(var) #요소 개수
nrow(var)
ncol(var)

# matrix에 적용할 수 있는 함수 
# apply() 함수를 이용해서 matrix에 특정 함수를 적용
# apply() 함수는 속성이 3개 들어감
# X => 적용할 matrix
# MARGIN => 1이면 행 기준, 2이면 열 기준
# FUN(function) => 적용할 함수
var = matrix(c(1:21), nrow=3, ncol=7)
var

apply(X = var, MARGIN = 1, FUN = max)
apply(X = var, MARGIN = 1, FUN = mean)
apply(X = var, MARGIN = 1, FUN = min)

help(apply)

# 적용할 함수를 직접 만들어서 사용가능

# matrix의 연산
# matrix의 요소단위의 곱연산
# 전지행렬을 구해보아요~ㅎ
# 행렬곱(matrix product)
# 역행렬(matrix inversion) -> 가우스 소거법 이용 

var1 = matrix(c(1:6), ncol=3)
var2 = matrix(c(1,-1,2,-2,1,-1),ncol=3)
var1
var2
var3 = matrix(c(1,-1,2,-2,1,-1),ncol=2)
var3
# elementwise product(요소단위 곱연산)
var1 * var2
# matrix product(행렬곱)
var1 %*% var3

#전지행렬 transpose
var1
t(var1)

# 역행렬: matrix A가 n x n일 때 다음의 조건을 만족하는 행렬 B가 존재하면 행렬 B를 A의 역행렬이라고 한다
# AB = Ba = I(단위행렬 E)
matrix(1:4,nrow=2)
solve(matrix(1:4,nrow=2))

# Array: 3차원 이상. 같은 데이터 타입으로 구성

var1 = array(c(1:24),dim=c(3,2,4))
var1








