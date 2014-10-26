#' Given a melted data frame, a list of values as they currently are in the
#' data frame mapped to a list of what you want the values to be, this method
#' will swap the values.  Useful for shortening up or cleaning data.
#'
#' @param swap_list list. A list mapping current values to what they should be.
#' e.g., to replace all instances of "dog" witih "cat", use
#' \code{list('dog' = 'cat')}
#'
#' @param variable character. The name of the variable where the replacement occurs.
#'
#' @param data.  The data to be transformed.  This is assumed to be a three
#' column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
swap_by_value <- function(swap_list, variable, data = get_data()) {
  sapply(names(swap_list), function(x) {
    data[data[[2]] == variable & data[[3]] == x, 3] <<- swap_list[[x]]
  })
  data
}
