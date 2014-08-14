read_sourcefile = function () {

# Define source file, destination zip file name and directory and the the final csv result file 

sourcefile = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destzipfile = "./sourcedata/getdata-projectfiles-UCI HAR Dataset.zip"
destDirectory = "./sourcedata/UCI HAR Dataset/"
resultcsvfile = "Tidy_data.txt"

# Read source file and unzip it

writeLines("Reading source zip file")

if (!file.exists("sourcedata")) {
      dir.create("sourcedata")
}

if (!file.exists(destzipfile)){
      download.file(sourcefile, destfile=destzipfile, mode="wb")
      
}

unzip(destzipfile, exdir="./sourcedata")

writeLines(paste("Source file unzipped in", destDirectory))


}

transform_data = function () {


# read features and activity labels

features = read.table(paste(destDirectory, "features.txt", sep=""), stringsAsFactors=FALSE)
writeLines(paste("features rows", dim(features)[1], "columns", dim(features)[2]))

activity_labels = read.table(paste(destDirectory, "activity_labels.txt", sep=""), stringsAsFactors=FALSE, col.names = c("ActivityId", "Activity"))
writeLines(paste("activities rows", dim(activity_labels)[1], "columns", dim(activity_labels)[2]))

test_set = read.table(paste(destDirectory, "test/subject_test.txt", sep=""))
writeLines(paste("test set rows", dim(test_set)[1], "columns", dim(test_set)[2]))

train_set = read.table(paste(destDirectory, "train/subject_train.txt", sep=""))
writeLines(paste("training set rows", dim(train_set)[1], "columns", dim(train_set)[2]))


tidy_set = rbind(test_set, train_set)
writeLines(paste("initial tidy set rows", dim(tidy_set)[1], "columns", dim(tidy_set)[2]))


test_activity = read.table(paste(destDirectory, "test/Y_test.txt", sep=""))
writeLines(paste("test activity rows", dim(test_activity)[1], "columns", dim(test_activity)[2]))

train_activity = read.table(paste(destDirectory, "train/Y_train.txt", sep=""))
writeLines(paste("train activity rows", dim(train_activity)[1], "columns", dim(train_activity)[2]))


subject_activity = rbind(test_activity,train_activity)
writeLines(paste("subject activity rows", dim(subject_activity)[1], "columns", dim(subject_activity)[2]))


# create final Subject, Activity columns to tidy set

colnames(tidy_set) = c("Subject")
colnames(subject_activity)=c("Activity")
subject_activity$Activity = factor(subject_activity$Activity, levels = activity_labels$ActivityId, labels=activity_labels$Activity)

tidy_set = cbind(tidy_set, subject_activity)

writeLines(paste("tidy set after combining activities rows", dim(tidy_set)[1], "columns", dim(tidy_set)[2]))


test_feature_readings = read.table(paste(destDirectory, "test/X_test.txt", sep=""))
writeLines(paste("test feature readings rows", dim(test_feature_readings)[1], "columns", dim(test_feature_readings)[2]))

train_feature_readings = read.table(paste(destDirectory, "train/X_train.txt", sep=""))
writeLines(paste("train feature readings rows", dim(train_feature_readings)[1], "columns", dim(train_feature_readings)[2]))

feature_readings = rbind(test_feature_readings, train_feature_readings)
writeLines(paste("combined feature readings rows", dim(feature_readings)[1], "columns", dim(feature_readings)[2])) 

# read column names from features

colnames(feature_readings) = features[,2]

tidy_set = cbind(tidy_set, feature_readings)

writeLines(paste("combined tidy and feature readings rows", dim(tidy_set)[1], "columns", dim(tidy_set)[2]))

# select only those measurement columns that have mean or std in the column name

tidy_set = tidy_set[,grepl("[Mm]ean|[Ss]td|Subject|Activity", names(tidy_set))]
writeLines(paste("tidy set after selecting mean std columns rows", dim(tidy_set)[1], "columns", dim(tidy_set)[2]))


# clean column names

colnames(tidy_set) = gsub("[/(/)]","", colnames(tidy_set))
colnames(tidy_set) = make.names(colnames(tidy_set))

# make column names more user-friendly

colnames(tidy_set)  = gsub('Acc', "Acceleration", colnames(tidy_set))
colnames(tidy_set)  = gsub('Mag', "Magnitude", colnames(tidy_set))
colnames(tidy_set)  =  gsub('\\.mean', ".Mean", colnames(tidy_set))
colnames(tidy_set)  =  gsub('\\.std', ".StandardDeviation", colnames(tidy_set))
colnames(tidy_set)  =  gsub('Freq\\.', "Frequency.", colnames(tidy_set))
colnames(tidy_set)  =  gsub('Freq$', "Frequency", colnames(tidy_set))

writeLines(paste("Transformation ready, run create_finaldata() next"))

}

create_finaldata = function () {

# create the final set averaging measurements for each subject, activity pair

avg_tidy_set = ddply(tidy_set, c("Subject","Activity"), numcolwise(mean))
avg_tidy_set = avg_tidy_set[order(avg_tidy_set$Subject),]
writeLines(paste("final tidy set rows", dim(avg_tidy_set)[1], "columns", dim(avg_tidy_set)[2]))


# write the average result set to file
        
write.table(avg_tidy_set, resultcsvfile, row.names=FALSE)

writeLines(paste("Tidy data set is in the ", resultcsvfile, " file in the working directory ", getwd(), sep=""))

}




