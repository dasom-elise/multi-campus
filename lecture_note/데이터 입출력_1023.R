# 데이타 입출력
# 키보드로부터 데이터 받기
# Scan() 함수를 이용해서 숫자 데이터를 받음
myNum = scan()
myNum

# scan()을 이용해서 문자열도 입력 가능
var1 = scan(what=character())
var1

# 키보드로부터 데이터를 받기 위해서 edit()함수를 이용 가능
var1 = data.frame()
df = edit(var1)
df

# 파일로부터 데이터를 읽기

# text 파일에 ","로 구분된 데이터들을 읽어들이기

# read.table()을 사용

getwd()
# c:/R_Lecture/Data

setwd(str_c(getwd(),"/Data")
      
ex <- read.table("C:/R_Lecture/Data/student_midterm.txt",fileEncoding = "UTF-8")      
a = read.table(file = "student_midterm.txt", sep = ',',fileEncoding = "UTF-8")
t = read.table(file.choose(), sep = ',',fileEncoding = "UTF-8")