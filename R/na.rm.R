#' Deletes all NA and NA-like values from a melted data frame. 
#' @param data.  The data to be transformed.  This is assumed to be a three
#' column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
na.rm <- function(data) {
  data <- data[!is.na(data[[3]]) & data[[3]] != "" & data[[3]] != "NA" & data[[3]] != "N/A" & data[[3]] != "", ]
  set_data(data)
  data
}                                                                                 
