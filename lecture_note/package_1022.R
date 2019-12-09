# Package
# R은 base package가 같이 설치됨/ 추가기능을 위해서는 외부 package설치
# 많이사용하는 package는 ggplopt2
# package 설치를 위해
install.packages("ggplot2")
# 라이브러리나 require 중 하나를 이용해서 로드
library(ggplot2)
require(ggplot2)

# 빈도를 나타내는 막대그래프를 그리기 위한 VECTOR
# 패키지 안의 함수를 활용해 히스토그램 그리기
var1 = c("a","b","c","a","b","b","c","a","b","a","a")

qplot(var1)

# 설치된 패키지 삭제 (패키지 설치 위치로 가서 직접 삭제도 가능)
remove.packages("ggplot2")

# 패키지 설치된 경로 알아보기
.libPaths()

# 패키지 설치 경로 변경
.libPaths("c:/R_Lecture/lib")

# 함수 도움말 보기
help(qplot)

example(qplot)

# working directory
getwd()
setwd("c:/R_Lecture")
