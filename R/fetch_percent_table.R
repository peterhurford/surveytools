#' Runs percent_table for melted data frames.
#' @param var characer.  The name of the variable you want percent breakdown for.
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @param round integer. How many digits you want to round percentages to. Default no rounding.
#' @export
fetch_percent_table <- function(var, data = get_data(), round = NULL) {
  percent_table(fetch_var(var, data = data, col = 'all'), round = round)
}
