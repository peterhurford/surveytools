#' Given a melted data frame, a list of ids mapping to what their value should
#' be for a given variable, and the name of that variable in the dataframe,
#' perform the desired translation.  Useful in interpolation.
#'
#' @param swap_list list. A list mapping ids to the value that id should have
#' e.g., \code{list(1 = 'cat', 2 = 'dog', 3 = 'dog')}
#'
#' @param variable character. The name of the variable where the replacement occurs.
#'
#' @param data.  The data to be transformed.  This is assumed to be a three
#' column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
swap_by_ids <- function(swap_list, variable, data = get_data()) {
  sapply(names(swap_list), function(id) {
    data[data[[1]] == id & data[[2]] == variable & !is.na(data[[1]]), 3] <<- swap_list[[id]]
  })
  set_data(data)
  data
}
