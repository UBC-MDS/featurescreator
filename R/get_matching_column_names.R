#' Returns a subset of the columns whose names match the pattern.
#'
#' Matching columns are columns whose names start
#' with the given pattern and end with an incrementing integer.
#'
#' @param df The dataframe from which to extract columns
#' @param pattern The prefix of the column names to extract (string)
#'
#' @return A vector of strings that match the pattern
#' @export
#'
#' @examples
#' data <- data.frame(week_payment1 = c(1, 2, 3), week_payment2 = c(1, 2, 3),
#'                    week_payment3 = c(1, 2, 3), othercolumn = c(5, 6, 7))
#' get_matching_column_names(data, "week_payment")

get_matching_column_names <- function(df, pattern) {
    NULL
}