#' Gets the data parameter that was previously set by set_data() or errors.
#' @export
get_data <- function() {
  tryCatch(surveytools_data,
    error = function(e) stop('Data has not been set.')
  )
}
