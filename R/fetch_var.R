#' Fetches values from a melted data frame.
#'
#' @param var_name character. The name of the variable within the data frame to
#' select values from.
#'
#' @param compare character. An operator to compare to the select parameter, if
#' chosen (e.g., "==", ">", ">=", etc.).  == by default if select is chosen.
#'
#' @param select character. Returns only values that match this value. Useful for
#' counting. Off by default.
#' the ids, or 'all' to grab the entire data frame for that variable.
#'
#' @param by_id character. The ID of a particular person, if you only want data from
#' that one person. Off by default.
#'
#' @param na.rm logical. Remove all the NA, "N/A", or "" values. On by default.
#'
#' @param data. The data to grap values from. This is assumed to be a three column
#' melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#'
#' @param col. 3 (default) to grap values, 2 to grab the variable name, 1 to grab
#' @export
fetch_var <- function(var_name, compare = '==', select = NULL, by_id = -1, col
 = 3, na.rm = TRUE, data = get_data())
 {
  if (by_id != -1) data <- data[data[[1]] == by_id,]
  if (!is.null(select)) {
    data <- if (identical(compare, "==")) {
      data[data[[3]] == select, ]
    } else {
      eval(parse(text =
        paste0("data[as.numeric(data[[3]])", compare, select, ",]")
      ))
    }
  }
  if (na.rm) data <- data[data[[3]] != "" & data[[3]] != "N/A" & !is.na(data[[3]]
),]
  if (!identical(col, 'all')) {
    output <- data[data[[2]] == var_name, col]
  } else {
    output <- data[data[[2]] == var_name, ]
    output <- output[!is.na(output[[1]]), ]
  }
  output
}
