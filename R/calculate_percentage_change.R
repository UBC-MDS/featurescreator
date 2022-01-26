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
                                        time_filter = NULL) {
  # Input check
  if (!is.data.frame(df)) {
    stop("Input df must be a dataframe or tibble")
  }

  if (!(is.character(pattern) & length(pattern) == 1)) {
    stop("pattern must be a character vector of length 1")
  }

  if (!(is.numeric(compare_period) & length(compare_period) == 2)) {
    stop("compare_cperiod must be a numeric vector of length 2")
  }

  if ((!is.null(time_filter)) & !(is.numeric(time_filter))) {
    stop("time_filter must be numeric")
  }

  # Get matching columns
  columns <- sort(get_matching_column_names(df, pattern),
                  decreasing = FALSE)

  # Time filter
  if (!is.null(time_filter)) {
    columns <- columns[sort(intersect(time_filter,
                                      as.numeric(sub(
                                        '.*(\\d{1}).*', '\\1', columns
                                      ))))]
    if (length(columns) != length(time_filter)) {
      stop("Column pattern from time_filter is not present in all columns")
    }
  }

  # start, end
  start <- compare_period[1]
  end <- compare_period[2]

  # sum of start and end should not exceed number of columns
  if (start + end > length(columns)) {
    stop("Sum of start period and end period must not exceed total number of columns")
  }

  # Create p1 and p2
  # p1 = sum of columns in period 1
  # p2 = sum of columns in period 2
  # fill na to zero

  df <- df |>
    rowwise() |>
    mutate(p1 = replace_na(sum(c_across(colnames(
      df
    )[colnames(df) %in% columns[1:start]]),
    na.rm = T), 0),
    p2 = replace_na(sum(c_across(colnames(
      df
    )[colnames(df) %in% columns[(start + 1):(start + end)]]),
    na.rm = T) / (end / start), 0))

  # Calculate percentage change
  df <- df |>
    mutate(percent_change = case_when((p1 == 0 & p2 == 0) ~ 0,
                                      p2 == 0 ~ ((p1 - p2) * 100 / 0.01),
                                      TRUE ~ ((p1 - p2) * 100 / p2)))
  df$percent_change
}
