#' Return a vector of standard deviation of specific columns matching a pattern
#'
#' @param df A data frame
#' @param pattern A string pattern to match
#'
#' @return A vector of standard deviation of specific columns matching a pattern
#' @export
#'
#' @examples
#' df <- data.frame(
#' week_payment1 = c(0, 3, 6),
#' week_payment2 = c(2, 5, 8),
#' week_payment3 = c(5, 8, 11),
#' other_column = c(10, 11, 12)
#' )
#' calculate_standard_deviation(df, "week_payment")
#' c(6, 6, 6)

calculate_standard_deviation <- function(df, pattern) {

  # check df types
  if(!is.data.frame(df)){
    stop("The df variable needs to be a dataframe")
  }

  # check pattern type
  if(!is.character(pattern)){
    stop("The pattern variable needs to be a character type")
  }

  # get matching column names
  colnames <- get_matching_column_names(df, pattern)


  # check if there are matching column names
  if(length(colnames) == 0){
    stop("No column names found matching pattern")
  }

  # calculate average of colnames
  rst <- apply(df[, colnames, drop = F], 1, sd)
  rst <- replace(rst, is.na(rst), 0) * (1 - 1/nrow(df))**0.5

  rst

}
