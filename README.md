## Surveytools
Surveytools is a collection of R functions that, together, create a lightweight and modern workflow for analyzing survey data.  

[![Build Status](https://travis-ci.org/peterhurford/surveytools.svg?branch=master)](https://travis-ci.org/peterhurford/surveytools)


## Modern, Lean Survey Analysis

It's underrated how much of data science is actually data janitorial work, with many hours spent cleaning messy data to make it actually something you can analyze. Surveytools helps make that a little bit easier, so you spend less time writing clunky R code and more time actually analyzing your data.

With the Surveytools workflow, you separate your R file into X steps:

#### Step 1: Define Libraries
At minimum, you'll need `reshape2` and `surveytools`.

```R
### Libraries
if (!require(reshape2)) install.packages('reshape2'); require(reshape2)
if (!require(surveytools)) install_github('peterhurford/surveytools');
```

#### Step 2: Read the Data
The goal here is to get the data and then create a melted data frame, which is a single data frame with three columns -- the ID of the user, the variable, and that variable's value.

```R
### Read Data
setwd('~/dev/survey')
data <- read.csv('survey_responses.csv')
data <- melt(data, id="Response.ID")
```

#### Step 3: Clean the Data
Now here's where we clean stuff up using Surveytools.

You can do things like make nice, crisp variable names...
```R
data <- define_variables(list(
  'id' = 'Response.ID',
  'age' = 'What.is.your.age',
  'country' = 'Where.do.you.live'
), data = data)
```

...clean up values
```R
data <- swap_by_value(list(
  'UK' = 'Scotland',
  'UK' = 'England' 
  'UK' = 'Wales'
), 'country', data = data)
```

...interpolate data by id
```R
data <- swap_by_id(list(
  '11' = 'UK',
  '12' = 'France'
), 'country', data = data)
```

...and make new variables

TODO: Finish


## Installation

This package is not yet available from CRAN. To install the latest development builds directly from GitHub, run this instead:

```R
if (!require("devtools")) install.packages("devtools")
devtools::install_github('peterhurford', 'surveytools')
```
