library(ggplot2);
library(gridExtra);
library(tcltk);

options <- commandArgs(trailingOnly = TRUE);
path <- tk_choose.dir(default = getwd(), caption = "Select data directory")
if(interactive()) {
  dir.path <- path;
} else {
  dir.path <- options[1];
}

files <- list.files(path=dir.path, pattern=".csv", all.files=F, full.names=T);

time.breaks<-c(1, 3.16, 10, 31.62, 100, 316.22, 1000, 3162.28, 10000, 31622.7, 100000);
time.labels<-c("1ms", "3.16ms", "10ms", "31.62ms", "100ms", "316.22ms", "1s", "3.1s", "10s", "31.62s", "100s");

size.breaks<-c(10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000);
size.labels<-c("10B", "100B", "1kB", "10kB", "100kB", "1MB", "10MB", "100MB", "1GB");

threadCount.breaks<-c(1, 5, 10, 20, 40, 80, 160);
threadCount.labels<-c("1", "5", "10", "20", "40", "80", "160");

yaxis.rates.breaks <- c(0.00001, 0.0001, 0.001, 0.01, 0.1)
yaxis.rates.labels <- c("10ns/B", "100ns/B", "1us/B", "10us/B", "100us/B")

data.defined <- FALSE;

#Get the different thread counts;
count <- 0;
for (file in files) {
  file.parts<-strsplit(file, "-");
  thread.count<-sub('threads.csv', '', file.parts[[1]][5]);
  if (count == 0) {
    thread.counts <- c(thread.count) ;
  } else {
    thread.counts <- c(thread.counts, thread.count) ;
  }  
  count <- count + 1;
}
thread.counts <- unique(thread.counts);
thread.counts <- as.numeric(thread.counts);
print(thread.counts)

#get the files for each thread count
count <- 0
for (thread.count in thread.counts) {
  thread.files <- list.files(path=dir.path, pattern=sprintf("%sthreads.csv",thread.count), all.files=F, full.names=T);
  for (file in thread.files) {
    print (file);
    print (thread.count);
    add.create<-FALSE;

    # Pull out parts from the file name
    file.parts<-strsplit(file, "-");
    label<-file.parts[[1]][2];
    mean<-as.numeric(sub('mean', '', file.parts[[1]][3]));
    stddev<-sub('stddev', '', file.parts[[1]][4]);
    title <- tail(strsplit(file, "/")[[1]], 1);
    bin.width<-as.numeric(stddev) * 6/50;

    # Read in the csv file
    data <- read.csv(file);

    #Converting old style jmx label to the new style
    data[['label']] <- sub("Fedora Read Binary Resource Request", "Read Binary Resource", data[['label']]);
    data[['label']] <- sub("Fedora Create Binary Resource Request", "Create Binary Resource", data[['label']]);

    #data[['operation']] <- data[['label']]

    # Adding the thread count as a column to the data
    threadCount <- c('threadCount', rep(thread.count, nrow(data)-1));
    data$threadCount <- threadCount;

    # Adding the file size as a column to the data
    fileSize <- c('fileSize', rep(mean, nrow(data)-1));
    data$fileSize <- fileSize;

    #Cleaning threadname column
    data[['threadName']] <- sub("Threadgroup 1-", "", data[['threadName']]);
  
    count <- count + 1;
    if (count == 1) {
      data.all <- rbind(data);
    } else {
      data.all <- rbind(data.all, data);
    }

    # Set bytes and elapsed as numeric so log scales in plotting wouldn't fail over
    data$bytes <- as.numeric(data$bytes);
    data$elapsed <- as.numeric(data$elapsed);
  
    # Filter data - interested in read and create binary resource
    binReadData <- data[data[,'label'] == "Read Binary Resource",];
    binCreateData <- data[data[,'label'] == "Create Binary Resource",];

    # Modify the lable for binary data to include thread count
    binReadData[['label']] <- sprintf("%s - %s threads", binReadData[['label']], thread.count );
    binCreateData[['label']] <- sprintf("%s - %s threads", binCreateData[['label']], thread.count );

    # Match read bytes sizes to create, rather than use the response size in create
    if ( length(binReadData[['bytes']]) == length(binCreateData[['bytes']]) ) {
      binCreateData[['bytes']] <- binReadData[['bytes']];
      add.create<-TRUE;
    }

    # Bind the create data, so we can plot them
    if (length(binCreateData) > 0 & add.create == TRUE) {
      if (data.defined == TRUE) { 
        data.bin<-rbind(data.bin,binCreateData);
      } else {
        data.bin<-rbind(binCreateData);
        data.defined <- TRUE;
      }
    }

    # Bind the read data, so we can plot them
    if (length(binReadData) > 0 ) {
      if (data.defined == TRUE) { 
        data.bin<-rbind(data.bin,binReadData);
      } else {
        data.bin<-rbind(binReadData);
        data.defined <- TRUE;
      }	
    }

  }
}

# Creating a bar chart of response codes
#data.all2 <- transform(data.all, 
#    fileSize = factor(fileSize, levels=c(1, 1024, 8192, 104858, 1048576), 
#        labels=c("1B", "~ 1kB", "~8kB", "~1MB", "~10MB")))

data.all$fileSize <- as.numeric(data.all$fileSize);
data.all$threadCount <- as.numeric(data.all$threadCount);

p <- ggplot(data=data.all, aes(x=label, count, fill=responseCode)) + geom_bar() + facet_grid(threadCount ~ fileSize);
p + opts(title = "Status of request response, arranged by file size and number of concurrent calls (thread count)", axis.text.x=theme_text(angle=-90), x=);
ggsave( filename="StatusOfResponse-1.png", scale=2);

p <- ggplot(data=data.all, aes(x=label, fill=responseCode)) + geom_bar() + facet_grid(threadCount ~ fileSize, scales="free_y");
p + opts(title = "Status of request response, arranged by file size and number of concurrent calls (thread count)", axis.text.x=theme_text(angle=-90));
ggsave( filename="StatusOfResponse-2.png", scale=2);

data.all2 <- transform(data.all, label = factor(label, levels=c("Delete Object", "Create Object", "Get Object", "Create Binary Resource", "Modify Binary Resource", "Read Binary Resource"), labels=c("Delete object", "Create object", "Get object", "Create data", "Modify data", "Get data")))

p <- ggplot(data=data.all2, aes(x=factor(as.character(fileSize), levels=c(1, 1024, 8192, 104858, 1048576), labels=c("1B", "~ 1kB", "~8kB", "~1MB", "~10MB")), fill=responseCode)) + geom_bar() + facet_grid(label ~ threadCount, scales="free_y");
p + opts(title = "Status of request response, arranged by file size and number of concurrent calls (thread count)", axis.text.x=theme_text(angle=-90)) +
labs(x="Mean file size (B)", y="Count");
ggsave( filename="StatusOfResponse-3.png", scale=2);

# Creating a box plot of Number of concurrent calls by Jmeter (thread count) vs time taken for each response
p <- ggplot(data=data.all, aes(factor(as.character(data.all$threadCount)), data.all$elapsed, fill=data.all$label)) + geom_boxplot() + 
scale_y_log10(breaks=time.breaks, labels=time.labels, name="Elapsed time (ms)") +
xlim("1", "5", "10", "20", "40", "80", "160") + xlab("Threads") + geom_smooth(aes(group = threadCount))

p + labs(x="Number of concurrent calls by Jmeter - thread count", y="Elapsed time (ms)") + 
opts(title = "Number of concurrent calls by Jmeter (thread count) vs Time taken for each response", legend.position ="right");
ggsave( filename="ThreadCountVsResponseTime.png", scale=2);

# Write the summary data
out<-capture.output(summary(data.bin))
cat(out,file="summary-combined.txt",sep="\n",append=TRUE)

