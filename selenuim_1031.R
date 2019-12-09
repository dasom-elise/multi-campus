# by using selenium, get 동적 page scraping
# 패키지 설치 필요!

install.packages("RSelenium")
library(RSelenium)

# R프로그램에서 셀레늄서버 접속 후 remote driver객체를 return받기

remDr =  remoteDriver(remoteServerAddr="localhost",
             port=4445,
             browserName="chrome")
remDr
# 접속이 성공하면 remote driver를 이용해서 chrome browser를 R code로 제어가능
remDr$open()
# open된 browser의 주소를 변경
remDr$navigate("http://localhost:8080/bookSearch/index.html")

# 입력상자 찾기
inputBox = remDr$findElement(using = "css",
                  "[type=text]")
# 찾은 입력상자에 검색어 입력
inputBox$sendKeysToElement(list("java"))

# AJAX호출을 위해 버튼을 찾아야함 !!  
btn = remDr$findElement(using = "css",
                             "[type=button]")
# 찾은 버튼에 클릭이벤트
btn$clickElement()

# 입력칸 비우기
inputBox$clearElement()

# AJAX 호출이 발생해서 출력된 화면에서 필요한 내용 추출
li_element = remDr$findElements(using = "css",
                                          "li")
# 얻어온 각각의 element에 대해서 함수를 호출
# sapply 얻어온 결과에 대해 특정 함수 적용
myList = sapply(li_element,function(x){
  x$getElementText()   # li사이의 글자 가져오기
})

myList
