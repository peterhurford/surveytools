chisquare <- function(var, by_var, ignore = NULL, data = get_data()) {
  x <- fetch_var(var, col = 'all')
  y <- fetch_var(by_var, col = 'all')

  if (!is.null(ignore)) {
    x[x[[3]] %in% ignore, 3] <- NA
    y[y[[3]] %in% ignore, 3] <- NA
  }

  x <- na.rm(x)
  y <- na.rm(y)
  x2 <- x[x[[1]] %in% y[[1]], 3]
  y2 <- y[y[[1]] %in% x[[1]], 3]
  browser()
  chisq.test(table(x2, y2))
}
