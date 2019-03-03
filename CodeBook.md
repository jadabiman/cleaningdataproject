# Code book 

## Variables 

Each row contains, for a given subject and activity, 79 averaged measurements.

### Identifiers 

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, string with 6 possible values: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

### Average of measurements and units <a name="average-measurements"></a> 

All measurements are normalized and bounded within [-1,1].
Accelerometer measurements prior to normalization in *g*'s (9.81 m.s⁻²) 
Gyroscope measurements (variables containing `Gyroscope`) in radians per second (rad.s⁻¹).

timeBodyacceleration-XYZ
timeGravityacceleration-XYZ
timeBodyaccelerationJerk-XYZ
timeBodyGyro-XYZ
timeBodyGyroJerk-XYZ
timeBodyaccelerationMag
timeGravityaccelerationMag
timeBodyaccelerationJerkMag
timeBodyGyroMag
timeBodyGyroJerkMag
frequencyBodyacceleration-XYZ
frequencyBodyaccelerationJerk-XYZ
frequencyBodyGyro-XYZ
frequencyBodyaccelerationMag
frequencyBodyaccelerationJerkMag
frequencyBodyGyroMag
frequencyBodyGyroJerkMag
gravityMean
timeBodyaccelerationMean
tBodyaccelerationJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


## The following transformations were applied to the source data:

1. Training and tests sets merged
2. Only mean and standard deviation (i.e. signals containing the strings `mean` and `std`) were extracted
3. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names
4. The variable names were replaced with descriptive variable names (e.g. `tBodyAcc-mean()-X` was expanded to `timeDomainBodyAccelerometerMeanX`), using the following set of rules:
	- Special characters (i.e. `(`, `)`, and `-`) were removed
	- The initial `f` and `t` were expanded to `frequencyDomain` and `timeDomain` respectively.
	- `Acc`, `Gyro`, `Mag`, `Freq`were replaced with `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`
5. Data set was created with the average of each variable for each activity and each subject.
