#' Return an array of average of specific columns matching a pattern
#'
#' @param df A data frame
#' @param pattern A string pattern to match
#'
#' @return A vector of average of specific columns matching a pattern
#' @export
#'
#' @examples
#' df <- data.frame(
#' week_payment1 = c(1, 2, 3),
#' week_payment2 = c(4, 5, 6),
#' week_payment3 = c(7, 8, 9),
#' other_column = c(10, 11, 12)
#' )
#' calculate_average(df, "week_payment")

calculate_average <- function(df, pattern) {

}

#' Return an array of standard deviation of specific columns matching a pattern
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

}
