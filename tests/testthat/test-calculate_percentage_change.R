# Test for function calculate_percentage_change

# Create test dataframe
test_df <- tibble::tibble(
  subscriber_id = c(1, 2, 3),
  data_usage1 = c(5, 10, 15),
  data_usage2 = c(20, 10, 10),
  data_usage3 = c(25, 10, 5),
  data_usage4 = c(15, 20, 25)
)

# Type check

# check df
test_that("Type of df must be dataframe or tibble", {
  expect_error(calculate_percentage_change(c(1, 2, 3, 4), "data_usage"))
})

# Check pattern
test_that("pattern must be a string", {
  expect_error(calculate_percentage_change(test_df, c("data_usage", "data_usage")))
})

# Check compare period
test_that("compare_period must be a numeric vector of length 2", {
  expect_error(calculate_percentage_change(test_df, "data_usage",
    compare_period = "1, 1"
  ))
})

# Check time_filter
test_that("time_filter must be a numeric vector of length 2", {
  expect_error(
    calculate_percentage_change(
      test_df,
      "data_usage",
      compare_period = c(1, 1),
      time_filter = "1, 3"
    )
  )
})

# Check value error
test_that("Sum of start period and end period must not exceed total number of columns", {
  expect_error(calculate_percentage_change(test_df, "data_usage",
    compare_period = c(1, 4)
  ))
})

test_that("Column pattern from time_filter is not present in all columns", {
  expect_error(
    calculate_percentage_change(
      test_df,
      "data_usage",
      compare_period = c(1, 1),
      time_filter = c(1, 5)
    )
  )
})

# return type check
test_that("Return type of calculate_percentage_change must be double", {
  expect_type(
    calculate_percentage_change(test_df, "data_usage"),
    "double"
  )
})

test_that("Return type of calculate_percentage_change must be double", {
  expect_type(
    calculate_percentage_change(
      test_df,
      "data_usage",
      compare_period = c(1, 1),
      time_filter = c(1, 3)
    ),
    "double"
  )
})

# Check percentage_change return values
# Value for comparison are calculated manually using a online calculator
test_that("Percentage change with default parameters", {
  expect_equal(
    calculate_percentage_change(test_df, "data_usage"),
    c(-37.5, -33.33333333, -16.66666667)
  )
})

test_that("Percentage change with compare periods", {
  expect_equal(
    calculate_percentage_change(test_df, "data_usage", compare_period = c(1, 2)),
    c(-77.77777778, 0.0, 100.0)
  )
  expect_equal(
    calculate_percentage_change(test_df, "data_usage", compare_period = c(3, 1)),
    c(11.11111111, -50.0, -60.0)
  )
})

test_that("Percentage change with time filter", {
  expect_equal(
    calculate_percentage_change(
      test_df,
      "data_usage",
      compare_period = c(1, 2),
      time_filter = c(1, 3, 4)
    ),
    c(-75.0, -33.33333333, 0.0)
  )
  expect_equal(
    calculate_percentage_change(
      test_df,
      "data_usage",
      compare_period = c(1, 2),
      time_filter = c(4, 2, 1)
    ),
    c(-71.42857143, -33.33333333, -14.28571429)
  )
})
