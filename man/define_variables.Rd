% Generated by roxygen2 (4.0.2.9000): do not edit by hand
% Please edit documentation in R/define_variables.R
\name{define_variables}
\alias{define_variables}
\title{Define the variable names for the project by converting ugly data names into
the names you want to use for functions like fetch().}
\usage{
define_variables(definition_list, data = get_data())
}
\arguments{
\item{definition_list}{list. A list that maps the new variable name to the old
ugly name. (e.g., \code{list('age' = 'What.is.your.age')})}

\item{data.}{The data to grap values from. This is assumed to be a three column
melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
The first column should contain IDs, the second column should contain variable
names, and the third column should contain variable values.}
}
\description{
Define the variable names for the project by converting ugly data names into
the names you want to use for functions like fetch().
}

