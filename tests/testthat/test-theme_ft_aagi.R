test_that("theme_ft_aagi applies theme to flextable object", {
  library(flextable)

  tbl <- flextable::flextable(head(mtcars))
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi returns a flextable object", {
  library(flextable)

  tbl <- flextable::flextable(head(mtcars))
  result <- theme_ft_aagi(tbl)

  expect_true(inherits(result, "flextable"))
})

test_that("theme_ft_aagi with airquality dataset", {
  library(flextable)
  library(dplyr)

  tbl <- flextable::flextable(
    head(airquality) |>
      mutate(`Month Name` = "May")
  )

  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi rejects non-flextable objects", {
  skip_if_not_installed("flextable")

  expect_error(
    {
      theme_ft_aagi(head(mtcars))
    },
    regexp = "flextable"
  )
})

test_that("theme_ft_aagi rejects data.frame input", {
  skip_if_not_installed("flextable")

  expect_error(
    {
      theme_ft_aagi(mtcars)
    },
    regexp = "flextable"
  )
})

test_that("theme_ft_aagi rejects list input", {
  skip_if_not_installed("flextable")

  expect_error(
    {
      theme_ft_aagi(list(a = 1, b = 2))
    },
    regexp = "flextable"
  )
})

test_that("theme_ft_aagi is idempotent", {
  library(flextable)

  tbl <- flextable::flextable(head(mtcars))

  themed_once <- theme_ft_aagi(tbl)
  themed_twice <- theme_ft_aagi(themed_once)

  expect_s3_class(themed_twice, "flextable")
})

test_that("theme_ft_aagi works with single row", {
  library(flextable)

  tbl <- flextable::flextable(mtcars[1, ])
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi works with single column", {
  library(flextable)

  tbl <- flextable::flextable(head(mtcars[, 1, drop = FALSE]))
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi with different data types", {
  library(flextable)

  # Test with mixed data types
  df <- data.frame(
    integer_col = c(1, 2, 3),
    character_col = c("a", "b", "c"),
    logical_col = c(TRUE, FALSE, TRUE),
    numeric_col = c(1.5, 2.5, 3.5),
    stringsAsFactors = FALSE
  )

  tbl <- flextable::flextable(df)
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi with NA values", {
  library(flextable)

  df <- data.frame(
    x = c(1, 2, NA),
    y = c("a", NA, "c"),
    z = c(NA, TRUE, FALSE),
    stringsAsFactors = FALSE
  )

  tbl <- flextable::flextable(df)
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi with special characters", {
  library(flextable)

  df <- data.frame(
    col1 = c("Café", "Naïve", "Résumé"),
    col2 = c(1, 2, 3),
    stringsAsFactors = FALSE
  )

  tbl <- flextable::flextable(df)
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi with large dataset", {
  library(flextable)

  # Create larger dataset
  large_df <- head(mtcars, 100)

  tbl <- flextable::flextable(large_df)
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi does not modify input", {
  library(flextable)

  tbl <- flextable::flextable(head(mtcars))
  tbl_copy <- tbl

  # Apply theme
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(tbl, "flextable")
  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi works with piping", {
  library(flextable)
  library(dplyr)

  result <- head(mtcars) |>
    flextable::flextable() |>
    theme_ft_aagi()

  expect_s3_class(result, "flextable")
})

test_that("theme_ft_aagi works with chained flextable operations", {
  library(flextable)

  tbl <- flextable::flextable(head(mtcars))

  # Apply theme and then other operations
  result <- tbl |>
    theme_ft_aagi() |>
    flextable::set_caption("Motor Trend Data")

  expect_s3_class(result, "flextable")
})

test_that("theme_ft_aagi with numeric column names", {
  library(flextable)

  df <- data.frame(
    `1` = c(1, 2, 3),
    `2` = c("a", "b", "c"),
    `3` = c(TRUE, FALSE, TRUE),
    check.names = FALSE
  )

  tbl <- flextable::flextable(df)
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})

test_that("theme_ft_aagi with whitespace in column names", {
  library(flextable)

  df <- data.frame(
    `Column 1` = c(1, 2, 3),
    `Column 2` = c("a", "b", "c"),
    check.names = FALSE
  )

  tbl <- flextable::flextable(df)
  themed_tbl <- theme_ft_aagi(tbl)

  expect_s3_class(themed_tbl, "flextable")
})
