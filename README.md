## Surveytools
Surveytools is a collection of R functions that, together, create a lightweight and modern workflow for analyzing survey data.  

### NOTE: Surveytools is now obsoleted by the better [Surveytools2 Package](http://www.github.com/peterhurford/surveytools2).  Please use that package instead.


[![Build Status](https://travis-ci.org/peterhurford/surveytools.svg?branch=master)](https://travis-ci.org/peterhurford/surveytools)


## Modern, Lean Survey Analysis

It's underrated how much of data science is actually data janitorial work, with many hours spent cleaning messy data to make it actually something you can analyze. Surveytools helps make that a little bit easier, so you spend less time writing clunky R code and more time actually analyzing your data.

Instead of writing the following clunky code to clean location data...
```R
data[data[[2]] == 'country' & data[[3]] == 'Scotland'] <- 'UK'
data[data[[2]] == 'country' & data[[3]] == 'England'] <- 'UK'
data[data[[2]] == 'country' & data[[3]] == 'Wales'] <- 'UK'
```

...Instead, write...
```R
data <- swap_by_value(list(
  'UK' = 'Scotland',
  'UK' = 'England' 
  'UK' = 'Wales'
), 'country')
```

And instead of writing the following ugly code to get the mean age...

```R
age = data$Your.age
numeric_ages <- as.numeric(age[!is.na(age) & age != ""])
mean(numeric_ages[!is.na(numeric_ages)])
```

...Instead, write...
`fn_on_df(fetch_var('age', data = imdata), mean)`


## Installation

This package is not yet available from CRAN. To install the latest development builds directly from GitHub, run this instead:

```R
if (!require("devtools")) install.packages("devtools")
devtools::install_github('peterhurford', 'surveytools')
```


## The Workflow

With the Surveytools workflow, you separate your R file into four steps:

#### Step 1: Define Libraries
At minimum, you'll need `reshape2`, `devtools`, and `surveytools`.

```R
### Libraries
if (!require(reshape2)) install.packages('reshape2'); require(reshape2)
if (!require(devtools)) install.packages('devtools'); require(devtools)
if (!require(surveytools)) install_github('peterhurford/surveytools'); require(surveytools)
```

#### Step 2: Read the Data
The goal here is to get the data and then create a melted data frame, which is a single data frame with three columns -- the ID of the user, the variable, and that variable's value.

```R
### Read Data
setwd('~/dev/survey')
data <- read.csv('survey_responses.csv')
data <- melt(data, id="Response.ID") # Make a melted dataframe.
set_data(data)  # Tell surveytools which dataset to use.
```

#### Step 3: Clean the Data
Now here's where we clean stuff up using Surveytools.

You can do things like replace ugly default variable names with clean names that you choose, that you can continue to refer to the variables by.

```R
data <- define_variables(list(
  'id' = 'Response.ID',
  'age' = 'What.is.your.age',
  'country' = 'Where.do.you.live'
))
```

...clean up values
```R
data <- swap_by_value(list(
  'UK' = 'Scotland',
  'UK' = 'England' 
  'UK' = 'Wales'
), 'country')
```

...interpolate data by id
```R
data <- swap_by_ids(list(
  '11' = 'UK',
  '12' = 'France'
), 'country')
```

...interpolate one value into multiple ids
```R
data <- swap_multiple_ids(
  c(1, 2, 3, 4, 5),
  value = 'UK',
  variable = 'country',
  data = data
)
```

...and make new variables from old ones
```R
data <- make_new_var('continent',
  sapply(swap_by_value(list(
    'UK' = 'Europe',
    'France' = 'Europe',
    'US' = 'Americas'
  ))),
  data = data
)
```

#### Step 4: Analyze Data

This is where you want to spend most of your time.  But there are some tools here to make analysis easier too.

You can grab values from the data...

`fetch_var('age')`

-

You can get data for a particular id...

(Get the age of person with id #36)

`fetch_var('age', by_id = 36)`

-

You can see how many people have a particular value...

(See how many people live in France)

`length(fetch_var('country', select = 'France'))`

-

You can get the ids of all the people with a particular value...

(Find the ids of everyone who lives in France)

`fetch_var('country', select = 'France', col = 1)`

-

You can also do greater than / less than selections...

(Find the number of people older than 25)

`length(fetch_var('age', '>', 25))`

-

You can also fetch values within a particular (inclusive numeric) range...

(Find the number of people ages 9-18)

`length(fetch_var_in_range('age', 9, 18))`

-

You can get means, median, modes, sums, standard deviations...

(Get mean and standard deviation for age)

`fn_on_df(fetch_var('age'), mean)`

`fn_on_df(fetch_var('age'), sd)`

-

You can get the values of one variable where another variable has a particular value...

(See the student status of all people who live in France)

`fetch_var_by('student', list('country', 'France'))`


-

And you can get a table of all the values of a variable and their percentages.

(See the percent student/non-student)

```R
fetch_percentage_table('student', data = imdata, round = 0)
[1] "Yes" 51%
[1] "No" 49%
```


-

And you can get a breakdown of a variable to see, for every value, how many people have that value or a higher value.

(See the breakdown of age)

```R
breakdown(age, seq(10, 90, by = 10))
[1] "10 630"
[1] "20 542"
[1] "30 125"
[1] "40 42"
[1] "50 20"
[1] "60 12"
[1] "70 7"
[1] "80 6"
[1] "90 6"
```

-

Lastly, don't leave home without some fancy statistical tests!  Normally, running such tests on dataframes is difficult, because they don't work if the two variables don't have the same length.  But surveytools takes care of all that headache for you.

(See if student status is significantly different by country with a chi-square test.)

`stattest('student', 'country', 'chisquare')`

(See if age is significantly different by student status with a t-test.)

`stattest('age', 'student', 'ttest')`

(See if age is significantly different by country with a linear regression.)

`stattest('age', 'country', 'lm')`

## Examples

* [The .impact survey](https://github.com/peterhurford/imsurvey/blob/master/imsurvey.R)
