library(stringr)
library(rvest)


#   pick title100 # movienNm에 저장
url = "https://www.rottentomatoes.com/top/bestofrt/"
year <- "year="
request_url = str_c(url,"?",year,2019); request_url
hp = read_html(request_url);hp
movieNm = vector(mode="character",length = 100)

for (idx in 1:100){
  myPath = str_c('//*[@id="top_movies_main"]/div/table/tr[',
                 idx,
                 ']/td[3]/a')
  nodes = html_nodes(hp,
                   xpath = myPath)
  movie = html_text(nodes, trim = TRUE)
  movieNm[idx] = movie[1]
  }
movieNm



# pick rating

movieRt = vector(mode="character")

for ( idx in 1:100){
  myPath = str_c('//*[@id="top_movies_main"]/div/table/tr[',
                 idx,
                 ']/td[2]/span/span[2]')
  nodes = html_nodes(hp,
                     xpath = myPath)
  rating = html_text(nodes, trim = TRUE)
  movieRt[idx] = rating
}
movieRt













#################   
url2 = "https://www.rottentomatoes.com"


library(rvest)
library(httr)
nodes = html_nodes(hp, "td > a.unstyled.articleLink")
nodes
title_url = html_attr(nodes,"href")
title_url

main_url = str_c(url2,title_url)
main_url



########## rating 1~100

rating = vector(mode = "character", length = 100)

for ( idx in 1:100){
  main_url = str_c(url2,title_url[idx])
  hp3 = read_html(main_url)
  nodes_r = html_nodes(hp3, "div > strong.mop-ratings-wrap__text--small"); nodes
  myResult = html_text(nodes_r)
  rating[idx] = myResult[2]
  }
View(rating)








######### in page

hp3 = read_html(main_url)
nodes_r = html_nodes(hp3, "div > strong.mop-ratings-wrap__text--small"); nodes
rating = html_text(nodes_r); rating
rating[2]

#### Genre

nodes_g = html_nodes(hp3, "section.panel.panel-rt.panel-box.movie_info.media > div > div > ul > li:nth-child(2) > div.meta-value > a"); nodes_g
genre = html_text(nodes_g);genre






# Genre 1~100
genre = vector(mode = "character", length = 100)

for ( idx in 1:100){
  main_url = str_c(url2,title_url[idx])
  hp3 = read_html(main_url)
  nodes_g = html_nodes(hp3, "section.panel.panel-rt.panel-box.movie_info.media > div > div > ul > li:nth-child(2) > div.meta-value > a"); nodes_g
  myResult_G = html_text(nodes_g);genre
  genre[idx] = myResult_G
}
genre



#### 합치기


data.frame(movieNm,movieRt,rating,genre,)

















