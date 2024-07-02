options("width"=200)
dados<-read.csv(file=file.choose(), header=1)


dados$Country <- as.factor(dados$Country)
dados$League <- as.factor(dados$League)
dados$Season <- as.factor(dados$Season)
dados$Res <- as.factor(dados$Res)
dados$Home <- as.factor(dados$Home)
dados$Away <- as.factor(dados$Away)

dados <- dados[3:10]

faltantes <- which(is.na(dados))
dados <- dados[-faltantes,]
sum(is.na(dados))

dados<-dados[-which(is.na(dados$AG)),]

#Total de gols por jogo
dados$TG <- dados$HG+dados$AG

#Renomeando os times
alias<-c("PAL", "SPO", "FIG", "BOT", "COR", "INT", "PON", "BAH", "CRU", "VAS", "ACG", "FLA", "POR", "NAU", "CAM", "CFC", "SAN","SAO", "FLU")
alias<-c(alias, "GRE", "VIT", "CRI", "CAP", "GOI", "CHA", "AVA", "JEC", "STA", "AME", "PAR", "CEA", "CAP", "CSA", "FOR", "BCT", "CUI", "JUV")
teams<-unique(dados$Home)
alias_map <- setNames(alias, teams)

dados$AliasHome <- alias_map[dados$Home]
dados$AliasAway <- alias_map[dados$Away]

mean(dados$TG == 0)

library(ggplot2)
ggplot(dados, aes(Home)) + geom_bar()

ggplot(dados, aes(y = TG)) + geom_boxplot()
