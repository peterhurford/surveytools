#' Given a melted data frame and a definition for the new variable, create
#' that new variable added onto the melted data frame.
#'
#' @param new_var_name character.  The desired name of the new variable.
#' @param definition numeric or character.  The values for the new variable.
#'
#' @param data.  The data to which the new variable will be added. This is
#' assumed to be a three column melted dataframe, using reshape2
#' <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
make_new_var <- function(new_var_name, definition, data = get_data()) {
  df <- data.frame(unique(data[[1]]), new_var_name, definition)
  colnames(df) <- c(names(data)[[1]], names(data)[[2]], names(data)[[3]])
  data <- rbind(data, df)
  set_data(data)
  data
}
