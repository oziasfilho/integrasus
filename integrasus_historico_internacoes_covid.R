library(httr)
library(httr)
library(magrittr)
library(jsonlite)
library(tidyverse)

##### Link do Histórico de Internações por COVID
link_historico_internacoes_covid<-"https://indicadores.integrasus.saude.ce.gov.br/api/historico-internacoes-covid/ocupacao-upa-detalhes-dia?data=2020-08-14&unidade=&municipio=&idRegiaoSaude=&idMacrorregiao=&tipoUnidade="
link_dados<-GET(link)

#### Passando os dados pra o Data.Frame
dados<-fromJSON(content(link_dados, "text"))

##### Selecionando apenas os dados de Internações nas UPAS
dados_filtrado<-dados %>% select(data,leitosUpa)
