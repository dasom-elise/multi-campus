# 같은 데이터 타입을 저장하는 자료구조
# 1,2,3차원 vector/matrix/array

# 다른 데이터 타입을 저장하는 자료구조

# List (1차원-선형구조), DataFrame(2차원), 범주형 자료구조; Factor

# FACTOR 범주형 데이터를 저장하기 위한 자료구조
# 범주형 데이터는 
# EX) 방의 크기 "大" "中" "小" => LEVEL
# 일반적으로 vector를 이용해 factor를 만듦

# 6명의 혈액형 데이터를 vector에 저장하고 factor로 변형하기

var1 = c("A형","B형","O형","AB형","A형","B형")
var1

factor_var1 = factor(var1)  # factor라는 명령어에 넣으면 벡터->펙터로 변형
factor_var1 # 형태 및 levels 정리

nlevels(factor_var1) # 범주(level) 개수
levels(factor_var1) # 사용되는 level 출력
is.factor(factor_var1) # 형태가 펙터가 맞는 지 확인 => T

# when using factor? To measure frequency
# 남성과 여성의 성별 데이터로 factor생성하고 빈도수 구하기

var1 = c("MAN","WOMAN","MAN","WOMAN","MAN","WOMAN","MAN","MAN")
f.gender = factor(var1)

table(f.gender) # 범주와 범주에 몇개가 해당하는지(빈도 출력)
plot(f.gender) # 그래프 확인












