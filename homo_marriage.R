
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("reshape2")
install.packages("svglite")


library(ggplot2)
library(ggthemes)
library(reshape2)
library(svglite)

setwd("~/Dropbox/talkecon/social_change/csv") 
#請設為自己電腦的路徑
#--------------------------------------------------------------------------

# graph 3
graph_3 <- read.csv("~/Dropbox/talkecon/social_change/csv/new_graph_3.csv")
graph_3 <- as.data.frame.matrix(graph_3) 

colnames(graph_3) <- c("調查年","出生世代","贊成程度")
#graph_3$出生世代 <- as.factor(graph_3$出生世代)
graph_3$調查年 <- as.factor(graph_3$調查年)


pic_3 <- ggplot(graph_3,aes(x = 出生世代, y = 贊成程度, col = 調查年)) +
  geom_line(size=1.5)+
# geom_point(size = 3) + theme_grey(base_family = "Heiti TC Light")+
theme_wsj(base_size = 12, base_family = "Source Han Sans Normal", 
          title_family = "Source Han Sans") + #控制基本字體大小與字型
  scale_colour_wsj("colors6") +#作用不確定，好像也沒有別的選項
  theme(text = element_text(size=12), #控制基本字體大小
        legend.title = element_text(size=13, face = "bold"), #控制圖例標題字體大小
  ) 
pic_3
ggsave("~/Dropbox/talkecon/social_change/graph/new_graph3.jpg", width=8, height=4.5)
ggsave("~/Dropbox/talkecon/social_change/graph/new_graph3.svg", width=8, height=4.5)

# graph 4-1
graph_4 <- read.csv("~/Dropbox/talkecon/social_change/csv/new_graph_4.csv")
graph_4 <- as.data.frame.matrix(graph_4) 

colnames(graph_4) <- c("出生世代","教育程度","贊成程度","treatment")

graph_4$教育程度 <- as.character(graph_4$教育程度)
graph_4$教育程度[graph_4$教育程度 == "1"] <- "低"
graph_4$教育程度[graph_4$教育程度 == "2"] <- "高"
graph_4$教育程度 <- as.factor(graph_4$教育程度)

graph_4["教育x世代"] <- NA
graph_4$"教育x世代"[graph_4$教育程度 == "高"&graph_4$treatment == 0] <- "高教育中年"
graph_4$"教育x世代"[graph_4$教育程度 == "高"&graph_4$treatment == 1] <- "高教育年輕"
graph_4$"教育x世代"[graph_4$教育程度 == "低"&graph_4$treatment == 0] <- "低教育中年"
graph_4$"教育x世代"[graph_4$教育程度 == "低"&graph_4$treatment == 1] <- "低教育年輕"

graph_4$treatment <- as.factor(graph_4$treatment)
graph_4$"教育x世代" <- as.factor(graph_4$"教育x世代")

pic_4_1 <- ggplot(data=subset(graph_4,treatment==0),aes(x = 出生世代, y = 贊成程度, col = 教育程度, lty=教育x世代)) +
  geom_point(size = 3) + theme_grey(base_family = "Heiti TC Light")+
  geom_smooth(method = "lm", se = FALSE,color="black",size=0.6) +
  theme_wsj(base_size = 12, base_family = "Source Han Sans Normal", 
            title_family = "Source Han Sans") + #控制基本字體大小與字型
  scale_colour_wsj("colors6") +#作用不確定，好像也沒有別的選項
  theme(text = element_text(size=12), #控制基本字體大小
        legend.title = element_text(size=13, face = "bold"), #控制圖例標題字體大小
  ) 
pic_4_1
ggsave("~/Dropbox/talkecon/social_change/graph/new_graph4_1.jpg", width=8, height=4.5)
ggsave("~/Dropbox/talkecon/social_change/graph/new_graph4_1.svg", width=8, height=4.5)




# graph 4-2

pic_4_2 <- ggplot(data=subset(graph_4,treatment==1),aes(x = 出生世代, y = 贊成程度, col = 教育程度, lty=教育x世代)) +
  geom_point(size = 3) + theme_grey(base_family = "Heiti TC Light")+
  geom_smooth(method = "lm", se = FALSE,color="black",size=0.6) +
  theme_wsj(base_size = 12, base_family = "Source Han Sans Normal", 
            title_family = "Source Han Sans") + #控制基本字體大小與字型
  scale_colour_wsj("colors6") +#作用不確定，好像也沒有別的選項
  theme(text = element_text(size=12), #控制基本字體大小
        legend.title = element_text(size=13, face = "bold"), #控制圖例標題字體大小
  ) 
pic_4_2
ggsave("~/Dropbox/talkecon/social_change/graph/new_graph4_2.jpg", width=8, height=4.5)
ggsave("~/Dropbox/talkecon/social_change/graph/new_graph4_2.svg", width=8, height=4.5)



