# create test data frame
df <- data.frame(
  week_payment1 = c(1, 2, 3),
  week_payment2 = c(4, 5, 6),
  week_payment3 = c(7, 8, 9),
  other_column = c(10, 11, 12)
)

# test for df is not a data frame
test_that("calculate_standard_deviation() errors when df is not a data frame", {
  df <- 1
  expect_error(calculate_standard_deviation(df, "week_payment"))
})

# test for pattern is not a character
test_that("calculate_standard_deviation() errors when pattern is not a character", {
  expect_error(calculate_standard_deviation(df, 1))
})

# test for pattern is not found
test_that("calculate_standard_deviation() errors when pattern not found", {
  expect_error(calculate_standard_deviation(df, "no_matching_pattern"))
})

# test for return type
test_that("calculate_standard_deviation() returns a numeric vector", {
  result <- calculate_standard_deviation(df, "week_payment")
  expect_type(result, "double")
})

# test for data frame with only 1 column
test_that("calculate_standard_deviation() returns correct value", {
  df <- data.frame(
    week_payment1 = c(1, 2, 3)
  )
  result <- calculate_standard_deviation(df, "week_payment")
  expect_equal(result, as.double(c(NA, NA, NA)))
})

# test for data frame with only 1 row
test_that("calculate_standard_deviation() returns correct value", {
  df <- data.frame(
    week_payment1 = c(1)
  )
  result <- calculate_standard_deviation(df, "week_payment")
  expect_equal(result, as.double(c(NA)))
})

# test for return correct value
test_that("calculate_standard_deviation() returns correct average", {
  result <- calculate_standard_deviation(df, "week_payment")
  expect_equal(result, c(3, 3, 3))
})
