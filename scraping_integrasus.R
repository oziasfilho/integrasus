library(httr)
library(httr)
library(magrittr)
library(jsonlite)
link<-"https://indicadores.integrasus.saude.ce.gov.br/api/historico-internacoes-covid/ocupacao-upa-detalhes-dia?data=2020-08-14&unidade=&municipio=&idRegiaoSaude=&idMacrorregiao=&tipoUnidade="
link_for<-"https://indicadores.integrasus.saude.ce.gov.br/api/historico-internacoes-covid/ocupacao-upa-detalhes-dia?data=2020-08-14&unidade=&municipio=&idRegiaoSaude=&idMacrorregiao=&tipoUnidade="


fort<-GET(link_for)
fort
teste<-GET(link)
teste$
content(teste,"raw")
dados<-fromJSON(content(teste, "text"))

dados_for<-fromJSON(content(fort,"text"))
library(tidyverse)
dados_filtrado<-dados %>% select(data,leitosUpa)
