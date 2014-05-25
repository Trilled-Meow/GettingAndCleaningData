Code Book
========================================================

### Data
The data used in this project comes from the Human Activity Recognition Using Smartphones Data Set, a dataset created from the daily activites of 30 subjects. The original research was performed by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.

The orignal data source and more information can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Variables

"activity_id": Identifies the activity of a participant (integer)

"activity_name": The names of participants' recorded actions: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING (factor)

"subject_id": ID given to each subject (integer)

### Process
The provided run_analysis.R combines the test, train, mean, and standard deviation data from the original dataset into one tidy dataset with help from fuctions in the reshape2 package.