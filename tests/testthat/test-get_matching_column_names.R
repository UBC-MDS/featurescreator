# Helper data
test_df <- data.frame(
    "week_payment1" = c(1, 2, 3),
    "week_payment2" = c(1, 2, 3),
    "week_payment3" = c(1, 2, 3),
    "othercolumn" = c(5, 6, 7),
    "week_payment_string4" = c(5, 6, 7)
)
expected_colnames <- colnames(test_df)[1:3]

# Returns the correct type
test_that("get_matching_column_names returns a vector of characters", {
    expect_type(get_matching_column_names(test_df, "week_payment"), "character")
})

# Does not return extra columns
test_that("get_matching_column_names does not return non-matching columns", {
    expect_false("othercolumn" %in% get_matching_column_names(test_df, "week_payment"))
})
test_that("get_matching_column_names does not return non-matching columns that end with an int", {
    expect_false("week_payment_string4" %in% get_matching_column_names(test_df, "week_payment"))
})

# Raises exceptions for wrong types
test_that("get_matching_column_names raises an error if df is not a dataframe", {
    expect_error(get_matching_column_names("apple", "week_payment"))
})
test_that("get_matching_column_names raises an error if pattern is not a string", {
    expect_error(get_matching_column_names(test_df, c(1, 2, 3)))
})

# Raises an exception for no matches
test_that("get_matching_column_names raises an error if there are no matching columns", {
    expect_error(get_matching_column_names(test_df, "fake_column"))
})

# Normal usage test
test_that("get_matching_column_names works with an example", {
    expect_equal(get_matching_column_names(test_df, "week_payment"), expected_colnames)
})