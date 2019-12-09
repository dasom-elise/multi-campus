# ggplot2를 이용해서 4가지 종류의 그래프를 그림
# 여기에 추가적인 객체를 포함시켜서 그래프를 좀 더 이해하기 쉬운 형태로 만들어보자!

# mpg: 자동차연비에 대한 dataset # economics: 월별 경제 지표에 대한 dataset

# 날짜별 개인 저축률에 대한 선그래프를 그려보아요~

## 일반적이누직선을 그릴 수 있음
ggplot(data = economics,
       aes(x = date,
           y = psavert)) +
  geom_line() +
  geom_abline(intercept = 12.1,
              slope = -0.0004444)     # 절편/ 기울기

ls(economics)

# 수평선을 그릴 수 있어요


ggplot(data = economics,
       aes(x = date,
           y = psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))

# 수직선도 그릴 수 있음! 가장 개인저축률이 낲은 날짜에 대한 수직선을 그릴려고 한다
# 가장 개인저축률이 낲은 날짜를 추출해보아요
the_date = economics %>%
  filter(psavert == min(psavert)) %>% select(date)

result = the_date$date


ggplot(data = economics,
       aes(x = date,
           y = psavert)) +
  geom_line() +
  geom_vline(xintercept = result)

# if 직접 날짜를 입력해서 수직선을 표현하려면?
ggplot(data = economics,
       aes(x = date,
           y = psavert)) +
  geom_line() +
  geom_vline(xintercept = "2005-05-01")
# no, you can't
#  ? - 날짜형식으로 되어있는 문자열이기 때문에 그려지지 않음
# data type을 날짜로 변환// as.date()안에 들어오는것을 날짜형식 데이터로 변환
ggplot(data = economics,
        aes(x = date,
    y = psavert)) +
  geom_line() +
  geom_vline(xintercept = as.Date("2005-05-01"))



## graph안에서 텍스트를 표현하려면?
ggplot(data = economics,
       aes(x=date, y=psavert)) +
  geom_point() +
  xlim(as.Date("1990-01-01"),
       as.Date("1992-12-01")) +
  ylim(7,10) +
  geom_text(aes(label = psavert,
                vjust=-0.5,
                hjust=-0.2)) 


### 특정 영역을 highlighting 하기 위해 사용!
ggplot(data = economics,
       aes(x=date, y=psavert)) +
  geom_point() + 
  annotate("rect",
           xmin = as.Date("1991-01-01"),
           xmax = as.Date("2000-01-01"),
           ymin = 8,
           ymax = 13,
           alpha = 0.3,
           fill = "red")

# 여기에 추가적으로 화살표도 표현해보쟈!
ggplot(data = economics,
       aes(x=date, y=psavert)) +
  geom_point() + 
  annotate("rect",
           xmin = as.Date("1991-01-01"),
           xmax = as.Date("2000-01-01"),
           ymin = 8,
           ymax = 13,
           alpha = 0.3,
           fill = "red") +
  annotate("segment",
           x = as.Date("1980-01-01"),
           xend=as.Date("1990-01-01"),
           y = 7.5,
           yend = 8.5,
           arrow=arrow(),
           color = "blue")

# 뜬금없는 텍스트를 내가원하는 위치에!

ggplot(data = economics,
       aes(x=date, y=psavert)) +
  geom_point() + 
  annotate("rect",
           xmin = as.Date("1991-01-01"),
           xmax = as.Date("2000-01-01"),
           ymin = 8,
           ymax = 13,
           alpha = 0.3,
           fill = "red") +
  annotate("segment",
           x = as.Date("1980-01-01"),
           xend=as.Date("1990-01-01"),
           y = 7.5,
           yend = 8.5,
           arrow=arrow(),
           color = "blue") +
  annotate("text",
           x = as.Date("1985-01-01"),
           y = 15,
           label="소리없는 아우성",
           color = "purple")

###

ggplot(data = economics,
       aes(x=date, y=psavert)) +
  geom_point() + 
  annotate("rect",
           xmin = as.Date("1991-01-01"),
           xmax = as.Date("2000-01-01"),
           ymin = 8,
           ymax = 13,
           alpha = 0.3,
           fill = "red") +
  annotate("segment",
           x = as.Date("1980-01-01"),
           xend=as.Date("1990-01-01"),
           y = 7.5,
           yend = 8.5,
           arrow=arrow(),
           color = "blue") +
  annotate("text",
           x = as.Date("1985-01-01"),
           y = 15,
           label="소리없는 아우성",
           color = "purple") +
  labs(x = "연도", y = "개인별 저축률",
       title = "연도별 개인저축률 추이") +
  theme_dark()







