# Coursera-Getting-and-Cleaning-Data
## Introduction
This repository stores the project for the Coursera course work of "Getting and Cleaning Data"

## About the Raw Data
The dataset used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from UCI.
This dataset records unlabelled features in `x_test.txt` and `x_train.txt`. Test subjects are recorded in `subject_test.txt`.

## Running the Script
This script `run_analysis.R` will merge both training and test datasets together. Some steps to carry out before running this script includes:

1. Unzipping the UCI HAR Dataset to the same directory as script
2. Rename the folder to `dataset`

Upon running the script, a tidied dataset with space delimited output `tidy_data.txt` will be created.