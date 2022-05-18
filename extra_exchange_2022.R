rm(list=ls())

library(DATRAS)

# load new data
d <- readExchange("C:/MY_FILES/STOCK_ASSESSMENT/WHITING_2022/ICES_2022_whg.27.47d/DATRAS/Exchange Data_2022-04-14 13_36_45.zip", strict=FALSE)

# keep whiting
# species specific parameters
genus = "Merlangius"
bfamily = "merlangus"

# Q1 whiting data (in areas 1-7), valid hauls
whiting_new <- subset(d, Species==paste(genus,bfamily), Quarter==1  , HaulVal=="V")

# rename so that it matches old data
whiting_new[["CA"]]$NoAtLngt <- whiting_new[["CA"]]$NoAtALK

# load old data
load("C:/MY_FILES/STOCK_ASSESSMENT/WHITING_2022/ICES_2022_whg.27.47d/DATRAS/exchange_2021.Rdata")

### The new data has extra columns. To merge the old and new data we keep only the columns matching the old data

for (zz in c("HH","HL","CA")) { # zz<- "CA"

# create dataframe with new data in old format
xx <- data.frame(array(NA,dim=c(nrow(whiting_new[[zz]]),ncol(whiting[[zz]]))))
colnames(xx) <- colnames(whiting[[zz]])

# fill it with new data
for (i in 1:ncol(whiting[[zz]])) { # i<-1
  if(colnames(xx[i]) %in% colnames(whiting_new[[zz]])) {
    xx[,colnames(whiting[[zz]][i])] <- whiting_new[[zz]][,colnames(whiting[[zz]][i])]
  }
}

# add it to the old data
whiting[[zz]] <- rbind(whiting[[zz]],xx)

rm(xx,i)

}

# save data
save(whiting,file="C:/MY_FILES/STOCK_ASSESSMENT/WHITING_2022/TAF_2022_whg.27.47d_assessment-master/bootstrap/initial/data/exchange.Rdata")
