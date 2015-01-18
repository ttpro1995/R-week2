#Thai Thien

pollutantmean<- function(directory, pollutant, id = 1:332)
{
  ##working on this
  #http://stackoverflow.com/questions/23190280/issue-in-loading-multiple-csv-files-into-single-dataframe-in-r-using-rbind
 
  table <-NULL
  
  
  for (i in id)
  {
  table<-rbind(table,pollutantmeansteptwo(i,directory))
  }
  table
  
  vec<-as.vector(table[[pollutant]])
  meanvalue<-mean(vec,na.rm=TRUE)
  meanvalue
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

