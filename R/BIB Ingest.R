#clear teh memories!
rm(list=ls())

#make the data frames have strings, not factors!!!
options(stringsAsFactors = FALSE)

library(dplyr)

#read in the data
biblist <- scan("MIOMAP BIB.txt", what = "", sep = "\n")

#pop the labels out
y <- strsplit(biblist,"(: ){1}")

#make them row names
names(y) <- sapply(y, '[[', 1)

#remove the old first elements
y <- lapply(y, '[', -1)

#remove erroneous first entry
y <- y[-1] 

#Reunite erroneous splits


#make a list of the columns we'll have in the df
columns <- distinct(as.data.frame(names(y)))

#make an integer vector of where each reference starts 
refstart <- which(names(y) == "Reference Type")

#add a last entry to end the loop
refstart[length(refstart)+1] <- length(y)+1

#make an empty DF to put the values in
bibdf <- data.frame()

#loop through each entry in y using the refstart index
for(i in 1:(length(refstart)-1)){
  
  #extract this entry
  e<- y[refstart[i]:(refstart[i+1]-1)]
  #bind it to the bibdf
  bibdf <- bind_rows(as.data.frame(e), bibdf)
    
}


write.csv(bibdf, file = "MIOMAP_BIB.csv")



#code down here for error checking.

RecNums <- distinct(as.data.frame(bibdf$Record.Number))

labz <- distinct(as.data.frame(bibdf$Label))

plot(order(as.numeric(RecNums[,1])))
order(as.single(RecNums[,1]))
str(RecNums)

for(j in 1:1282){
  if(!(j %in% RecNums[,1])) print(j)
}

for(j in 1:1282){
  if(!(j %in% labz[,1])) print(j)
}

bibdf[duplicated(bibdf$Label),"Label"]
