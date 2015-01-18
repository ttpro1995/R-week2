#Thai Thien

complete<- function(directory, id = 1:332)
{
  ##working on this
  #http://stackoverflow.com/questions/23190280/issue-in-loading-multiple-csv-files-into-single-dataframe-in-r-using-rbind
  
  table <-NULL
  ret<-NULL
  
  for (i in id)
  {
    table<-pollutantmeansteptwo(i,directory)
    NNod<-cases(table)
    IId<-i
    dataline<-cbind(IId,NNod)
    ret<-rbind(ret,dataline)
  }
 ret<-as.data.frame(ret)
  names(ret)[names(ret)=="IId"] <- "id"
  names(ret)[names(ret)=="NNod"] <- "nobs"
 ret#return 
}

cases<-function(table)#num of case for id
{
  sul<-as.vector(table[["sulfate"]])
  nit<-as.vector(table[["nitrate"]])
  count<-0;
  for (i in seq_along(sul))
  {
    if (is.na(sul[i])==FALSE & is.na(nit[i])==FALSE)
    count<-count+1
      
    
      
  }
  count#number of complete case
  
}

pollutantmeansteptwo <- function(num,directory) {
  f<-paste(directory,"/",sep="")
  
  name<- as.character(num)
  if (num<10)
    name<-paste("00",name,sep="")
  
  if (num>=10&num<=99)
    name<-paste("0",name,sep="")
  
  name<-paste(name,".csv",sep="")
  name<-paste(f,name,sep="")
  
  name##name of csv file
  
  data<-read.csv(name)
  data## a data frame
  
  
  
  
  
  
}
