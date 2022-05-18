## Run analysis, write model results

## Before: www.stockassessment.org current assessment, SURBAR input data
## After: RData (model, residuals, model, leaveout, retros, forecast, forecast_options, s.results0, s.results1), 

rm(list=ls())

library(icesTAF)
library(stockassessment)
library(minpack.lm)
library(FLCore)
setwd("C:/MY_FILES/STOCK_ASSESSMENT/WHITING_2022/TAF_2022_whg.27.47d_assessment-master_6plusgroup_v2_F25") # Changed the directory
#devtools::install_github("shfischer/FLfse/FLfse")
#devtools::install_github("DTUAqua/spict")
#devtools::install('N:/STOCK_ASSESSMENT/TAF_2019_whg.27.47d_assessment-master/bootstrap/initial/software/FLfse_0.0.0.9002/FLfse') # Added this to get stockassessment
#devtools::install('N:/STOCK_ASSESSMENT/TAF_2019_whg.27.47d_assessment-master/bootstrap/library/FLfse')

##  1 SURBAR

load("data/data.Rdata")
source("utilities_model.R")

#Define paths and load functions
data.path<-"bootstrap\\data\\"


startage<-1
  
  plus.gp <- 6
  mean.f.range <- c(2,4)
  mean.z.range <- c(2,4) # Survey data only used up to age 5
  
  #Read in data for NS whiting
  
  now <- datayear  #last historic year data
  f.temp <- read.assessment.data(wk.data.path = data.path, wk.mean.f.range = mean.f.range,
                                 wk.plus.gp = plus.gp, areas="all")
  
  s.stock <- f.temp$s.stock
  s.index <- f.temp$s.index
  f.stock <- f.temp$f.stock
  f.stock <- trim(f.stock, age = 0:f.stock@range["max"], year = 1978:now)  #new
  f.stock <- setPlusGroup(f.stock, plus.gp)                 
  
 
  

  # Set up and produce SURBAR run
  s.results <- surbar.wrapper(wk.stock = s.stock, wk.index = s.index,
                              wk.lambda = 5.0, wk.refage = 3, wk.zrange = mean.z.range, startyear=1983, startage=startage)  # adapt source code to age 0
  
  save(s.results, file=paste0("model\\surbar_results",startage,".Rdata"))
  save(s.index, file=paste0("model\\surbar_index",startage,".Rdata"))
  
 startage<-0 
  s.index[[1]] <- f.temp$s.index[[2]] # produce age 0 correlation overwrite Q1

  s.results <- surbar.wrapper(wk.stock = s.stock, wk.index = s.index,
                              wk.lambda = 5.0, wk.refage = 3, wk.zrange = mean.z.range, startyear=1983, startage=startage)  # adapt source code to age 0
  
  save(s.results, file=paste0("model\\surbar_results",startage,".Rdata"))
  

# by area

cc<-c("north", "south")

for (ii in 1:2) {
  
  a<-cc[ii]
  plus.gp <- 6
  mean.f.range <- c(2,4)
  mean.z.range <- c(2,4) # Survey data only used up to age 5
  ref.points <- data.frame(Blim = NA, Bpa = NA, Flim = NA, Fpa = NA, Fmsy = NA)
  
  #Read in data for NS whiting
  
  now <- datayear  #last historic year data
  f.temp <- read.assessment.data(wk.data.path = data.path, wk.mean.f.range = mean.f.range,
                                 wk.plus.gp = plus.gp, areas=a)
  s.stock <- f.temp$s.stock
  s.index <- f.temp$s.index
  x.index <- f.temp$f.index
  # Set up and produce SURBAR run
  s.results <- surbar.wrapper(wk.stock = s.stock, wk.index = s.index,
                              wk.lambda = 5.0, wk.refage = 3, wk.zrange = mean.z.range, startyear=1983,startage=1)
  
  save(s.results, file=paste("model\\surbar_results_",a,".Rdata", sep=""))
  
}


## 2.  download SAM results from stockassessment.org

stockname<-as.character(substitute(NSwhiting_2022_wQ1_6plusgroup_v2_F25))  # change to current run!

options(download.file.method = "wininet", timeout=500)

load(url(sub("SN",stockname , "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/SN/run/forecast.RData")))
load(url(sub("SN",stockname , "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/SN/run/model.RData")))
load(url(sub("SN",stockname , "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/SN/run/data.RData")))
load(url(sub("SN",stockname , "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/SN/run/leaveout.RData")))
load(url(sub("SN",stockname , "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/SN/run/residuals.RData")))
load(url(sub("SN",stockname , "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/SN/run/retro.RData")))

save(fit, file="model/model.RData")
save(dat, file="model/data.RData")
save(LO, file="model/leaveoneout.RData")
save(RES, file="model/residuals.RData")
save(RESP, file="model/retro.RData")
save(FC, file="model/FC.RData")

save.image( file="model/allmodel.RData")


# FC<-NULL
# load(url(sub("SN",stockname , "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/SN/run/forecast_options.RData")))
# save(FC, file="model/FC_options.RData")


# create output for MIXFISH
stk<-FLfse::SAM2FLStock(fit)

stk@desc<-"FLStock created from SAM model fit, catches include IBC"

save(stk, file="model\\stk.Rdata")
