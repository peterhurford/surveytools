#' Fetches the values of one variable where a second variable is a certain value.
#'
#' @param var character. The name of the variable you want values returned for.
#'
#' @param select_list. A list of all subselections, with the name of the variable to
#' subselect by and the value it should be (e.g., \code{list('student' = 'Yes')})
#'
#' @param compare character. An operator to compare to the select parameter, if
#' chosen (e.g., "==", ">", ">=", etc.).  == by default if select is chosen.
#'
#' @param col. 3 (default) to grap values, 2 to grab the variable name, 1 to grab
#' the ids, or 'all' to grab the entire data frame for that variable.
#'
#' @param na.rm logical. Whether or not to remove NA and NA-like values.
#'
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#'
#' e.g., to return the favorite food of people from the city of Paris:
#' \code{fetch_var_by(favorite_food, home_city, 'Paris', data)}
#' @export
fetch_var_by <- function(var, select_list, compare = '==', col = 3,
  na.rm = TRUE, data = get_data()) {
    ids <- ids(data)
    sapply(names(select_list), function(x) {
      ids <<- base:::intersect(
        ids,
        fetch_var(x, select = select_list[[x]], compare = compare,
          na.rm = na.rm, data = data, col = 1)
      )
    })
    data <- data[data[[1]] %in% ids & data[[2]] == var, ]
    if (na.rm) data <- na.rm(data)
    if (!identical(col, 'all')) data[[col]] else data
}
