# 반복해서 page를 browsing하는 crawling까지 포함해보아요
library(rvest)
library(stringr)

extract_connect = function(k){
  url = "https://movie.naver.com/movie/point/af/list.nhn"
  page <- "page="
  request_url = str_c(url,"?",page,k)
  hp = read_html(request_url,
                 encoding = "CP949")  #인코딩!!!!!!!!!!!
  class(hp)
  nodes = html_nodes(hp,
                   "td.title>a.movie")
  title = html_text(nodes,trim = TRUE)
  
# Review는 xpath로 가져오기
nodes = html_nodes(hp,
                   xpath = '//*[@id="old_content"]/table/tbody/tr[3]/td[2]/text()')
review <- html_text(nodes, trim = TRUE)
review[3]

# for문을 활용하여 각 review를 xpath로 뽑아내기
review = vector(mode="character",length = 10)  # 빈 vector를 만들어 안에 저장



for(idx in 1:10){
  myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                 idx,
                 ']/td[2]/text()')
  nodes = html_nodes(hp,
                     xpath = myPath)
  myTxt <- html_text(nodes, trim = TRUE)
  review[idx] = myTxt[3]
}
naver = cbind(title,review)
return(naver)
}



#################

result_df = data.frame();

for (k in 1:10){
  tmp = extract_connect(k)
  result_df = rbind(result_df,tmp)
}


View(result_df)
