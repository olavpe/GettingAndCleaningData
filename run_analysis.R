## **For the script to work the Working Directory contain the UCI HAR Dataset
## 
## The following script contains two function read() and readall() followed by
## a script that combines the X_test and X_train datasets and creates a 
## complete dataset with the lables, activity and subject information. It then
## extracts the mean and std deviation measurements and writes it as
## tidyData.txt. For more information see the README.md and Codebook.md


## Reading function a function that reads all txt files in folder, except the
## README.txt and features_info.txt, and assigns them as dataframes based on 
## their filenames

read <- function(folder = "") {
    dir <- getwd()
    setwd(paste(dir,folder, sep = "/"))
    # Retrieves data txt fils in specifed folder
    filenames <- dir()
    txtfiles <- grep(x = filenames,"(txt)$", value = TRUE)
    # Files that we do not want to read
    removefiles <- c("README.txt","features_info.txt")
    readfiles <- txtfiles[!txtfiles %in% removefiles]
    # Cuts out the .txt so they can be used as dataframe names
    dfnames <- gsub('.{4}$', '', readfiles)
    # Loops through files in folder and assigns to the Global Environment
    for (i in 1:length(readfiles)) {
        assign(dfnames[i],read.table(readfiles[i],fill = TRUE),
               pos = .GlobalEnv)
    }
    setwd(dir)
}

## Function that retrieves all of the subdirectories within the working
## directory and applies the read() function to read all the text files
## in all the subdirectories, except those specified by "avoid = " input 

readall <- function(avoid = ""){
    # Stores all subdirectories
    folders <- list.dirs(path = ".", full.names = TRUE, recursive = TRUE)
    # Specifies which folders desired to remove based on "avoid =" input
    removefolders<- grep(avoid,folders, value = TRUE) 
    if (avoid == ""){
        removefolders <- c(0)
    }
    # Selects only desired subdirectories
    readfolders <- folders[!folders %in% removefolders]
    # applies read() to desired subdirectories
    sapply(readfolders, read)
}

############## Working Script

### Store information about Working Directory
originalDir <- dir()
originalWd <- getwd()

### Checking if the Working Directory contains the Dataset and then 
check <- grep("UCI HAR Dataset", originalDir)
    if (length(check) == 0){
        stop("UCI HAR Dataset folder not present in Working Directory")}
    setwd("UCI HAR Dataset")


### Reads all txtfiles within working directory as dataframes
readall(avoid = "Inertial Signals")


### Merging relevant test and train variables into respective variables
XDataSets <- rbind(X_test, X_train)
    # naming of X_"test/train" datasets and the activity index
    colnames(XDataSets) <- features[,2]
    colnames(activity_labels) <- c("activityID_index", "Activity")
activityID <- c(y_test[,1],y_train[,1])
Subject <- c(subject_test[,1],subject_train[,1])
# Comines the subject, activityID and X data into one data frame
DataSet <- cbind(Subject, activityID, XDataSets)


### Merging the activity labels into the dataset 
DataSet <- suppressWarnings(merge(DataSet,activity_labels,  
                 by.x = "activityID",by.y = "activityID_index"))
# Removes activityID and rearranges so "Subject" and "Activity" are the first
# columns. Then is sorts the dataset based on Subject number 
DataSet <- DataSet[,2:ncol(DataSet)]
DataSet <- DataSet[,c(1,ncol(DataSet), 2:(ncol(DataSet)-1))]
DataSet<- DataSet[order(DataSet$Subject),]


### Creating tidyData.txt
# Chooses columns that contains means and stds
meanCols <- grep("mean[^F)]",colnames(DataSet))
stdCols <- grep("std",colnames(DataSet))
extractCols <- c(1:2,meanCols, stdCols)
# Extracts specified columns and creates tidyData
tidyData <- DataSet[,extractCols]

### Returns to the original Working Directory and writes tidyData.txt
setwd(originalWd)
write.table(tidyData, file = "tidyData.txt",row.names = FALSE)

