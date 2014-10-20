#' Define the variable names for the project by converting ugly data names into
#' the names you want to use for functions like fetch().
#'
#' @param definition_list list. A list that maps the new variable name to the old
#' ugly name. (e.g., \code{list('age' = 'What.is.your.age')})
#'
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
define_variables <- function(definition_list, data) {
  data[[2]] <- Reduce(function(v,i) {
    gsub(
      fixed = TRUE,
      definition_list[[i]],
      names(definition_list)[i],
      v
    ) },
    seq_along(definition_list),
    data[[2]]
  )
  data
}
