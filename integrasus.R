library(httr)
library(magrittr)
library(jsonlite)
library(tidyverse)
library(lubridate)

#### Link de Leitos Ocupados - UTI
link_leitos_ocupados_uti<-"https://indicadores.integrasus.saude.ce.gov.br/api/analise-flexibilizacao/leitos-ocupados-uti?idMunicipio=&idMacrorregiao=&idRegiaoSaude="
link_dados<-GET(link_leitos_ocupados_uti)
#### Organizando os dados
dados<-fromJSON(content(link_dados, "text"))
glimpse(dados)
dados$data<-as.Date(dados$data)
##### Média de Leitos Ocupados por mês
media_mes<-dados %>% group_by(month(data,label = TRUE,abbr = FALSE)) %>% summarise(media_leitos=mean(leitosOcupados))
media_mes$media_leitos<-round(media_mes$media_leitos,2)

##### Média de Leitos Ocupados Geral
mean(dados$leitosOcupados)
