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

#' Calculate percentage change over a time period for the given column pattern.
#'
#'
#' This function aims to generate features such as percentage change in last month versus
#' last to last month to capture trend in data for a given comparison period.
#' For example, In Telecommunication it can be used to generate features useful for
#' predicting subscribers who are more likely to decline their revenue next month/week.
#' In Finance it can be used to generate features useful for predicting
#' customers who are going to default next month/week.
#'
#' @param df A tibble or Data frame
#' @param pattern A string representing column pattern
#' @param compare_period A numeric vector of comparison period
#' @param time_filter A numeric vector of time filter
#'
#' @return A vector with calculated percentage change
#' @export
#'
#' @examples
#' calculate_percentage_change(df, "week_payment", compare_period=(1, 1))
#' c(-80, -75, 300)
calculate_percentage_change <- function(df,
                                        pattern,
                                        compare_period = c(2, 2),
                                        time_filter = None) {

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
