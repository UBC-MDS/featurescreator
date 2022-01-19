#' Calculate percentage change over a time period
#' (months over months or weeks over weeks)
#' for the given column pattern.
#'
#' Use case:
#' This function aims to generate features to capture trend
#' in data for a given comparison period. Example:
#' Telecommunication - Predict customers who are more likely to decline their revenue next month/week.
#' Finance - Predict customers who are going to default next month/week.

#' @param df A tibble or Data frame
#' @param pattern A string representing column pattern
#' @param compare_period A numeric vector of comparison period
#' @param time_filter A numeric vector of time filter
#'
#' @return A vector with calculated percentage change
#' @export
#'
#' @examples
calculate_percentage_change <- function(df,
                                        pattern,
                                        compare_period = c(2, 2),
                                        time_filter = None) {

}
