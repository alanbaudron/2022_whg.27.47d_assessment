library(DATRAS)

d <- readExchange("bootstrap/initial/data/Exchange.zip", strict=FALSE)  #new

#keep whiting
# Species specific parameters
genus = "Merlangius"
bfamily = "merlangus"

# Q1 whiting data (in areas 1-7), valid hauls
whiting <- subset(d, Species==paste(genus,bfamily), Quarter==1  , HaulVal=="V")
save(whiting,file="bootstrap/initial/data/exchange.Rdata")
