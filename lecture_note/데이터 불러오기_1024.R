# 2019-10-24 lecture notes

# 파일로부터 데이터를 읽어들일 때 txt 사용빈도는 높지 않음
# 컴퓨터 간 데이터를 주고 받으려고
# process 간에 데이터 통신을 하기 위해 특정 형식 사용

# 데이터 표현 방식 

# 1. CSV(comma seperated value)
# comma 기호로 데이터를 구분
# 해당 문자열을 전달해서 데이터 통신
# ex) "홍길동,20,서울,김길동,30,부산,최길동,50,인천 ..."
# 장점: 구조가 간단/부가적인 데이터가 적음 -> 많은 양의 데이터 처리가능
# 단점: 구조적 데이터 표현에 한계존재 => 복잡한 데이터에 적절하지 않음/유지보수에 문제 발생

# 2. XML
# csv의 단점 완화
# ex) "<name>홍길동</name><age>20</age><address>서울</address>
# <phone>
# <mobile>010-1234-5678</mobile><home>02-345-6789</home>
# </phone>..."
# 단점: 실데이터보다 부가데이터가 많다 -> '데이터 크기 大'
# 장점: 구조적 데이터 표현 적합/사용 편리/유지보수EZ/데이터 의미 표현가능

# 3. JSON ( JavaScript Object Notation 자바 스크립트 객체표현)
# ex) {name: "홍길동", age: 20, address: 서울...}
# 형식 {key: value}
# 구조적데이터 가능 + 의미표현 + XML보다 크기가 작음 -> JSON


# csv 불러오기
# read.table(); sep필요
# read.csv(); sep=','인 경우 생략, header = T가 디폴트 
df= read.csv(file.choose(),fileEncoding = "UTF-8")
df


# Excel 파일 불러오기 가능
# read.excel()
# 확장 패키지 필요

# base package, recommended package
# xlsx package 설치&로드
install.packages("xlsx")
library(xlsx)

Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_231")

student_midterm = read.xlsx(file.choose(),sheetIndex = 1,encoding = "UTF-8")
student_midterm
class(summary(student_midterm))
# 처리된 결과를 file에 write
# write.table(): data frame을 file에 저장
# cat(): 분석결과(vector)
# capture.output(): 분석결과(list, table)을 file에 저장

cat("처리된 결과는: ","\n","\n",file="c:/R_Lecture/data/report.txt",append=T)

write.table(student_midterm, file="c:/R_Lecture/data/report.txt", append=T, row.names = F, quote = F)
# row.names = 행번호, quote = 문자열에 대한 구두점
capture.output(summary(student_midterm),file="c:/R_Lecture/data/report.txt", append = T)


df =data.frame(x = c(1:5),
               y = seq(1,10,2),
               z = c("a","b","c","d","e"),
               stringsAsFactors = F)
write.xlsx(df,"c:/R_Lecture/data/report.xlsx", row.names = F, col.names = F)

