#' Prints a percent table.
#' @param var characer. The name of the variable you want percent breakdown for.
#' @param df data frame. The data frame of the variable to run the table for.  This dataframe is still assumed
#' to be three column (id, variable name, value), but could be the result of a fetch_var() or fetch_var_by()
#' @param round integer. How many digits you want to round percentages to. Default no rounding.
#' @param na.rm logical. Remove all the NA, "N/A", or "" values. On by default.
#' @export
percent_table <- function(df, round = NULL, na.rm = TRUE) {
  sapply(unique(df[[3]]), function(x) {
    if (!na.rm | (!is.na(x) & !is.null(x) & !identical(x, "") & !identical(x, "N/A"))) {
      percent <- length(df[df[[3]] == x,3]) / length(df[[3]]) * 100
      if (!is.null(round)) percent <- round(percent, digits = round)
      print(paste0(x, ": ", percent, "%"))
    }
  })
  NULL
}
