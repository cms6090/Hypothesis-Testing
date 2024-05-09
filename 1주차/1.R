install.packages("readxl")
library(readxl)
data <- read_excel("경기 기업 소개 동영상 참여자 대상 설문조사(응답).xlsx")
View(data)

summary(data)
data1 <- data[c("3개 회사(세코닉스, 한우물, 마스)의 기업홍보 영상이 해당 기업을 이해하는데 얼마나 도움이 되셨나요?")]
View(data1)
summary(data1)
table(data1)
table(data1/101)
data2 <- data[c("홍보 영상을 보신 분의 현재 직업이 무엇인가요?")]
table(data2)
data3 <- data[c("위 3개 기업의 영상을 보고 해당 기업에 관심이 생겼다면 관심을 가지게 된 이유는 무엇인가요?")]
table(data3)
data4 <- data[c("만일 귀하가 위 3개 회사에 취업을 생각하고 계시다면 해당 영상이 구직 활동에 도움이 될까요?")]
table(data4)
data5 <- data[c("해당 메타버스의 흥미 정도가 어떠셨나요?")]
table(data5)
data6 <- data[c("해당 영상에서 가장 도움이 되었던 것은 무엇인가요?")]
table(data6)
data7 <- data[c("귀하가 특정 회사의 취업에 관심이 있을 경우 해당 회사의 동영상이 있다면 구직 활동에 얼마나 도움이 될 것이라 생각하나요?")]
table(data7)
42/101
43/101
13/101
2/101
