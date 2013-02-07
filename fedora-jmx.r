library(ggplot2);
library(gridExtra);

files <- list.files(path="../modeshape/log", pattern=".csv", all.files=F, full.names=T);

yaxis.breaks<-c(1, 3.16, 10, 31.62, 100, 316.22, 1000, 3162.28, 10000);
yaxis.labels<-c("1ms", "3.16ms", "10ms", "31.62ms", "100ms", "316.22ms", "1s", "3.1s", "10s");
xaxis.breaks<-c(1000, 10000, 100000, 1000000, 10000000, 100000000);
xaxis.labels<-c("1kB", "10kB", "100kB", "1MB", "10MB", "100MB");

data.defined <- FALSE;

#Get the different thread counts;
thread.counts<-rep(NA, length(files));
count <- 0;
for (file in files) {
  file.parts<-strsplit(file, "-");
  thread.count<-sub('threads.csv', '', file.parts[[1]][5]);
  thread.counts[count]<-thread.count;
  count <- count + 1;
}
thread.counts <- thread.counts[-(which(sapply(thread.counts,is.na),arr.ind=TRUE))];
thread.counts <- unique(thread.counts);

#get the files for each thread count
for (thread.count in thread.counts) {
  thread.files <- list.files(path="../modeshape/log", pattern=sprintf("%sthreads.csv",thread.count), all.files=F, full.names=T);
  datat.defined <- FALSE;
  for (file in thread.files) {
    #print(file);
    #Pull out labels from the file name
    file.parts<-strsplit(file, "-");
    label<-file.parts[[1]][2];
    mean<-sub('mean', '', file.parts[[1]][3]);
    stddev<-sub('stddev', '', file.parts[[1]][4]);
    data <- read.csv(file);
    title <- tail(strsplit(file, "/")[[1]], 1);
    bin.width<-as.numeric(stddev) * 6/50;
  
    # Modify the lable to include thread count
    data[['label']] <- sprintf("%s - %sthread", data[['label']], thread.count );
  
    #Filter data - interested in read and create binary resource
    binReadData <- data[data[,'label'] == sprintf("Read Binary Resource - %sthread",thread.count),];
    binCreateData <- data[data[,'label'] == sprintf("Create Binary Resource - %sthread",thread.count),];
    if ( length(binReadData[['bytes']]) == length(binCreateData[['bytes']]) ) {
      binCreateData[['bytes']] <- binReadData[['bytes']];
    }
   
    #Bind the data, so we can plot them
    if (length(binReadData) > 0 & length(binCreateData) > 0 ) {
      if (data.defined == TRUE) { 
        data.all<-rbind(data.all,binReadData,binCreateData);
      } else {
        data.all<-rbind(binReadData,binCreateData);
        data.defined <- TRUE;
      }
      if (datat.defined == TRUE) { 
        data.thread<-rbind(data.thread,binReadData,binCreateData);
      } else {
        data.thread<-rbind(binReadData,binCreateData);
        datat.defined <- TRUE;
      }
    }
  }
  
  # Creating a plot of file size v/s elapsed time - grouped by label - thread count
  df <- data.frame(data.thread$bytes, data.thread$elapsed, data.thread$label);
  
  p <- ggplot(data=df, aes(x=data.thread$bytes,y=data.thread$elapsed,color=data.thread$label)) + 
    scale_colour_discrete(name = "Legend") + geom_point( aes( x=data.thread$bytes, y=data.thread$elapsed) ) + 
    scale_y_log10(breaks=yaxis.breaks, labels=yaxis.labels, name="Elapsed time (ms)") + 
    scale_x_log10(breaks=xaxis.breaks, labels=xaxis.labels, name="File size (bytes)") + 
    geom_smooth(aes(group=data.thread$label));
  
  p + opts(title=sprintf("%s - File size vs Elapsed time - %s threads", label, thread.count), legend.position ="bottom") + 
    labs(x="File size (Bytes)", y="Elapsed time (ms)");
  
  ggsave( filename=sprintf("FileSize-ElapsedTime-%sthreads.png", thread.count));
  #Sys.sleep(2);

  
  #Creating a plot of file size vs rate of transfer - thread count
  
  ratetimeperbyte <- data.thread$elapsed/data.thread$bytes;
  df <- data.frame(data.thread$bytes, ratetimeperbyte, data.thread$label);
  
  p <- ggplot(data=df, aes(x=data.thread$bytes,y=ratetimeperbyte,color=data.thread$label)) + 
    scale_colour_discrete(name = "Legend") + geom_point( aes( x=data.thread$bytes, y=ratetimeperbyte) ) + 
    scale_y_log10(breaks=yaxis.breaks, labels=yaxis.labels, name="Time taken to trasfer each byte") + 
    scale_x_log10(breaks=xaxis.breaks, labels=xaxis.labels, name="File size (bytes)") + 
    geom_smooth(aes(group=data.thread$label));
  
  p + opts(title=sprintf("%s - File size vs Time taken to transfer each byte - %s threads", label, thread.count), 
    legend.position = "bottom");
  
  ggsave(filename=sprintf("RateOfTransfer-TimePerByte-ElapsedTime-%sthreads.png", thread.count));
  #Sys.sleep(2);

  
  #Creating a plot of File size vs Number of bytes transferred in 1 ms - thread count
  
  ratebytepertime <- data.thread$bytes/data.thread$elapsed;
  df2 <- data.frame(data.thread$bytes, ratebytepertime, data.thread$label);
  
  p <- ggplot(data=df2, aes(x=data.thread$bytes,y=ratebytepertime,color=data.thread$label)) + 
    scale_colour_discrete(name = "Legend") + geom_point( aes( x=data.thread$bytes, y=ratebytepertime) ) + 
    scale_y_log10(breaks=yaxis.breaks, labels=yaxis.labels, name="Number of bytes transferred in 1 ms") + 
    scale_x_log10(breaks=xaxis.breaks, labels=xaxis.labels, name="File size (bytes)") +
    geom_smooth(aes(group=data.thread$label));
  
  p + opts(title=sprintf("%s - File size vs Number of bytes transferred in 1 ms - %s threads", label, thread.count), 
    legend.position="bottom");
  
  ggsave(filename=sprintf("RateOfTransfer-BitePerTime-ElapsedTime-%sthreads.png", thread.count));
  #Sys.sleep(2);

  out<-capture.output(summary(data.thread))
  cat(out,file=sprintf("summary-%sthreads.txt",thread.count),sep="\n",append=TRUE)
}



# Creating a plot of file size v/s elapsed time grouped by label  (all thread counts)
df <- data.frame(data.all$bytes, data.all$elapsed, data.all$label);

p <- ggplot(data=df, aes(x=data.all$bytes,y=data.all$elapsed,color=data.all$label)) + 
  scale_colour_discrete(name = "Legend") + geom_point( aes( x=data.all$bytes, y=data.all$elapsed) ) + 
  scale_y_log10(breaks=yaxis.breaks, labels=yaxis.labels, name="Elapsed time (ms)") + 
  scale_x_log10(breaks=xaxis.breaks, labels=xaxis.labels, name="File size (bytes)") + 
  geom_smooth(aes(group=data.all$label));

p + opts(title=sprintf("%s - File size vs Elapsed time",label), legend.position ="bottom") + 
  labs(x="File size (Bytes)", y="Elapsed time (ms)");

ggsave( filename="FileSize-ElapsedTime-combined.png" );
#Sys.sleep(2);


#Creating a plot of file size vs rate of transfer (all thread counts)

ratetimeperbyte <- data.all$elapsed/data.all$bytes;
df <- data.frame(data.all$bytes, ratetimeperbyte, data.all$label);

p <- ggplot(data=df, aes(x=data.all$bytes,y=ratetimeperbyte,color=data.all$label)) + 
  scale_colour_discrete(name = "Legend") + geom_point( aes( x=data.all$bytes, y=ratetimeperbyte) ) +  
  scale_y_log10(breaks=yaxis.breaks, labels=yaxis.labels, name="Time taken to trasfer each byte") +  
  scale_x_log10(breaks=xaxis.breaks, labels=xaxis.labels, name="File size (bytes)") + 
  geom_smooth(aes(group=data.all$label));

p + opts(title=sprintf("%s - File size vs Time taken to transfer each byte", label), legend.position = "bottom");

ggsave( filename="RateOfTransfer-TimePerByte-ElapsedTime-combined.png");
#Sys.sleep(2);


#Creating a plot of  File size vs Number of bytes transferred in 1 ms (all thread counts)

ratebytepertime <- data.all$bytes/data.all$elapsed;
df2 <- data.frame(data.all$bytes, ratebytepertime, data.all$label);

p <- ggplot(data=df2, aes(x=data.all$bytes,y=ratebytepertime,color=data.all$label)) + 
  scale_colour_discrete(name = "Legend") + geom_point( aes( x=data.all$bytes, y=ratebytepertime) ) + 
  geom_smooth(aes(group=data.all$label)) + 
  scale_y_log10(breaks=yaxis.breaks, labels=yaxis.labels, name="Number of bytes transferred in 1 ms") + 
  scale_x_log10(breaks=xaxis.breaks, labels=xaxis.labels, name="File size (bytes)");

p + opts(title=sprintf("%s - File size vs Number of bytes transferred in 1 ms", label), legend.position = "bottom");

ggsave( filename="RateOfTransfer-BitePerTime-ElapsedTime-combined.png");

out<-capture.output(summary(data.all))
cat(out,file="summary-combined.txt",sep="\n",append=TRUE)

