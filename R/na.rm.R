#' Deletes all NA and NA-like values from a melted data frame. 
#' @param data.  The data to be transformed.  This is assumed to either be a vector
#' or a three column melted dataframe, using reshape2 <http://cran.r-project.org/web/packages/reshape2/index.html>.
#' The first column should contain IDs, the second column should contain variable
#' names, and the third column should contain variable values.
#' @export
na.rm <- function(data) {
  if(identical(class(data), 'data.frame')) subdata <- data[[3]] else subdata <- data
  subdata <- subdata[!is.na(subdata) & subdata != "" & subdata != "NA" & subdata != "N/A" & subdata != ""]
  if(identical(class(data), 'data.frame')) {
    data[[3]] <- subdata
    data
  } else { subdata }
}                                                                                 
