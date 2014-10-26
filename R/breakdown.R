#' Breakdown values of a variable by the number of people who have that value or
#' a higher value.
#' @param var character. The value to breakdown.
#' @param seq list. A sequence of values to breakdown.
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#'
#' e.g., \code{breakdown('age', seq(5, 90, by = 5))} will tell me how many people
#' are age 5 or older, how many people are age 10 or older, how many people are
#' age 15 or older, etc. to age 90.
#' @export
breakdown <- function(var, seq, data = get_data()) {
  sapply(seq, function(x) {
    y <- as.numeric(fetch_var(var, data = data))
    print(paste(x, length(y[y > x]), collapse = ':'))
  })
  NULL
}
