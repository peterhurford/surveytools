#' Runs a t test (two-sided, unpaired) on data within a melted dataframe.
#'
#' Gracefully handles differences in variable size and NAs, and allows easy
#' removal of variables.
#'
#' @param var character. The name of the first variable in the chi-square test.
#' @param by_var charager. The name of the second (by) variable in the
#'     chi-square test.
#' @param ignore vector. A vector of the names of values to be replaced by NAs
#'     within both the var and the by_var. Can clean up categories that are too
#'     small for meaningful analysis.
#'
#' @param data.  The data to be transformed.  This is assumed to be a three
#' column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
ttest <- function(var, by_var, ignore = NULL, data = get_data()) {
  x <- fetch_var(var, col = 'all')
  x[[3]] <- as.numeric(x[[3]])
  y <- fetch_var(by_var, col = 'all')

  if (!is.null(ignore)) {
    x[x[[3]] %in% ignore, 3] <- NA
    y[y[[3]] %in% ignore, 3] <- NA
  }

  x <- na.rm(x)
  y <- na.rm(y)
  x2 <- x[x[[1]] %in% y[[1]], 3]
  y2 <- y[y[[1]] %in% x[[1]], 3]
  t.test(x2 ~ y2)
}
