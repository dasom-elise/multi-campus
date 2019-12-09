# 연습문제
# 데이터: 2 3 5 6 7 10
# 1. 주어진 데이터로 vector x를 생성하세요
x <- c(2, 3, 5, 6, 7, 10); x

# 2. 주어진 데이터 각각을 제곱해서 vector x 를 만드세요
x = x^2; x

# 3. 주어진 데이터 각각을 제곱해서 합을 구하세요
mySum = sum(x); mySum

# 4. 주어진 데이터에서 5보다 큰 값들로 구성된 x를 구하세요
t = c(2,3,5,6,7,10) > 5  # mask
x[t] # mask # fancy index

x = subset(x, x > 5) ; x

# 5. 벡터 x의 길이를 구하시오.
length(x)

# 6. R의 패키지 중에 usingR을 사용해본다
install.packages("UsingR")
library(UsingR)
data("primes")
primes # 1-2003까지 소수를 가지고있음
head(primes)
tail(primes)

# 7. 1-2003 프라임넘버 몇개?
length(primes)

# 8. 1-200, prime넘버 몇개?
sum(primes < 201)

# 9. 평균?
mean(primes)

# 10. 500-1000의 prime number로 구성된 vector를 하시오.

p = primes[primes>=500 & primes <= 1000] ; p

# 2차원 matrix 
# 1 5 9
# 2 6 10
# 3 7 11
# 4 8 12
# 11. 해당형태의 매트릭스 만드시오
x = matrix(c(1:12), nrow = 4, byrow = FALSE) ; x

# 12. 전치행렬
t(x)

# 13. 첫번째 행만 추출하세요
x[1,]

# 14. matrix x에 대해 6,7,10,11 뽑아내기
x[2:3,2:3]

# 15. matrix x에 대해 x의 두번째 열의 원소가 홀수 인 행들만 ㄴ뽑아서 matrix p를 생성하세요
x[,2]

p = subset(x,x[,2]%%2 != 0)
p = x[x[,2] %% 2== 1,] # 선생님 답안

## Programming
## 홀수 개의 숫자로 구성된 숫자문자열/ 문자열의 개수는 7.9.11개로 제한
## 중앙 숫자를 기분으로 앞과 뒤의 숫자를 분리한 후 분리된 두 수를 거꾸로 뒤집어서 두 수의 차를 구한다.
## ex) 764 8 623
##    467 326 각 숫자를 거꾸로 뒤집음 -> 467-326 = 141 계산
help(substr); help(rep)
p = c(1,2,1,6,5,7,2)
t = "1216572"

input[5:7]
input[-5:-7]
input[-4:-1]
input[1:3]

length(t)
mode(t)
class(t)

substr(t,1,3)

class(A)
A = input[7:5] ; A
B = input[3:1] ; B

p = c(1,2,1,6,5,7,2)
a=length(p); b=length(p)-2; my1 = p[3:1]; my2 = p[a:b]; 
if (a == 7 ){if(my1 > my2){cat(my1-my2)} else {cat(my2-my1)}} else {cat("계산할 수 있는 식이 없습니다")}

library(stringr)

input = "1216572"

#a는 중간 위치 구하는 것, b는 끝자리 구하는ㄱ것
a = str_count(input)%/%2 + 1
b = str_count(input)

#var1은 처음부터 중간전까지, var2는 중간 후부터 끝까지
var1 = str_sub(input,1,a-1)
var2 = str_sub(input,a+1,b)


#글자를 하나씩 ""를 기준으로  나눈 리스트를 생성함
str_split(var1, pattern="")
str_split(var2, pattern="")


#글자를 뒤집는다(rev) #열기준으로 [[1]]
#리스트를 불러와보면
#     [[1]] 이런식으로 생겼다. 이걸 뒤집음
# [1]  "5" "6" "7"
c = rev(str_split(var1, pattern="")[[1]])
d = rev(str_split(var2, pattern="")[[1]])

#얘네를 ""떼버리고 붙임
e = paste(c,collapse = "")
f = paste(d,collapse = "")

#숫자로 바꿔서 빼버림 
result = abs(as.integer(e)-as.integer(f))
result








