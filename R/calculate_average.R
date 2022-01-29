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
#'     week_payment1 = c(1, 2, 3),
#'     week_payment2 = c(4, 5, 6),
#'     week_payment3 = c(7, 8, 9),
#'     other_column = c(10, 11, 12)
#' )
#' calculate_average(df, "week_payment")
calculate_average <- function(df, pattern) {
    # check df types
    if (!is.data.frame(df)) {
        stop("The df variable needs to be a dataframe")
    }

    # check pattern type
    if (!is.character(pattern)) {
        stop("The pattern variable needs to be a character type")
    }

    # get matching column names
    colnames <- get_matching_column_names(df, pattern)


    # check if there are matching column names
    if (length(colnames) == 0) {
        stop("No column names found matching pattern")
    }

    # calculate average of colnames
    apply(df[, colnames, drop = F], 1, mean)
}