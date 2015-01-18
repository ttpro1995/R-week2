#Thai Thien

corr <- function(directory, threshold = 0){
  
  
 
  id =1:332
#find valid id
cm<-complete(directory,id)
cm<-subset(cm,nobs>threshold)#id with nobs more that threshold
cm
id<-as.vector(cm[["id"]])
id
#cor
corr_vector<-NULL#init corr_vector
for (i in id)
{
  table<-singleID(i,directory)
  tmp<-cor(table$sulfate,table$nitrate,use="complete.obs")
  corr_vector<-cbind(corr_vector,tmp)
}
  ret<-as.vector(corr_vector)
ret

}


singleID <- function(num,directory) {
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