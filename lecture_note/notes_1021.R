# R의 주석은 ###을 이용해요 
# 주석을 이용하면 한 줄이 몽땅 코멘트 처리가 됨
# 프로그래밍 언어에서 statement를 종료하기 위해 사용하는 기호는 ";" 그러나 R은 생략 가능
3+9
#코드 수행을 위해서는 Ctrl + Enter
#대소문자를 구분한다
#변수를 만들 때 camelcase
# ex) myResult # camelcase notation
MyResult # pascal notation
my_result


myResult = 200 #assignment
myResult <-300 #assignment
500 -> myResult
myResult
print(myResult)

#여러개의 값을 출력하려면 cat()
cat("결과값은: ",myResult)

# 멤버를 이용한 t변수 선언
goods.price = 3000
goods.code = "001"
goods.name = "냉장고"

#출력되는 형식을 살펴보아요
mySeq = seq(100) #1-100까지 1씩 증가하는 숫자의 집합
mySeq2 = seq(50:5)
mySeq3 = seq(5,100) # 5부터 100까지 1씩 증가하는 숫자의 집합
Seq = seq(1,100,by = 3) #1-100까지 3씩 증가
Seq
mySeq




