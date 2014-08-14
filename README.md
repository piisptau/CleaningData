CleaningData
============

Raw source data can be run using the following steps:

* Place source code run_analysis.R in a suitable directory and source it
from R with command: 
    source("C:\\expdata\\CleaningData\\run_analysis.R")
* Load the source files and unzip them using function call read_sourcefile(), before calling the function set working directory
    > setwd("c:\\temp")
    > read_sourcefile()
    Reading source zip file
    trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    Content type 'application/zip' length 62556944 bytes (59.7 Mb)
    opened URL
    downloaded 59.7 Mb

* Perform data transformation by calling the function transform_data()
    > transform_data()
    features rows 561 columns 2
    activities rows 6 columns 2
    test set rows 2947 columns 1
    training set rows 7352 columns 1
    initial tidy set rows 10299 columns 1
    test activity rows 2947 columns 1
    train activity rows 7352 columns 1
    subject activity rows 10299 columns 1
    tidy set after combining activities rows 10299 columns 2
    test feature readings rows 2947 columns 561
    train feature readings rows 7352 columns 561
    combined feature readings rows 10299 columns 561
    combined tidy and feature readings rows 10299 columns 563
    tidy set after selecting mean std columns rows 10299 columns 88
    Transformation ready, run create_finaldata() next
    > 

* Create the final result set and write it to file using function create_finaldata()
    > create_finaldata()
    final tidy set rows 180 columns 88
    Tidy data set is in the Tidy_data.csv file in the working directory C:/Temp
    >


