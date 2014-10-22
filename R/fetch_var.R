#' Fetches values from a melted data frame.
#'
#' @param var_name character. The name of the variable within the data frame to
#' select values from.
#'
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#'
#' @param col. 3 (default) to grap values, 2 to grab the variable name, 1 to grab
#' the ids, or 'all' to grab the entire data frame for that variable.
#'
#' @param by_id character. The ID of a particular person, if you only want data from
#' that one person. Off by default.
#'
#' @param select character. Returns only values that match this value. Useful for
#' counting. Off by default.
#'
#' @param na.rm logical. Remove all the NA, "N/A", or "" values. On by default.
#' @export
fetch_var <- function(var_name, data, col = 3, by_id = 0, select = NULL, na.rm = TRUE) {
  if (by_id != 0) data <- data[data[[1]] == by_id,]
  if (!is.null(select)) data <- data[data[[3]] == select,]
  if (na.rm) data <- data[data[[3]] != "" & data[[3]] != "N/A" & !is.na(data[[3]]),]
  browser()
  if (!identical(col, 'all')) {
    output <- data[data[[2]] == var_name, col]
  } else {
    output <- data[data[[2]] == var_name, ]
    output <- output[!is.na(output[[1]]), ]
  }
  output
}
