# Getting-and-Cleaning-Data-Project
Project included the cleaning of data &amp; organizing it inn the form of a tidy dataset

The Procedure:

1. The data is downloaded & unzipped outside R & all the required data is read using "read.table".
2. The data then undergoes preliminary binding with "x" together, "y" together and "subject" together, binded by rows.
3. "grep" function is used to find the columns with only "mean" & "standard deviation"
4. The "x" file is then subsetted acoording to the feature names containing mean & std.
5. Correct headings are then provided according to the features.
6. The "y" data is then matched with the correct activity labels.
7. All of thhe 3 different datasets are then compiled to getthe final dataset.
8. Final tidy dataset is creating by transforming the subset using ddply function.
9. As the final step the compiled tidy dataset is written to a text file.
