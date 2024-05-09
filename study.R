g1e <- read.table("nsc2_edu_g1e.txt", header=TRUE, fill=TRUE, sep="|", fileEncoding = "CP949", encoding = "UTF-8")
bnc <- read.table("nsc2_edu_bnc.txt", header=TRUE, fill=TRUE, sep="|", fileEncoding = "CP949", encoding = "UTF-8")

install.packages("ggplot2")
library(gmodels)
library(ggplot2)
library(dplyr)
data <- merge(bnc,g1e, by="RN_INDI")
View(data)

## 성별과 신장 ##
data <- data[c("SEX", "G1E_HGHT")]
data <- na.omit(data)
data$SEX1 <- factor(data$SEX, levels=c(1,2), labels=c("남","여"))
ggplot(data, aes(G1E_HGHT)) + geom_bar(aes(fill=SEX1), colour="black")
## 성별과 체중 ##
data <- data[c("SEX", "G1E_WGHT")]
data <- na.omit(data)
data$SEX1 <- factor(data$SEX, levels=c(1,2), labels=c("남","여"))
ggplot(data, aes(G1E_WGHT)) + geom_bar(aes(fill=SEX1), colour="black")
## 성별과 체질량지수 ##
data <- data[c("SEX", "G1E_BMI")]
data <- na.omit(data)
data$SEX1 <- factor(data$SEX, levels=c(1,2), labels=c("남","여"))
ggplot(data, aes(G1E_BMI)) + geom_bar(aes(fill=SEX1), colour="black")
## 성별과 허리둘레 ##
data <- data[c("SEX", "G1E_WSTC")]
data <- na.omit(data)
data$SEX1 <- factor(data$SEX, levels=c(1,2), labels=c("남","여"))
ggplot(data, aes(G1E_WSTC)) + geom_bar(aes(fill=SEX1), colour="black")

## 가설1. 성별에 따라 흡연상태에 차이가 없을 것이다. ##
data <- data[c("SEX", 'Q_SMK_YN')]
data <- na.omit(data)
data$SEX <- factor(data$SEX, levels=c(1,2), labels=c("남","여"))
data$Q_SMK_YN <- factor(data$Q_SMK_YN, levels=c("1","2","3"), labels=c("1: 피우지 않는다","2: 과거에 피웠으나 지금은 끊었다","3: 현재도 피운다"))
table(data$SEX, data$Q_SMK_YN)
chisq.test(data$SEX, data$Q_SMK_YN)

ggplot(data, aes(x=data$SEX, fill=data$Q_SMK_YN)) + geom_bar()

## 가설2. 성별에 따라 음주습관에 차이가 없을 것이다. ##
data <- data[c("SEX", "Q_DRK_FRQ_V09N")]
data <- na.omit(data)
data$SEX <- factor(data$SEX, levels=c(1,2), labels=c("남","여"))
data$DRK <- factor(data$Q_DRK_FRQ_V09N, levels=c(0,1,2,3,4,5,6,7), labels=c("0일","1일","2일","3일","4일","5일","6일","7일"))
table(data$SEX,data$DRK)
chisq.test(data$SEX, data$DRK)

ggplot(data, aes(x=data$SEX, fill=data$DRK)) + geom_bar()

## 가설3. 흡연 상태에 따른 질환 유무의 차이가 없을 것이다
data <- data[c("Q_SMK_YN", "Q_AWR_YN")]
data <- na.omit(data)
data$Q_SMK_YN <- factor(data$Q_SMK_YN, levels=c("1","2","3"), labels=c("1: 피우지 않는다","2: 과거에 피웠으나 지금은 끊었다","3: 현재도 피운다"))
data$Q_AWR_YN <- factor(data$Q_AWR_YN, levels=c(1,2), labels = c("없음", "있음"))
table(data$Q_SMK_YN, data$Q_AWR_YN)
ggplot(data, aes(x=data$Q_AWR_YN, fill=data$Q_SMK_YN)) + geom_bar()

chisq.test(data$Q_SMK_YN, data$Q_AWR_YN)
