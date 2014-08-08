clean_data = function (readSource=1) {

require("plyr")

# Define source file, destination zip file name and directory and the the final csv result file 

sourcefile = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destzipfile = "./sourcedata/getdata-projectfiles-UCI HAR Dataset.zip"
destDirectory = "./sourcedata/UCI HAR Dataset/"
resultcsvfile = "Tidy_data.csv"

# Read source file and unzip it if readSource parameter value is 1

if (readSource==1) {

writeLines("Reading source zip file")

if (!file.exists("sourcedata")) {
      dir.create("sourcedata")
}

if (!file.exists(destzipfile)){
      download.file(sourcefile, destfile=destzipfile, mode="wb")
      unzip(destzipfile, exdir="./sourcedata")
}

} else {
 
writeLines(paste("Reading already downloaded data from", destDirectory))

if (!file.exists(destDirectory)) {
      writeLines(paste("Directory not found, load data with clean_data(readSource=1)"))
      return(FALSE)
}

}


# read features and activity labels

features = read.table(paste(destDirectory, "features.txt", sep=""), stringsAsFactors=FALSE)

activity_labels = read.table(paste(destDirectory, "activity_labels.txt", sep=""), stringsAsFactors=FALSE, col.names = c("ActivityId", "Activity"))

test_set = read.table(paste(destDirectory, "test/subject_test.txt", sep=""))
train_set = read.table(paste(destDirectory, "train/subject_train.txt", sep=""))

tidy_set = rbind(test_set, train_set)

test_activity = read.table(paste(destDirectory, "test/Y_test.txt", sep=""))
train_activity = read.table(paste(destDirectory, "train/Y_train.txt", sep=""))

subject_activity = rbind(test_activity,train_activity)

# create final Subject, Activity columns to tidy set

tidy_set = cbind(tidy_set, merge(subject_activity, activity_labels, by.x="V1", by.y="ActivityId")[,2])
colnames(tidy_set) = c("Subject", "Activity" )

test_feature_readings = read.table(paste(destDirectory, "test/X_test.txt", sep=""))
train_feature_readings = read.table(paste(destDirectory, "train/X_train.txt", sep=""))

feature_readings = rbind(test_feature_readings, train_feature_readings) 

# read column names from features

colnames(feature_readings) = features[,2]

tidy_set = cbind(tidy_set, feature_readings)

# select only those measurement columns that have mean or std in the column name

tidy_set = tidy_set[,grepl("[Mm]ean|[Ss]td|Subject|Activity", names(tidy_set))]

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

# create the final set averaging measurements for each subject, activity pair

avg_tidy_set = ddply(tidy_set, c("Subject","Activity"), numcolwise(mean))
avg_tidy_set = avg_tidy_set[order(avg_tidy_set$Subject),]

# write the average result set to file

if (!file.exists(resultcsvfile)) {
  newfile = readline(paste("Result file ", resultcsvfile, " already exists in the working directory, give new name for this version of result file "))
  resultcsvfile = newfile
}
        
write.csv(avg_tidy_set, resultcsvfile, row.names=FALSE)

writeLines(paste("Tidy data set is in the ", resultcsvfile, " file in the working directory ", getwd(), sep=""))

return(TRUE)

}

