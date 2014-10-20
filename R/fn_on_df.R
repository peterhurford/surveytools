#' Runs a function on the values of a melted data frame.
#' Used for preforming median, mean, sd, and sum without a ton of ugly scripting.
#' @param fetch_group. The result of a fetch_var()
#' @param fn. The name of the function.
#'
#' e.g., the median age would be \code{fn_on_df(fetch('age'), median)}
#' @export
fn_on_df <- function(fetch_group, fn, ...) {
  fn(as.numeric(fetch_group), na.rm = TRUE, ...)
}
