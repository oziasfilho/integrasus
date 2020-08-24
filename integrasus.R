library(httr)
library(magrittr)
library(jsonlite)
library(tidyverse)
library(lubridate)


link_sabrina<-"https://indicadores.integrasus.saude.ce.gov.br/api/analise-flexibilizacao/leitos-ocupados-uti?idMunicipio=&idMacrorregiao=&idRegiaoSaude="
teste<-GET(link_sabrina)
teste$
  content(teste,"raw")
dados<-fromJSON(content(teste, "text"))
glimpse(dados)

dados$data<-as.Date(dados$data)
media_mes<-dados %>% group_by(month(data,label = TRUE,abbr = FALSE)) %>% summarise(media_leitos=mean(leitosOcupados))
media_mes$media_leitos<-round(media_mes$media_leitos,2)
mean(dados$leitosOcupados)

write.table(dados, file = "Dados_Sabrina.csv",row.names=FALSE, na="", sep=";")
