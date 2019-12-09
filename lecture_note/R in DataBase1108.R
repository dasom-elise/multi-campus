# R에서 Database에 연결해 보아요
# MySQL에 연결해서 데이터를 가져올 것

# 1. MySQL DBMS를 기동

# 2. R에서 DBMS에 접근하려면 몇개의 패키지가 필요

# JAVA언어 이용
# java필요, javahome 환경변수도 잡아줘야 함
install.packages("rJava")

install.packages("RJDBC") # R언어에서 JDBC라는 기능을 이용하기 위한 패키지
# 자바로 데이터베이스를 사용하기 위한 library
install.packages("DBI") # 데이터베이스를 사용하기 위한 패키지

library(rJava)
library(RJDBC)
library(DBI)

# 필요한 패키징와 로딩이 끝나고

# driver가 필요
# java언어가 database에 접속하고
# 사용하기 위한 기능이 들어있는 library
# 사용하는 데이터베이스마다 설정방법이 다름

# MySQL
# JAVA가 데이터베이스를 접속, 이용하기 위한 설정
drv = JDBC(driverClass = "com.mysql.jdbc.Driver",
           classPath = "C:/R_Lecture/mysql-connector-java-5.1.48-bin.jar")
drv

# R언어에서 Database 연결
conn = dbConnect(drv, "jdbc:mysql://localhost:3306/library",
                 "data",  # MySQL ID
                 "data")    # MySQL PW)
# Query 실행 (SQL: 데이터베이스를 제어하기 위한 언어)
sql = "select btitle,bprice from book where bprice >40000 order by btitle"

df = dbGetQuery(conn, sql);
df
View(df)


library(dplyr)
df %>% filter(bprice > 55000) %>%
  select(btitle)


##################################### R의 기본
# R shiny 웹 프레임워크

# R의 기본/EDA 끝!

# >>> Python ( 로직작성 )
# => data type & data structure & 로직
# => numpy/pandas를 이용한 EDA
# => 통계 개념, Python에서 처리, R에서 처리
# => 통계적 데이터 분석
# Tensorflow를 이용한 MachineLearning(예측,추론) => AI
# DeepLearning(CNN)
# R에서는 어떻게 하는지

# 1월 말까지









