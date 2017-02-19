# Getting_and_cleaning_data
The initial datasets are created from the X_train.csv, Y_train.csv, subject_train.csv, X_train.csv, Y_train.csv, subject_train.csv files:
X_test is the dataset generated from X_text.csv
Y_test is the dataset generated from Y_text.csv
subject_test is the dataset generated from subject_test
X_train is the dataset generated from X_train.csv
Y_train is the dataset generated from Y_train.csv
subject_train is the dataset generated from subject_train

The feature dataset is generated from the deature.csv file.

The header data is added for each dataset from the feature dataset.

For each dataset type (X_*,Y_*,subject_*) the train and test datasets  are merged through the rbind function. The resulting datasets are X, Y and subject.

From the X dataset, only the columns name containing the terms "mean" and "std" are selected. The result is sent to the Zms dataset (an intermediate Z dataset is used).

The columns corresponding to the activity (Y data set) and the subject (subject dataset) are added to the Zms dataset

The activity_label dataset is created from the activity_label.csv file.
The activity column is labeled through the activity_label dataset by using th sub function 6 times.

The average of each variable by subject and by activity is calculated throught the aggregate function and stored in the ZmsMean dataset.

The final result is stored in the ZmsMean dataset.

