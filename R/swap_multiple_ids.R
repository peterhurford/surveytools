#' Given a melted data frame, a vector of ids, a value, and a variable,
#' this will make the value of that variable at all those ids into the given value.
#' Useful in interpolation.
#'
#' @param ids vector. A list of ids to swap.
#' @param value character. The value that the variable will be set to.
#' @param variable character. The variable in which the transformations will take place.
#' @param data.  The data to be transformed.  This is assumed to be a three
#' column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
swap_multiple_ids <- function(ids, value, variable, data = get_data()) {
  pbsapply(ids, function(id) {
    data[data[[1]] == id & data[[2]] == variable & !is.na(data[[1]]), 3] <<- value
  })
  set_data(data)
  data
}
