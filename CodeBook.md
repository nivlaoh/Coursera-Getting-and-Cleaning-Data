# Code Book
## Introduction
The script breaks down the procedures into 5 steps as described in the project's description.
- Firstly, x, y and subject observations in both test and training data are combined respectively using `rbind`.
- Next, only features containing mean or standard deviation are extracted
- Replace the numbers representing activities in y dataset with activity names in `activity_label.txt` for more descriptive meaning
- Substitute names as best as I could for better clarity
- Last but not least, to generate a dataset with all average measures for each subject and activity category and it's recorded in `tidy_data.txt`. It should contain 180 observations