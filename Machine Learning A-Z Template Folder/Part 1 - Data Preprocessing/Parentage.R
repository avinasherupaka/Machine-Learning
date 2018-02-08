Sys.unsetenv('GITHUB_PAT')
b<-function(){
  install.packages('devtools')
  library(devtools)
}

tryCatch(library(devtools),error=function(e) b())
library(httr)
set_config(config(ssl_verifypeer = 0L))


a<-function(){
  install.packages('dplyr')
  library(dplyr)
}
tryCatch(library(dplyr),error=function(e) a())

ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
tidyjsonversion <- ip %>% select(Package,Version) %>% filter(Package=='tidyjson')
synonymsversion <- ip %>% select(Package,Version) %>% filter(Package=='synonyms')
trialsversion <- ip %>% select(Package,Version) %>% filter(Package=='trials')
devtoolsversion <- ip %>% select(Package,Version) %>% filter(Package=='devtools')

if(as.character(devtoolsversion$Version)!='1.12.0.9000'){
  devtools::install_github("hadley/devtools")
}

if(as.character(tidyjsonversion$Version)!='0.2.1.9000' 
   || !("tidyjson" %in% rownames(installed.packages()))){
  devtools::install_github("jeremystan/tidyjson")
}

#******************
source("/Users/aerup/Documents/P360_R_Credentials.txt")
#******************

if(!("authenticator" %in% rownames(installed.packages()))){
  devtools::install_github(repo = "GraphRoots/authenticator", 
                           host = "https://github.platforms.engineering/api/v3")
}

if(as.character(trialsversion$Version)!='0.1.0000' || !("trials" %in% rownames(installed.packages()))){
  h<-function(){
    devtools::install_github(repo = "GraphRoots/product-trials-client-R",ref='v0.1.0',
                             host = "https://github.platforms.engineering/api/v3")
  }
  tryCatch(devtools::install_github(repo = "GraphRoots/product-trials-client-R",host = "https://github.platforms.engineering/api/v3"),
           error=function(e) h())
  
}
if(!("tidyr" %in% rownames(installed.packages()))){
  install.packages('tidyr')
}
if(!("jsonlite" %in% rownames(installed.packages()))){
  install.packages('jsonlite')
}

if(as.character(synonymsversion$Version)!='0.1.2' 
   || !("synonyms" %in% rownames(installed.packages()))){
  devtools::install_github(repo = 'Product360-Data/R-Product-Synonyms-Client', 
                           host = "https://github.platforms.engineering/api/v3")
}
devtools::install_github(repo = "GraphRoots/inceptionR", 
                         ref='0.8.0',host = "https://github.platforms.engineering/api/v3")