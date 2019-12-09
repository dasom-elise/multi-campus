
# 한국 복지 패널 데이터
# 한국 보건 사회연구원 => 2006년부터 10년간 7000여 가구에 대한 경제활동/생활실태/복지욕구 등등등

# spss파일을 열어야함
# install.packages("foreign")
library(foreign)

# 필요한 패키지 미리 로드
library(stringr)
library(ggplot2)
library(dplyr)
library(xlsx)

# 사용할 raw data 불러오기
raw_data_file = "C:/R_Lecture/data/Koweps_hpc10_2015_beta1.sav"
raw_welfare <- read.spss(file = raw_data_file,
                         to.data.frame = TRUE)
# 원본 보존하기
welfare = raw_welfare

str(welfare)


# 데이터 분석에 필요한 컬럼은 컬럼명을 변경해주자!!
welfare = rename(welfare, 
                 gender = h10_g3,
                 birth = h10_g4,
                 marriage =  h10_g10,
                 religion = h10_g11,
                 code_job = h10_eco9,
                 monthly_income = p1002_8aq1,
                 code_region = h10_reg7)

#################준비완료

# 1. 성별에 따른 월급 차이
table(welfare$gender) # 이상치 확인

# 1은 male, 2는 female로 변경

welfare$gender = ifelse(welfare$gender == 1,
                        "male",
                        "female")
table(welfare$gender)

class(welfare$monthly_income)

summary(welfare$monthly_income)
# median이 평균보다 작음, 저소득층이 많다
# median < mean 

qplot(welfare$monthly_income) +
  xlim(0,1000)           # 0 ~ 250 사이에 가장 많은 사람들이 분포

# 월급에 대한 이상치부터 처리
welfare$monthly_income = ifelse(welfare$monthly_income %in% c(0,9999),
                                NA,
                                welfare$monthly_income)
# NA가 몇개인지 확인
table(is.na(welfare$monthly_income))

# 결측치를 처리
is.na(welfare$monthly_income)

# 성별당 평균 임금을 알고싶음! 분석준비는 끝.

gender_income = welfare %>%
  filter(!is.na(monthly_income)) %>%
  group_by(gender) %>%
  summarise(mean_income = mean(monthly_income))
gender_income

gender_income = as.data.frame(gender_income)

############## 결과 데이터프레임을 얻었으니 그래프를 그려본다

ggplot(data = gender_income,
       aes(x = gender,
           y = mean_income)) +
  geom_col(width = 0.5) +
  labs(x = "성별",
       y = "평균 월급",
       title = "성별에 따른 월급",
       subtitle = "남성이 여성보다 약 150만원이상 많이 벌어요!!",
       caption = "Example 1 Fig")

# 2. 나이와 월급의 관계 파악 # 몇 살에 월급을 가장 많이 받을까?
# 나이에 대한 월급을 선그래프로 표현

class(welfare$birth)
summary(welfare$birth)
table(is.na(welfare$birth)) # 결측치 없음!

# 이상치 처리
welfare$birth = ifelse(welfare$birth %in% c(9999),
                                NA,
                                welfare$birth)

qplot(welfare$birth)

# 나이에 대한 column 만들기
welfare = welfare %>%
  mutate(age = 2015 - birth + 1)
summary(welfare$age)

age_income = welfare %>%
  filter(!is.na(monthly_income)) %>%
  group_by(age) %>%
  summarise(income = mean(monthly_income))

head(age_income)

age_income = as.data.frame(birth_income)

age_income %>% arrange(desc(income)) %>%
  select(age) %>%
  head(1)     # 가장 월급을 많이 받는 나이


ggplot(data = age_income,
       aes(x = age,
           y = income)) +
  geom_line()

# 정답: 2015년 기준 53살에 318.6777만원


# 3. 연령대에 따른 월급 차이
# 30대 미만: 초년(young)
# 30~59세: 중년(middle)
# 60세 이상: 노년(old)

# 위의 범주로 연령대에 따른 월급 차이 분석



welfare = welfare %>%
    mutate(generation = ifelse(age < 30, "초년(young)",
                               ifelse(age < 60,
                                      "중년(middle)",
                                      "노년(old)")))
welfare$generation

table(welfare$generation)

generation_income = welfare %>%
  filter(!is.na(monthly_income)) %>%
           group_by(generation) %>%
           summarise(gen_income = mean(monthly_income))


generation_income = as.data.frame(generation_income)

ggplot(data = generation_income,
       aes(x = generation,
           y = gen_income)) +
       geom_col(width = 0.5)


## ggplot은 막대그래프를 그릴 때 x축에 대해 알파벳 오름차순으로 정렬해서 출력
# 막대그래프 크기로 순서를 바꾸려면?

ggplot(data = generation_income,
       aes(x = reorder(generation,gen_income),
           y = gen_income)) +
  geom_col(width = 0.5)

# 막대그래프를 그릴 때 x축을 내가 원하는 순서로 바꾸려면 어떻게 해야하나요?


ggplot(data = generation_income,
       aes(x = generation,
           y = gen_income)) +
  geom_col(width = 0.5) +
  scale_x_discrete(limits = c("초년(young)","중년(middle)","노년(old)"))
# 탐색적 데이터분석 방법!! #
# 데이터를 끄집어냄,,!BDA #


# 4. 연령대 및 성별의 월급 차이를 알아보아요


gengen_income = welfare %>%
  filter(!is.na(monthly_income)) %>%
  group_by(generation,gender) %>%
  summarise(incomes = mean(monthly_income))

gengen_income = as.data.frame(gengen_income)



## 데이터 중첩차트 처리하기
# 누적차트 만들기

ggplot(data = gengen_income,
       aes(x = generation,
           y = incomes)) +
  geom_col(aes(fill = gender))


ggplot(data = gengen_income,
         aes(x = generation,
             y = incomes,
            fill = gender)) +
  geom_col()

# 옆으로 분리하기!   # dodge~~
ggplot(data = gengen_income,
       aes(x = generation,
           y = incomes,
           fill = gender)) +
  geom_col(position = "dodge")


# 5. 나이 및 성별에 따른 월급 차이 분석
# line으로/시계열(두개그려야함!)

agegender = welfare %>%
  filter(!is.na(monthly_income)) %>%
  group_by(age,gender) %>%
  summarise(incomes = mean(monthly_income))

agegender = as.data.frame(agegender)

ggplot(data = agegender,
       aes(x = age,
           y = incomes,
           fill = gender,
           color = gender)) +
  geom_line(size=1)


# 직업별 월급 차이를 분석
# 가장 월급을 많이 받는 직업?
# 가장 월급을 작게 받는 직업?
head(welfare$code_job)
table(is.na(welfare$code_job))
welfare$code_job = ifelse(welfare$code_job %in% c(0,9999),
                                NA,
                                welfare$code_job)
is.na(welfare$code_job)


code_job_file = read.xlsx(file = "C:/R_Lecture/data/Koweps_Codebook.xlsx",sheetIndex = 2, encoding = "UTF-8")

code_job_file                          

new_file = left_join(welfare,code_job_file,by="code_job")

answer = new_file %>%
  filter(!is.na(monthly_income),
         !is.na(code_job)) %>%
  group_by(job) %>%
  summarise(mean_incomes = mean(monthly_income)) %>%
  arrange(desc(mean_incomes))



tail(answer,10)
min(answer$mean_incomes)
max(answer$mean_incomes)


answer = as.data.frame(answer)

head(answer,1) # 1 금속 재료 공학 기술자 및 시험원 845.0667
tail(answer,1) # 142 가사 및 육아 도우미 80.16648

ggplot(data = answer,
       aes(x = job,
           y = incomes)) +
  geom_point(size = 1, color="blue")

ggplot(data = answer,
       aes(x = reorder(job,mean_incomes),
           y = mean_incomes )) +
  geom_col() +
  coord_flip()


# 종교유무에 따른 이혼율
# 종교가 있는 사람이 이혼을 덜 할까?

# 종교가 없는 사람의 이혼율

head(welfare$marriage)


# 종교 결측값처리
welfare$religion = ifelse(welfare$religion %in% c(0,9),
                          NA,
                          welfare$religion)

table(is.na(welfare$religion))


 
welfare = welfare %>%
  mutate(myMarriage = ifelse(marriage == 3, "divorced",
         ifelse(marriage ==1, "married",
                ifelse(marriage ==2, "married",
                       ifelse(marriage ==4, "married",
                              NA)))))
View(welfare$myMarriage)
table(welfare$myMarriage)




religion_divorce = welfare %>%
  filter(!is.na(myMarriage)) %>%
  select(myMarriage,religion) %>%
  group_by(religion,myMarriage) %>%
  summarise(count=n()) %>%
  mutate(total_sum = sum(count)) %>%
  mutate(pct = round(count/total_sum*100,1))



religion_divorce




















