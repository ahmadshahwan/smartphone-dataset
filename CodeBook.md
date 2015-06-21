The dataset is included in the file summary.txt. Each row represents the average measurements of a given activity, for a given subjet.

The variables are as follow:

* Activity.Label	the label of the activity, can be WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.
* Subject.ID		the subject ID, ranges from 1 to 30.
* 66 mean and standard deviation features	those are features that contain either mean() or std() in their names. For the full original list, refer to the file "UCI HAR Dataset/features.txt"

The dataset contains both training and test data (that is all recorded experiments). Feature values were averaged over all observations for each activity and each subject.

Features' column names are kept as found in the file "UCI HAR Dataset/features.txt", with parentheses turned into dots.

To regenerate the data set, please run the script run_analysis.R, after unziping the file available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory.
