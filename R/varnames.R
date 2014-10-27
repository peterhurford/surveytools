#' Gets the variable names of the melted data frame.
#' @param data.  The data to be transformed.  This is assumed to be a three
#' column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
varnames <- function(data = get_data()) { unique(data[[2]]) }
