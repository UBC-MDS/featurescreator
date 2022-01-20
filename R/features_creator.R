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
