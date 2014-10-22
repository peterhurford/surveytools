#' Fetches the values of one variable where a second variable is a certain value.
#'
#' @param first_var character. The name of the variable you want values returned for.
#'
#' @param by_var character. The name of the variable you want to sort by.
#'
#' @param select. The value by_var should be.
#'
#' @param col. 3 (default) to grap values, 2 to grab the variable name, 1 to grab
#' the ids, or 'all' to grab the entire data frame for that variable.
#'
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#'
#' e.g., to return the favorite food of people from the city of Paris:
#' \code{fetch_var_by(favorite_food, home_city, 'Paris', data)}
#' @export
fetch_var_by <- function(first_var, by_var, select, col = 3, data) {
  ids <- fetch_var(by_var, select = select, data = data, col = 1)
  if (!identical(col, 'all')) {
    data[data[[1]] %in% ids & data[[2]] == first_var, col]
  } else {
    data[data[[1]] %in% ids & data[[2]] == first_var, ]
  }
}
