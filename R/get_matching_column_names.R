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
    if(!is.data.frame(df)){
        stop("The df variable needs to be a dataframe")
    }
    if(!is.character(pattern)){
        stop("The pattern variable needs to be a character type")
    }
    
    pattern <- paste0(pattern, "[0-9]+")
    # TRUE at index i means col at index i did NOT match
    non_matches <- colnames(df) |>
        stringr::str_match(pattern) |>
        is.na()
    
    if(all(non_matches)){
        stop("No columns matched the given pattern")
    }

    colnames(df)[!non_matches]
}