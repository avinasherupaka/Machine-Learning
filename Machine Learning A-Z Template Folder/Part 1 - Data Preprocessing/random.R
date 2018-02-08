source("/Users/aerup/Documents/P360_R_Credentials.txt")
library(authenticator)
library(httr)
library(dplyr)
library(synonyms)
library(tidyjson)

createPingToken()

Sys.setenv(BASE_SYN_URL='https://product360.agro.services/products/v1')
products<-list('NF6487','NF6737')



Synonyms<-ProdSynQuery(products)

parentids<-unique(as.list(Synonyms$id))
Parents<-ProdSynParentQuery(parentids)
