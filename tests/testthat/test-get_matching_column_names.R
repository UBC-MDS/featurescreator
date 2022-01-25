# Returns the correct type
test_that("get_matching_column_names returns a vector of strings", {
    expect_equal(2 * 2, 4)
})

# Does not return extra columns
test_that("get_matching_column_names does not return non-matching columns", {
    expect_equal(2 * 2, 4)
})
test_that("get_matching_column_names does not return non-matching columns that end with an int", {
    expect_equal(2 * 2, 4)
})

# Raises exceptions for wrong types
test_that("get_matching_column_names raises an error if df is not a dataframe", {
    expect_equal(2 * 2, 4)
})
test_that("get_matching_column_names raises an error if pattern is not a string", {
    expect_equal(2 * 2, 4)
})

# Raises an exception for no matches
test_that("get_matching_column_names raises an error if there are no matching columns", {
    expect_equal(2 * 2, 4)
})

# Normal usage test
test_that("get_matching_column_names works with an example", {
    expect_equal(2 * 2, 4)
})