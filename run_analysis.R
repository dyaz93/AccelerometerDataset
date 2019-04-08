## Read data into R
test <- read.table("./UCI.HAR.Dataset/test/X_test.txt", colClasses="numeric")
testlab <- read.table("./UCI.HAR.Dataset/test/y_test.txt", colClasses="character")
testsub <- read.table("./UCI.HAR.Dataset/test/subject_test.txt", colClasses="numeric")
train <- read.table("./UCI.HAR.Dataset/train/X_train.txt", colClasses="numeric")
trainlab <- read.table("./UCI.HAR.Dataset/train/y_train.txt", colClasses="character")
trainsub <- read.table("./UCI.HAR.Dataset/train/subject_train.txt", colClasses="numeric")

## Read feature list
feats <- read.table("./UCI.HAR.Dataset/features.txt", colClasses="character")
featlist <- feats[, 2]

## Renames activity list
actlist <- c("Walking", "Walking upstairs", "Walking downstairs", "Sitting", "Standing", "Laying")
vectest <- testlab[, 1]        # Coerce data frame into
vectrain <- trainlab[, 1]      # vectors
for (i in 1:6) {
    vectest <- sub(i, actlist[i], vectest)
    vectrain <- sub(i, actlist[i], vectrain)
}
testlab <- as.data.frame(vectest, stringsAsFactors = FALSE)       # Coerce vectors back into
trainlab <- as.data.frame(vectrain, stringsAsFactors = FALSE)     # data frames

## Merge training and test sets into one data set
testdat <- cbind(testsub, testlab, test)    # Create test set
traindat <- cbind(trainsub, trainlab, train)   # Create training set
nam <- c("Subject", "Activity", featlist)
names(testdat) <- nam         # Rename variables according to
names(traindat) <- nam        # features list
data <- rbind(traindat, testdat)     # Merge test and training set

## Extract only measurements on the mean and standard deviation
k <- grep("mean\\(\\)|std\\(\\)", featlist)
datams <- data[c(1, 2, k+2)]    # Takes the first two columns, plus the columns
                                # with mean() and std()
