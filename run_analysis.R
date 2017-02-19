# PRoject getting and cleansing data. Data = samsung accelerometer

features<-read.csv("./UCI HAR Dataset/features.txt", header = F,sep="")

X_test<-read.csv("./UCI HAR Dataset/test/X_test.txt", sep="", header = F) 
names(X_test)<-features[,2]
Y_test<-read.csv("./UCI HAR Dataset/test/Y_test.txt", sep="", header = F)
subject_test<-read.csv("./UCI HAR Dataset/test/subject_test.txt", sep="", header = F)

X_train<-read.csv("./UCI HAR Dataset/train/X_train.txt", sep="", header = F) 
names(X_train)<-features[,2]
Y_train<-read.csv("./UCI HAR Dataset/train/Y_train.txt", sep="", header = F)
subject_train<-read.csv("./UCI HAR Dataset/train/subject_train.txt", sep="", header = F)


#1. Merges the training and the test sets to create one data set
X<- rbind(X_test,X_train)
Y<- rbind(Y_test,Y_train)
subject<-rbind(subject_test,subject_train)
names(Y)<-"activity"
names(subject)<-"subject"

#2. Extract only the measurments on the mean and standard devisation
Z<-X
Zms<-Z[,grep("[Mm]ean|[Ss]td",names(Z))]

#(add the column inherent to the activity)
Zms$activity<-Y[,1]
#(add the column inherent to the subject)
Zms$subject<-subject[,1]
#4. Labels the data set with descriptive variable names
activity_labels<-read.csv("./UCI HAR Dataset/activity_labels.txt", header = F,sep="")

Zms$activity<-sub("1",activity_labels[1,"V2"],Zms$activity)
Zms$activity<-sub("2",activity_labels[2,"V2"],Zms$activity)
Zms$activity<-sub("3",activity_labels[3,"V2"],Zms$activity)
Zms$activity<-sub("4",activity_labels[4,"V2"],Zms$activity)
Zms$activity<-sub("5",activity_labels[5,"V2"],Zms$activity)
Zms$activity<-sub("6",activity_labels[6,"V2"],Zms$activity)

#5. Independent tidy data with the average of each variable for each activity and for each subject
ZmsMean<-aggregate(Zms[-87],list(factor(Zms$activity),factor(Zms$subject)),mean)

