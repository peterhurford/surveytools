#' Fetches values from a melted data frame that are within a particular range.
#'
#' @param var character. The name of the variable within the data frame to
#' select values from.
#' @param min numeric. The smaller end of the range.
#' @param max numeric. The upper end of the range.
#'
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
fetch_var_in_range <- function(var, min, max, data) {
  result <- fetch_var(var, data = data)
  result[as.numeric(result) >= min & as.numeric(result) <= max & !is.na(as.numeric(result))]
}
