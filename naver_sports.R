# install.packages("RSelenium")
library(RSelenium)
library(XML)
url = "https://sports.news.naver.com/esports/index.nhn"
# sessionInfo()
remDr = remoteDriver(remoteServerAddr="localhost",
                     
                     port=4445,
                     
                     browserName="chrome")
remDr$open()

# open된 browser의 주소를 변경

remDr$navigate(url)

mySearch = remDr$findElement(using = "css","#_headlineMainArticle > b > span")

mySearch$clickElement()

comment = remDr$findElements(using = "css","span.u_cbox_contents")
# span . => class


myComment = sapply(comment, function(x){x$getElementText()})
myComment






















#btn = remDr$findElement(using = "css","#querybtn")

#mySearch$sendKeysToElement(list(""))
#mySearch$clearElement()

#btn$clickElement()


#remDr$navigate("https://search.naver.com/search.naver?where=news&ie=UTF-8&query=%EB%A1%A4%EB%93%9C%EC%BB%B5")
#newsData = remDr$findElement(using = "css","#sp_nws1 > dl > dt > a")
#newsData$clickElement()

#myWord = remDr$findElements(using = "css","#sp_nws1 > dl > dt > a")
#sp_nws19 > dl > dt > a

#mytext = sapply(myWord,function(x){x$getElementText()})

#mytext


# 얻어온 각각의 element에 대해서 함수를 호출
library(stringr)
# sapply 얻어온 결과에 대해 특정 함수 적용
#title = vector(mode="character")

#for (i in 1:32) {newsTitle = remDr$findElements(using = "xpath",str_c('//*[@id="sp_nws',               i,                                                       '"]/dl/dt/a'))   extractNews = sapply(newsTitle, function(x){x$getElementText()}) title[i] = extractNews }

