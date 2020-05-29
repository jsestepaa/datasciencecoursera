======================================================================================

In this repository we can find the cleaned data set for the final assignment the the 
'Cleaning Data' course in coursera.

The assignment consist in a script (run_analysis.R) located in the 'R Files\' folder 
and a cleaned dataset (dataset 2.txt) in the 'Misc Files\UCI HAR Dataset\' folder.

Additionally in the repository there's a copy of all the files provided for the 
assignment in the location used by the script.

======================================================================================

The scrip first loads all the necessary files from the test and train folders and 
procede to merge the train-test files.

Then renames the columns of the merged datasets using the values found in features.txt 
for the columns in X_data (it uses the make.names function to eliminate the repeated 
values in features.txt).

The next step is to merge all the datasets in one called complete, and to generate a 
vector with the column names to use in the final dataset (I used 'mean\\.|std\\.' 
because make.names changes the '()' for multiple dots).

The final dataset use all the column with values of mean or std.

Finally, i grouped the data set by 'subject' and 'activityId' and generated a summary 
dataset with the mean value of each variable 
(saved as 'Misc Files\UCI HAR Dataset\dataset 1.txt').

======================================================================================

Code Book

The units and meaning of each variable is found in the 'features_info.txt' provided 
in the original dataset ('Misc Files\UCI HAR Dataset\features_info.txt).
