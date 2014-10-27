#' Prints a percent table.
#' @param var characer. The name of the variable you want percent breakdown for.
#' @param data.  The data to be displayed.  This is assumed to either be a vector
#' or a three column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' @param round integer. How many digits you want to round percentages to. Default no rounding.
#' @param na.rm logical. Remove all the NA, "N/A", or "" values. On by default.
#' @export
percent_table <- function(data, round = NULL, na.rm = TRUE) {
  if (identical(class(data), 'data.frame')) data <- data[[3]]
  if (na.rm) na.rm(data)
  sapply(unique(data), function(x) {
    percent <- if (identical(class(data), 'data.frame'))
      length(data[data == x,3]) / length(data) * 100
    else
      length(data[data == x]) / length(data) * 100
    if (!is.null(round)) percent <- round(percent, digits = round)
    print(paste0(x, ": ", percent, "%"))
  })
  NULL
}
