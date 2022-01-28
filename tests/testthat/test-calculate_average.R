# create test data frame
df <- data.frame(
    week_payment1 = c(1, 2, 3),
    week_payment2 = c(4, 5, 6),
    week_payment3 = c(7, 8, 9),
    other_column = c(10, 11, 12)
    )

test_that("calculate_average() errors when df is not a data frame", {
  df <- 1
  expect_error(calculate_average(df, "week_payment"))
})

test_that("calculate_average() errors when pattern is not a character", {
  expect_error(calculate_average(df, 1))
})

test_that("calculate_average() errors when pattern not found", {
  expect_error(calculate_average(df, "no_matching_pattern"))
})

test_that("calculate_average() returns correct average", {
  result <- calculate_average(df, "week_payment")
  expect_equal(result, c(4, 5, 6))
})
