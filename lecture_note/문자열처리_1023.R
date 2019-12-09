# 문자열 처리
# 빅데이터: 3V(volume, velocity, variety)
# 일반적으로 빅데이터 처리는 문자열 처리를 동반//
# 문자열 처리 패키지(외부 패키지)
# 쉽고 편함
# stringr package

install.packages("stringr")
library(stringr)

var1 = "Honggd1234Leess9032you25최길동2009" ; var1

# 문자열 길이 구하기
str_length(var1)

str_locate(var1,"9032")
# 자료구조 확인 매서드 class / 데이터 타입: mode 
class(str_locate(var1,"9032"))

# 부분 문자열 구하기
str_sub(var1,3,8) # 시작/끝 둘다 포함(inclusive)

# 대소문자 변경
str_to_lower(var1)         #소문자 변환
str_to_upper(var1)         #대문자 변환

# 문자열 변경(교체)
str_replace(var1,"Hong","Choi") #처음 찾은거만
str_replace_all(var1,"9","OOO") #찾은 문자열 전부 다

# 문자열 합치기
var2 = "홍"
var3 = "길동"
str_c(var2,var3)

# 문자열 분할
var1 = "Honggd1234, Leess9032, YOU25, 최길동2009"
str_split(var1,",") # 두번째 인자는 나누는 기준 
class(str_split(var1,","))      # List

# vector 문자열 결합
var1 = c("안녕하세요","이름이뭐에요","저는 홍길동")
paste(var1,collapse = "?")         # ""사이 문자로 구분하여 연결

# 문자열 처리를 쉽고 편하게 하기 위해서는 정규표현식(regular expression)
var1 = "Honggd1234, Leess9032, YOU25, 최길동2034"
str_extract_all(var1, "[a-z]{4}")  # 영소문자 연속4개 #{}없으면 """"끊어져서 표현
str_extract_all(var1, "[A-Z]{4}")  # 0 없음 # list
str_extract_all(var1, "[a-z]{2,}")   # 영문자 소문자로 2개 이상 있는거 모두~뽑아냄
str_extract_all(var1, "[a-z]{2,3}")
str_extract_all(var1,"34")

# 한글만 추출
str_extract_all(var1,"[가-힣]")

# 숫자문자 추출
str_extract_all(var1,"[0-9]{2,}")

# 한글 제외한 나머지 추출
str_extract_all(var1,"[^가-힣]{5}")   # ^이 not의 의미

# 주민등록번호 검사
myId = "801112-13210419"
str_extract_all(myId,"[0-9]{6}-[1234][0-9]{6}")
