#' Prints a percent table.
#' @param var characer.  The name of the variable you want percent breakdown for.
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @param round integer. How many digits you want to round percentages to. Default no rounding.
#' @export
percent_table <- function(var, data, round = NULL) {
  sapply(unique(fetch_var(var, data = data)), function(x) {
    percent <- length(fetch_var(var, select = x, data = data)) / length(fetch_var(var, data = data)) * 100
    if (!is.null(round)) percent <- round(percent, digits = round)
    print(paste0(x, ": ", percent, "%"))
  })
  NULL
}
